/* Row.js

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Mon Apr 23, 2007 17:29:18 AM , Created by sam
}}IS_NOTE

Copyright (C) 2007 Potix Corporation. All Rights Reserved.

{{IS_RIGHT
	This program is distributed under GPL Version 2.0 in the hope that
	it will be useful, but WITHOUT ANY WARRANTY.
}}IS_RIGHT
*/

/**
 * 
 * Row represent a row of the spreadsheet, it also be container that contains cells of the row
 */

/**
 * Row event
 * <ul>
 * 	<li>onRowAdded: when Row attach to DOM</li>
 * </ul>
 */
zss.Row = zk.$extends(zk.Widget, {
	widgetName: 'Row',
	$o: zk.$void, //owner, fellows relationship no needed
	$init: function (sheet, block, row, src) {
		this.$supers(zss.Row, '$init', []); //DO NOT pass "arguments" or all fields will be copied into this Object. 
		
		this.sheet = sheet;
		this.block = block;
		this.src = src;
		this.r = row;
		
		var data = src.getRow(row);
		this.zsh = data.heightId;
		this.cells = [];
	},
	bind_: function () {
		this.$supers(zss.Row, 'bind_', arguments);
		this.comp = this.$n();
		this.fire('onRowAdded');
	},
	unbind_: function () {
		delete this.cells;
		this.comp = this.r = this.zsh = null;
		this.$supers(zss.Row, 'unbind_', arguments);
	},
	/**
	 * Append zss.Cell at the end of the row
	 * 
	 * @param zss.Cell
	 * @param boolean ignoreDom
	 */
	appendCell: function (cell, ignoreDom) {
		this.appendChild(cell, ignoreDom);
		this.cells.push(cell);
	},
	/**
	 * Insert zss.Cell
	 * 
	 * @param int index
	 * @param zss.Cell
	 * @param boolean ignoreDom
	 */
	insertCell: function (index, cell, ignoreDom) {
		var cells = this.cells,
			sibling = cells[index];
		this.insertBefore(cell, sibling, ignoreDom);
		cells.splice(index, 0, cell);
	},
	redraw: function (out) {
		out.push(this.getHtmlPrologHalf())
		var cells = this.cells,
			size = cells.length;
		for (var i = 0; i < size; i++) {
			var cell = cells[i];
			cell.redraw(out);
		}
		out.push(this.getHtmlEpilogHalf());
	},
	getHtmlPrologHalf: function () {
		return '<div id="' + this.uuid + '" class="' + this.getZclass() + '">';
	},
	getHtmlEpilogHalf: function () {
		return '</div>';
	},
	//super//
	getZclass: function () {
		var cls = 'zsrow',
			hId = this.zsh;
		return hId ? cls + ' zsh' + hId : 'zsrow';
	},
	/**
	 * Returns the {@link zss.Cell}
	 * @param int col column
	 * @return zss.Cell
	 */
	getCell: function (col) {
		var size = this.cells.length,
			i = 0;
		//TODO use binary search
		for (i = 0; i < size; i++) {
			if (this.cells[i].c == col) return this.cells[i];
		}
	},
	/**
	 * Returns the {@link zss.Cell}
	 * @param int index column index
	 * @return zss.Cell
	 */
	getCellAt: function (index) {
		return this.cells[index];
	},
	/**
	 * Remove cell
	 * @param int size
	 */
	removeLeftCell: function (size) {
		var cells = this.cells;
		var beforeSize = cells.length;
		while (size--) {
			if (!cells.length)
				return;
			cells.shift().detach();
		}
	},
	/**
	 * Remove right cell
	 * @param int size
	 */
	removeRightCell: function (size) {
		var cells = this.cells;
		while (size--) {
			if (!cells.length)
				return;
			cells.pop().detach();
		}
	},
	/**
	 * Sets the width position index
	 * @param int index cell index
	 * @param int zsw the width position index
	 */
	appendZSW: function (index, zsw) {
		var cell = this.cells[index];
		cell.appendZSW(zsw);
	},
	/**
	 * Sets the height position index
	 * @param int zsh the height position index
	 */
	appendZSH: function (zsh) {
		this.zsh = zsh;
		jq(this.comp).addClass("zsh" + zsh);
		var size = this.cells.length;
		for (var i = 0; i < size; i++)
			this.cells[i].appendZSH(zsh);
	},
	/**
	 * Insert new cell
	 * @param int index cell index
	 * @param int size
	 */
	insertNewCell: function (index, size) {
		var sheet = this.sheet,
			ctrl,
			cells = this.cells,
			col;
		
		if (index > cells.length) return;
		
		//there is a pentional BUG, if index==0 , not template to copy previous format
		//however, for now, the only templat need to copy is overflow and merge cell, 
		//and it is never be care if previous not beend loaded in client.
		var tempcell = index == 0 ? null : cells[index - 1];
		col = index == 0 ? cells[0].c :(tempcell.c + 1);
		
		var block = this.block,
			src = this.src,
			r = this.r;
		
		for (var i = 0; i < size; i++) {
			var c = col + i;
			
			//don't care merge property, it will be sync by removeMergeRange and addMergeRange.
			//don't care the sytle, since cell should be updated by continus updatecell event.
			ctrl = new zss.Cell(sheet, block, r, c, src);
			
			//because of overflow logic, we must maintain overflow link from overhead
			//copy over flow attrbute overby and overhead,
			if (tempcell) {
				if (tempcell.overflowed) ctrl.overlapBy = tempcell;
				else if(tempcell.overlapBy) ctrl.overlapBy = tempcell.overlapBy;
			}
			this.insertCell(index + i, ctrl);
		}
		this.shiftCellInfo(index + size, col + size);
	},
	/**
	 * Shift cell's info
	 * @param int index the start index of the cell
	 * @param int newcol new column index
	 */
	shiftCellInfo: function (index, newcol) {
		var cells = this.cells,
			size = cells.length,
			j = 0;
		for(var i = index; i < size; i++)
			cells[i].resetColumnIndex(newcol+(j++));
	},
	/**
	 * Sets the row index
	 * @param int newrow new row index
	 */
	resetRowIndex: function (newrow) {
		this.r = newrow;
		var cells = this.cells,
			i = cells.length;
		while (i--)
			cells[i].resetRowIndex(newrow);
	},
	/**
	 * Remove the cell of the row
	 * @param int index cell index
	 * @param int size
	 */
	removeCell: function (index, size) {
		var ctrl,
			cells = this.cells,
			col;
		
		if (index > cells.length) return;
		if (index == cells.length)
			col = cells[index - 1].c + 1 ;
		else
			col = cells[index].c;

		var rem = cells.slice(index, index + size),
			tail = cells.slice(index + size, cells.length);
		cells.length = index;
		cells.push.apply(cells, tail);
		
		var cell = rem.pop();
		for (;cell ; cell = rem.pop()) {
			cell.detach();
		}
			
		this.shiftCellInfo(index, col);
	}
}, {
	/**
	 * Returns a row that copy cells from target
	 * @param zss.Row tmprow a target row to copy it's cells
	 * @return string zss.Cell's html content
	 */
	copyCells: function (srcRow, destRow) {
		var cells = srcRow.cells;
			size = cells.length,
			r = destRow.r,
			html = '';
		for (var i = 0; i < size; i++) {
			var srcCell = cells[i],
				c = srcCell.c,
				src = srcCell.src,
				block = srcCell.block,
				sht = srcCell.sheet,
				newCell = new zss.Cell(sht, block, r, c, src);
			html += newCell.getHtml();
			destRow.appendCell(newCell);
		}
		return html;
	}
});
