<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v9.2, Version=9.2.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v9.2.Core, Version=9.2.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.XtraScheduler" TagPrefix="dxschsc" %>
<%@ Register Src="~/UserForms/ScriptAppointmentForm.ascx" TagName="ScriptAppointmentForm" TagPrefix="form" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Src="~/DefaultObjectDataSource.ascx" TagPrefix="demo" TagName="ObjectDataSource" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<script type="text/javascript"><!--
	function OnMenuItemClick(s, e) {
		e.handled = true;
		switch(e.itemName) {
			case SchedulerMenuItemId.NewAppointment:
				NewAppointment(scheduler);
				break;
			case SchedulerMenuItemId.NewRecurringAppointment:
				NewRecurringAppointment(scheduler);
				break;
			case SchedulerMenuItemId.NewAllDayEvent:
				NewAllDayEvent(scheduler);
				break;
			case SchedulerMenuItemId.NewRecurringEvent:
				NewRecurringEvent(scheduler);
				break;
			case SchedulerMenuItemId.OpenAppointment:
				OpenAppointment(scheduler);
				break;
			case SchedulerMenuItemId.EditSeries:
				EditSeries(scheduler);
				break;
			default:
				e.handled = false;    
		}
	}
	function OpenAppointment(scheduler) {
		var apt = GetSelectedAppointment(scheduler);
		scheduler.RefreshClientAppointmentProperties(apt, AppointmentPropertyNames.Normal + ";Price", OnAppointmentRefresh);
	}
	function EditSeries(scheduler) {
		var apt = GetSelectedAppointment(scheduler);
		scheduler.RefreshClientAppointmentProperties(apt, AppointmentPropertyNames.Pattern + ";Price", OnAppointmentEditSeriesRefresh);                        
	}
	function OnAppointmentRefresh(apt) {
		ShowAppointmentForm(apt);
	}
	function OnAppointmentEditSeriesRefresh(apt) {
		if (apt.GetRecurrencePattern()) {
                                   var pattern = apt.GetRecurrencePattern();
                                   ShowAppointmentForm(pattern);
                                }
	}
	function NewAppointment(scheduler) {
		var apt = CreateAppointment(scheduler)
		ShowAppointmentForm(apt);
	}
	function NewRecurringAppointment(scheduler) {
		var apt = CreateRecurringAppointment(scheduler);
		ShowAppointmentForm(apt);
	}
	function NewRecurringEvent(scheduler) {
		var apt = CreateRecurringEvent(scheduler);
		ShowAppointmentForm(apt);
	}
	function NewAllDayEvent(scheduler) {
		var apt = CreateAllDayEvent(scheduler);
		ShowAppointmentForm(apt);
	}            
	function ShowAppointmentForm(apt) {
		MyScriptForm.Clear();
		MyScriptForm.Update(apt);
		if (apt.GetSubject() != "") 
			myFormPopup.SetHeaderText(apt.GetSubject() +" - Appointment");
		else
			myFormPopup.SetHeaderText("Untitled - Appointment");
		myFormPopup.Show();
	}
	function CloseAppointmentForm() {
		myFormPopup.Hide();
		myFormPopup.SetSize(0,0);
	}
	function CreateAppointment(scheduler) {
		var apt = new ASPxClientAppointment();
		var selectedInterval = scheduler.GetSelectedInterval();
		apt.SetStart(selectedInterval.GetStart());
		apt.SetEnd(selectedInterval.GetEnd());
		apt.AddResource(scheduler.GetSelectedResource());
		apt.SetLabelId(0);
		apt.SetStatusId(0);
		return apt;
	}
	function CreateRecurringAppointment(scheduler) {
		var apt = CreateAppointment(scheduler);
		apt.SetAppointmentType(ASPxAppointmentType.Pattern);
		var recurrenceInfo = new ASPxClientRecurrenceInfo();
		recurrenceInfo.SetStart(apt.GetStart());
		recurrenceInfo.SetEnd(apt.GetEnd());
		apt.SetRecurrenceInfo(recurrenceInfo);
		return apt;
	}
	function CreateAllDayEvent(scheduler) {
		var apt = CreateAppointment(scheduler);
		var start = apt.interval.start;
		var today = new Date(start.getFullYear(), start.getMonth(), start.getDate());
		apt.SetStart(today);
		apt.SetDuration(24 * 60 * 60 * 1000);
		apt.SetAllDay(true);
		return apt;
	}
	function CreateRecurringEvent(scheduler) {
		var apt = CreateAllDayEvent(scheduler);
		apt.SetAppointmentType(ASPxAppointmentType.Pattern);
		var recurrenceInfo = new ASPxClientRecurrenceInfo();
		recurrenceInfo.SetStart(apt.GetStart());
		recurrenceInfo.SetEnd(apt.GetEnd());
		apt.SetRecurrenceInfo(recurrenceInfo);
		return apt;
	}
	function GetSelectedAppointment(scheduler) {
		var aptIds = scheduler.GetSelectedAppointmentIds();
		if (aptIds.length == 0)
			return;
		var apt = scheduler.GetAppointmentById(aptIds[0]);



		return apt;
	}
//--></script>
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<demo:ObjectDataSource runat="server" ID="objectDataSource" SessionName="test" />
		<asp:SqlDataSource ID="CarsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:XtraCarsConnectionString %>"
			SelectCommand="SELECT [ID], [Model] FROM [Cars]"></asp:SqlDataSource>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<br />
		<dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ClientInstanceName="scheduler" 
			ActiveViewType="Timeline" GroupType="Resource" OnBeforeExecuteCallbackCommand="ASPxScheduler1_BeforeExecuteCallbackCommand">         
			<ClientSideEvents MenuItemClicked="function(s, e) { OnMenuItemClick(s,e); }"/>
			<Views>
				<DayView ResourcesPerPage="3">
					<DayViewStyles ScrollAreaHeight="400px">
					</DayViewStyles>
				</DayView>
				<MonthView NavigationButtonVisibility="Always" ResourcesPerPage="3">
				</MonthView>
				<TimelineView ResourcesPerPage="3">
					<AppointmentDisplayOptions AppointmentAutoHeight="True" />
				</TimelineView>
			</Views>
		</dxwschs:ASPxScheduler>

	   <dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="myFormPopup" AllowDragging="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" EnableAnimation="false" Width="0px" Height="0px" Modal="true" CloseAction="CloseButton">
		<ContentCollection>
			<dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
				<form:ScriptAppointmentForm runat="server"  ID="AppointmentForm" SchedulerId="ASPxScheduler1" ClientInstanceName="MyScriptForm" ClientSideEvents-FormClosed="function(s, e) { CloseAppointmentForm();}" />
			</dxpc:PopupControlContentControl>
		</ContentCollection>
	</dxpc:ASPxPopupControl>
	</div>
	</form>
</body>
</html>