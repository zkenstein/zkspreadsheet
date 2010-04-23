/* MergeMatrix.js

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
 * MergeMatrix handle merge on cells
 */
zss.MergeMatrix =  zk.$extends(zk.Object, {
	mergeMatrix: [],
	$init: function (matrix, sheet) {
		this.$supers('$init', arguments);
		this.mergeMatrix = matrix;
		this.sheet = sheet;
	},
	/**
	 * Returns column's merge range
	 * @return array result
	 */
	getRangesByColumn: function (col) {
		var size = this.mergeMatrix.length,
			result = [],
			range;
		for (var i = 0; i < size; i++) {
			range = this.mergeMatrix[i];
			if (range.left <= col && range.right >= col)
				result.push(range);
		}
		return result;
	},
	/**
	 * Returns the left connected column
	 * @param int col column index
	 * @param int top row start index
	 * @param int bottom row end index
	 * @return int col
	 */
	getLeftConnectedColumn: function (col, top, bottom) {
		var size = this.mergeMatrix.length,
			result = [],
			range,
			fzr = this.sheet.frozenRow;
		for (var i = 0; i < size; i++) {
			range = this.mergeMatrix[i];
			if (range.top > fzr && (range.top < top || range.bottom > bottom))
				continue;
			result.push(range);
		}
		
		var conti = true;
		while (conti) {
			conti = false;
			size = result.length;
			for(var i = 0; i < size; i++) {
				range = result[i];
				if (range.left < col && range.right >= col) {
					col = range.left;
					conti = true;
					//TODO a fast way to remove range form result array
					break;
				}
			}
		}
		return col;
	},
	/**
	 * Returns the right connected column
	 * @param int col column index
	 * @param int top row start index
	 * @param int bottom row end index
	 * @return int col 
	 */
	getRightConnectedColumn: function (col, top, bottom) {
		var size = this.mergeMatrix.length,
			result = [],
			range,
			fzr = this.sheet.frozenRow;
		for (var i = 0; i < size; i++) {
			range = this.mergeMatrix[i];
			if (range.top > fzr && (range.top < top || range.bottom > bottom))
				continue;
			result.push(range);
		}
		
		var conti = true;
		while (conti) {
			conti = false;
			size = result.length;
			for (var i = 0; i < size; i++) {
				range = result[i];
				if (range.right > col && range.left <= col) {
					col = range.right;
					conti = true;
					//TODO a fast way to remove range form result array
					break;
				}
			}
		}
		return col;
	},
	/**
	 * Sets the merge range
	 * @param string id
	 * @param int left column start index
	 * @param int top row start index
	 * @param int right column end index
	 * @param int bottom row end index
	 */
	addMergeRange: function(id, left, top, right, bottom) {
		var range = new zss.Range(left, top, right, bottom);
		range.id = id;
		this.mergeMatrix.push(range);
	},
	/**
	 * Remove merge range
	 * @param string id
	 */
	removeMergeRange: function (id) {
		var mm = this.mergeMatrix,
			size = mm.length;
		for (var i = 0; i < size; i++) {
			range = mm[i];
			if (range.id == id) {
				var tail = mm.slice(i + 1, size);
				mm.length = i;
				mm.push.apply(mm,tail);
				break;
			}
		}
	}
});