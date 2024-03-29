/* StartEditingEvent.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2009/1/9 kindalu
}}IS_NOTE

Copyright (C) 2007 Potix Corporation. All Rights Reserved.

{{IS_RIGHT
	This program is distributed under GPL Version 2.0 in the hope that
	it will be useful, but WITHOUT ANY WARRANTY.
}}IS_RIGHT
*/
package org.zkoss.zss.ui.event;

import org.zkoss.poi.ss.usermodel.Sheet;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.event.Event;
//import org.zkoss.zss.model.Sheet;

/**
 * @author kinda
 *
 */
public class EditboxEditingEvent extends Event{

	private Sheet _sheet;
	
	Object _editingValue;
	
	public EditboxEditingEvent(String name, Component target,Sheet sheet,Object clientvalue) {
		super(name, target, sheet);
		_sheet = sheet;
		this._editingValue = clientvalue;
	}
	
	public Object getEditingValue(){
		return _editingValue;
	}
	
	public Sheet getSheet(){
		return _sheet;
	}
}
