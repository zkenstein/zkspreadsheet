/* CellSelector.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Sep 17, 2010 5:15:02 PM , Created by Sam
}}IS_NOTE

Copyright (C) 2009 Potix Corporation. All Rights Reserved.

{{IS_RIGHT
	This program is distributed under GPL Version 3.0 in the hope that
	it will be useful, but WITHOUT ANY WARRANTY.
}}IS_RIGHT
*/
package org.zkoss.zss.ui.impl;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.zkoss.poi.ss.usermodel.Cell;
import org.zkoss.zss.model.Worksheet;
import org.zkoss.zss.ui.Rect;

/**
 * Internal Use Only.
 * @author Sam, Ian Tsai
 *
 */
public class CellSelector {

	private CellFilter decorator;
	
	/**
	 * add a Filter into this cell selector.
	 * @param cellFilter
	 * @return this
	 */
	public CellSelector addFilter(final CellFilter cellFilter) {
		if (decorator == null) {
			decorator = cellFilter;
		} else {
			decorator = new CellFilter() {
				public boolean doFilter(CellVisitorContext context) {
					if (decorator.doFilter(context)) {
						return cellFilter.doFilter(context);
					}
					return false;
				}
			};
		}
		return this;
	}

	public void doVisit(Worksheet sheet, Rect rect, CellVisitor vistor){
		for (int row = rect.getTop(); row <= rect.getBottom(); row++) {
			for (int col = rect.getLeft(); col <= rect.getRight(); col++) {
				CellVisitorContext context = new CellVisitorContext(sheet, row, col);
				if (decorator != null) {
					decorator.doFilter(context);
				}
				vistor.handle(context);
			}
		}
	}	
	
	public List<Cell> execute(Worksheet sheet, Rect rect){
		final List<Cell> cells = new LinkedList<Cell>();
		doVisit(sheet, rect, new CellVisitor() {
			public void handle(CellVisitorContext context) {
				cells.add(context.getOrCreateCell());
			}
		});
		return cells;
	}
}