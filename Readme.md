<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
* [ScriptAppointmentForm.ascx](./CS/WebSite/UserForms/ScriptAppointmentForm.ascx) (VB: [ScriptAppointmentForm.ascx](./VB/WebSite/UserForms/ScriptAppointmentForm.ascx))
* [ScriptAppointmentForm.ascx.cs](./CS/WebSite/UserForms/ScriptAppointmentForm.ascx.cs) (VB: [ScriptAppointmentForm.ascx.vb](./VB/WebSite/UserForms/ScriptAppointmentForm.ascx.vb))
* [ScriptRecurrenceForm.ascx](./CS/WebSite/UserForms/ScriptRecurrenceForm.ascx) (VB: [ScriptRecurrenceForm.ascx](./VB/WebSite/UserForms/ScriptRecurrenceForm.ascx))
* [ScriptRecurrenceForm.ascx.cs](./CS/WebSite/UserForms/ScriptRecurrenceForm.ascx.cs) (VB: [ScriptRecurrenceForm.ascx.vb](./VB/WebSite/UserForms/ScriptRecurrenceForm.ascx.vb))
<!-- default file list end -->
# How to implement a client-side appointment editing form with custom fields


<p>This example illustrates the use of the client-side appointment objects and methods to implement an appointment editing forms with custom fields that operate via client scripts.<br />
In this example, popup menu commands are intercepted by JavaScript functions, which create the <a href="http://documentation.devexpress.com/#AspNet/clsDevExpressWebASPxSchedulerScriptsASPxClientAppointmenttopic">ASPxClientAppointment</a> for the selected interval and resource or use the client Scheduler’s <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerScriptsASPxClientScheduler_GetSelectedAppointmentIdstopic">GetSelectedAppointmentIds</a> and <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerScriptsASPxClientScheduler_GetAppointmentByIdtopic">GetAppointmentById</a> methods to obtain the client appointment. Then, the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerScriptsASPxClientScheduler_RefreshClientAppointmentPropertiestopic">RefreshClientAppointmentProperties</a> method updates the client appointment properties and invokes the scripting appointment form.<br />
The scripting appointment editing form consists of two templates – ScriptAppointmentForm.ascx and ScriptRecurrenceForm.ascx. Their code implements the logic required to populate the form’s controls and update the appointment with new values. When the button on the form is pressed, one of the following methods of the client scheduler: <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerScriptsASPxClientScheduler_UpdateAppointmenttopic">UpdateAppointment</a>, <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerScriptsASPxClientScheduler_InsertAppointmenttopic">InsertAppointment</a> or <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerScriptsASPxClientScheduler_DeleteAppointmenttopic">DeleteAppointment</a> - is called. This method performs a callback using information contained in the client appointment. The appointment is then processed on the server.</p><p>Note that ASPxScheduler versions prior to 9.2.10 demonstrates erroneous behavior of the client-side appointment form concerning the recurrence pattern. Custom fields are not updated when the client form is invoked to edit the series. It is reported as issue <a href="https://www.devexpress.com/Support/Center/p/B143010">Client-side appointment editing form - Custom field isn't updated in recurrence pattern</a>.</p>

<br/>


