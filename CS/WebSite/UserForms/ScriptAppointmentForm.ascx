<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ScriptAppointmentForm.ascx.cs" Inherits="UserForms_ScriptAppointmentForm" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxScheduler.Controls" TagPrefix="dxsc" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Src="~/UserForms/ScriptRecurrenceForm.ascx" TagName="RecurrenceControl" TagPrefix="recur" %>
<table class="dxscAppointmentForm" cellpadding="0" cellspacing="0" style="width: 500px;
    height: 100px;">
    <tr>
        <td class="dxscDoubleCell" colspan="2">
            <table class="dxscLabelControlPair" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="dxscLabelCell">
                        <dxe:ASPxLabel ID="lblSubject" runat="server" AssociatedControlID="tbSubject" Text="Subject:">
                        </dxe:ASPxLabel>
                    </td>
                    <td class="dxscControlCell">
                        <dxe:ASPxTextBox ID="tbSubject" runat="server" Width="100%" EnableClientSideAPI="true"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="dxscSingleCell">
            <table class="dxscLabelControlPair" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="dxscLabelCell">
                        <dxe:ASPxLabel ID="lblLocation" runat="server" AssociatedControlID="tbLocation" Text="Location:">
                        </dxe:ASPxLabel>
                    </td>
                    <td class="dxscControlCell">
                        <dxe:ASPxTextBox ID="tbLocation" runat="server" Width="100%" EnableClientSideAPI="true"/>
                    </td>
                </tr>
            </table>
        </td>
        <td class="dxscSingleCell">
            <table class="dxscLabelControlPair" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="dxscLabelCell" style="padding-left: 25px;">
                        <dxe:ASPxLabel ID="lblLabel" runat="server" AssociatedControlID="edtLabel" Text="Label:">
                        </dxe:ASPxLabel>
                    </td>
                    <td class="dxscControlCell">
                        <dxe:ASPxComboBox ID="edtLabel" runat="server" Width="100%" DataSource='<%# LabelDataSource %>' />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="dxscSingleCell">
            <table class="dxscLabelControlPair" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="dxscLabelCell">
                        <dxe:ASPxLabel ID="lblStartDate" runat="server" AssociatedControlID="edtStartDate"
                            Text="Start time:">
                        </dxe:ASPxLabel>
                    </td>
                    <td class="dxscControlCell">
                        <dxe:ASPxDateEdit ID="edtStartDate" runat="server"
                            Width="100%" EditFormat="DateTime" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="dxscSingleCell">
            <table class="dxscLabelControlPair" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="dxscLabelCell" style="padding-left: 25px;">
                        <dxe:ASPxLabel runat="server" ID="lblEndDate" Text="End time:" AssociatedControlID="edtEndDate" />
                    </td>
                    <td class="dxscControlCell">
                        <dxe:ASPxDateEdit ID="edtEndDate" runat="server" EditFormat="DateTime" Width="100%">
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="dxscSingleCell">
            <table class="dxscLabelControlPair" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="dxscLabelCell">
                        <dxe:ASPxLabel ID="lblStatus" runat="server" AssociatedControlID="edtStatus" Text="Show time as:">
                        </dxe:ASPxLabel>
                    </td>
                    <td class="dxscControlCell">
                        <dxe:ASPxComboBox ID="edtStatus" runat="server" Width="100%" DataSource='<%# StatusDataSource %>' />
                    </td>
                </tr>
            </table>
        </td>
        <td class="dxscSingleCell" style="padding-left: 22px;">
            <table class="dxscLabelControlPair" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 20px; height: 20px;">
                        <dxe:ASPxCheckBox ID="chkAllDay" runat="server" />
                    </td>
                    <td style="padding-left: 2px;">
                        <dxe:ASPxLabel ID="lblAllDay" runat="server" Text="All day event" AssociatedControlID="chkAllDay" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="dxscSingleCell">
            <table class="dxscLabelControlPair" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="dxscLabelCell">
                        <dxe:ASPxLabel ID="lblResource" runat="server" AssociatedControlID="edtResource" Text="Resource:">
                        </dxe:ASPxLabel>
                    </td>
                    <td class="dxscControlCell">
                        <dxe:ASPxComboBox ID="edtResource" runat="server" Width="100%" DataSource='<%# ResourceDataSource %>'/>
                    </td>
                </tr>
            </table>
        </td>
        <td class="dxscSingleCell"> 
            <table class="dxscLabelControlPair" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="dxscLabelCell" style="padding-left: 25px;">
                        <dxe:ASPxLabel ID="lblPrice" runat="server" AssociatedControlID="edtPrice" Text="Price:">
                        </dxe:ASPxLabel>
                    </td>
                    <td class="dxscControlCell">
                        <dxe:ASPxTextBox ID="edtPrice" runat="server" Width="100%">
                        </dxe:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="dxscDoubleCell" colspan="2" style="height: 90px;">
            <dxe:ASPxMemo ID="tbDescription" runat="server" Width="100%" Rows="6" EnableClientSideAPI="true" />
            &nbsp;
        </td>
    </tr>
</table>
<dxe:ASPxCheckBox id="chkRecurrence" runat="server" Text="Recurrence">
</dxe:ASPxCheckBox>
<recur:RecurrenceControl runat="server" ID="recurrenceControl">
</recur:RecurrenceControl>
<table cellpadding="0" cellspacing="0" style="width: 500px; height: 35px;">
    <tr>
        <td style="width: 100%; height: 100%;" align="center">
            <table style="height: 100%;">
                <tr>
                    <td>
                        <dxe:ASPxButton runat="server" ID="btnOk" Text="OK" UseSubmitBehavior="false"
                            AutoPostBack="false" EnableViewState="false" Width="91px" />
                    </td>
                    <td>
                        <dxe:ASPxButton runat="server" ID="btnCancel" Text="Cancel"
                            UseSubmitBehavior="false" AutoPostBack="false" EnableViewState="false" Width="91px"
                            CausesValidation="False" />
                    </td>
                    <td>
                        <dxe:ASPxButton runat="server" ID="btnDelete" Text="Delete" EnableClientSideApi="true"
                            UseSubmitBehavior="false" AutoPostBack="false" EnableViewState="false" Width="91px" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script id="dxss_ASPxSchedulerClientAppoinmentForm" type="text/javascript"><!--
    ASPxClientAppointmentForm = ASPx.CreateClass(ASPxClientFormBase, {
        Initialize: function() {
            this.controls.btnOk.Click.AddHandler(ASPx.CreateDelegate(this.OnBtnOkClick, this));
            this.controls.btnCancel.Click.AddHandler(ASPx.CreateDelegate(this.OnBtnCancelClick, this));
            this.controls.btnDelete.Click.AddHandler(ASPx.CreateDelegate(this.OnBtnDeleteClick, this));           
            this.controls.chkRecurrence.CheckedChanged.AddHandler(ASPx.CreateDelegate(this.OnChkRecurrenceChanged, this));
        },
        OnBtnOkClick: function(s, e) {
            var apt = this.Parse();
            this.Close();
            if (apt.appointmentId) 
                this.scheduler.UpdateAppointment(apt);
            else {
                this.scheduler.InsertAppointment(apt);
           }
        },
        OnBtnCancelClick: function(s, e) {
            this.Close();
        },
        OnBtnDeleteClick: function(s, e) {
            var apt = this.Parse();
            this.Close();
            this.scheduler.DeleteAppointment(apt);
        },
        OnChkRecurrenceChanged: function(s, e) {
            var isChecked = s.GetChecked();
            this.controls.recurrenceControl.SetVisible(isChecked);
        },
        Parse: function() {
            var start = this.controls.edtStartDate.GetDate();
            var end = this.controls.edtEndDate.GetDate();
            var subject = this.controls.tbSubject.GetText();
            var description = this.controls.tbDescription.GetText();
            var location = this.controls.tbLocation.GetText();
            var labelId = this.controls.edtLabel.GetValue();
            var statusId = this.controls.edtStatus.GetValue();
            var allDay = this.controls.chkAllDay.GetChecked();
            var resourceId = this.controls.edtResource.GetValue();
            var price = this.controls.edtPrice.GetValue();

            var apt = new ASPxClientAppointment();
            apt.SetAppointmentType(ASPxAppointmentType.Normal);
            apt.SetStart(start);
            apt.SetEnd(end);
            apt.SetSubject(subject);
            apt.SetDescription(description);
            apt.SetLocation(location);
            apt.SetLabelId(labelId);
            apt.SetStatusId(statusId);
            apt.SetAllDay(allDay);
            apt.AddResource(resourceId);
            apt.Price = price;
            if (this.appointmentCopy && this.appointmentCopy.GetId()) 
                apt.SetId(this.appointmentCopy.GetId());
            if (this.controls.chkRecurrence.GetChecked()) {
                apt.SetAppointmentType(ASPxAppointmentType.Pattern);
                var recurrenceInfo = this.controls.recurrenceControl.Parse();
                apt.SetRecurrenceInfo(recurrenceInfo);
            }
	        return apt;
        },
        Update: function(apt) {
            this.appointmentCopy = apt;

            this.controls.edtPrice.SetText(apt.Price);
            
            this.controls.edtStartDate.SetDate(apt.GetStart());
            this.controls.edtEndDate.SetDate(apt.GetEnd());
            this.controls.tbDescription.SetText(apt.GetDescription());
            this.controls.tbSubject.SetText(apt.GetSubject());
            this.controls.chkAllDay.SetChecked(apt.GetAllDay());
            this.controls.edtLabel.SetValue(apt.GetLabelId());
            this.controls.edtStatus.SetValue(apt.GetStatusId());
            this.controls.tbLocation.SetText(apt.GetLocation());
            var resourceIdValue = apt.GetResource(0);
            resourceIdValue = (resourceIdValue == null) ? "null" : resourceIdValue;
            this.controls.edtResource.SetValue(resourceIdValue);
            var appointmentType = apt.GetAppointmentType();
            if (appointmentType) {
                if (appointmentType == ASPxAppointmentType.Normal || appointmentType == ASPxAppointmentType.Pattern) {
                    this.controls.chkRecurrence.SetVisible(true);    
                    if (appointmentType == ASPxAppointmentType.Pattern) {
                        this.controls.recurrenceControl.SetVisible(true);
                        this.controls.chkRecurrence.SetVisible(true);
                        this.controls.chkRecurrence.SetChecked(true);
                        this.controls.recurrenceControl.Update(apt.GetRecurrenceInfo());
                    }
                }
                else {
                    this.controls.chkRecurrence.SetVisible(false);
                }
            }
            this.controls.btnDelete.SetEnabled((apt.GetId()) ? true : false);
        },
        Clear: function() {
            this.controls.edtStartDate.SetDate();
            this.controls.edtEndDate.SetDate();
            this.controls.tbDescription.SetText('');
            this.controls.tbSubject.SetText('');
            this.controls.chkAllDay.SetChecked(false);
            this.controls.edtLabel.SetValue()
            this.controls.edtStatus.SetValue()
            this.controls.tbLocation.SetText('');
            this.controls.chkRecurrence.SetChecked(false);
            this.controls.edtResource.SetValue();
            this.controls.recurrenceControl.Clear();
        }
    });
//--></script>
