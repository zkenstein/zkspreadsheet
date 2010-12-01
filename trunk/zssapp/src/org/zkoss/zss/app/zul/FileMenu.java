/* FileMenu.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Nov 23, 2010 5:43:38 PM , Created by Sam
}}IS_NOTE

Copyright (C) 2009 Potix Corporation. All Rights Reserved.

*/
package org.zkoss.zss.app.zul;

import org.zkoss.zk.ui.Components;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.IdSpace;
import org.zkoss.zk.ui.UiException;
import org.zkoss.zss.app.Consts;
import org.zkoss.zss.app.file.FileHelper;
import org.zkoss.zss.app.zul.ctrl.DesktopWorkbenchContext;
import org.zkoss.zss.app.zul.ctrl.WorkspaceContext;
import org.zkoss.zul.Menu;
import org.zkoss.zul.Menuitem;
import org.zkoss.zul.Menupopup;

/**
 * 
 * @author sam
 *
 */
public class FileMenu extends Menu implements IdSpace {
	
	private Menupopup fileMenupopup;
	private Menuitem newFile;
	private Menuitem openFile;

	//TODO: not implement yet
	private Menuitem saveFile;
	private Menuitem saveFileAs;
	private Menuitem saveFileAndClose;
	//TODO: permission control
	private Menuitem deleteFile;
	private Menuitem importFile;
	private Menuitem exportToPdf;
	private Menuitem fileReversion;
	private Menuitem print;

	
	public FileMenu() {
		Executions.createComponents(Consts._FileMenu_zul, this, null);
		Components.wireVariables(this, this, '$', true, true);
		Components.addForwards(this, this, '$');

		importFile.setDisabled(!FileHelper.hasImportPermission());
	}
	
	public void onClick$newFile() {
		WorkspaceContext.getInstance(getDesktop()).openNew();
	}
	
	public void onClick$openFile() {
		FileHelper.createOpenFileDialog(null);
	}
	
	public void onClick$saveFile() {
		throw new UiException("save file not implement yet");
	}
	
	public void onClick$saveFileAs() {
		throw new UiException("save is not implement yet");
	}
	
	public void onClick$saveFileAndClose() {
		throw new UiException("save and close is not implement yet");
	}
	
	public void onClick$deleteFile() {
		throw new UiException("delete file not implmented yet");
		//FileHelper.deleteSpreadsheet(ss);
	}
	
	public void onClick$importFile() {
		FileHelper.createImportFileDialog(null);
	}
	
	public void onClick$exportToPdf() {
		getDesktopWorkbenchContext().getWorkbenchCtrl().openExportPdfDialog();
	}
	
	public void onClick$fileReversion() {
		throw new UiException("reversion not implement yet");
	}
	
	public void onClick$print() {
		throw new UiException("print not implement yet");
	}
	
	public void onOpen$fileMenupopup() {
		getDesktopWorkbenchContext().getWorkbookCtrl().reGainFocus();
	}
	
	protected DesktopWorkbenchContext getDesktopWorkbenchContext() {
		return DesktopWorkbenchContext.getInstance(Executions.getCurrent().getDesktop());
	}
}