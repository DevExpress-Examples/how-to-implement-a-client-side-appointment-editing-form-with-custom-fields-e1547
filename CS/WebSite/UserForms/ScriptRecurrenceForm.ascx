<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ScriptRecurrenceForm.ascx.cs" Inherits="UserForms_ScriptRecurrenceForm" %>
<%@ Register Assembly="DevExpress.Web.v15.2" Namespace="DevExpress.Web"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2" Namespace="DevExpress.Web.ASPxScheduler.Controls"
    TagPrefix="dxwschsc" %>
<div id="mainDiv">
<table>
    <tr>
        <td>
            <dxwschsc:RecurrenceTypeEdit ID="edtRecurrenceTypeEdit" runat="server" ItemSpacing="10px" SelectedIndex="0" Border-BorderWidth="0px">
            </dxwschsc:RecurrenceTypeEdit>
        </td>
        <td>
            <dxwschsc:DailyRecurrenceControl ID="edtDailyRecurrenceControl" runat="server" ClientVisible="false">
            </dxwschsc:DailyRecurrenceControl>
            <dxwschsc:WeeklyRecurrenceControl ID="edtWeeklyRecurrenceControl" runat="server" ClientVisible="false">
            </dxwschsc:WeeklyRecurrenceControl>
            <dxwschsc:MonthlyRecurrenceControl ID="edtMonthlyRecurrenceControl" runat="server" ClientVisible="false">
            </dxwschsc:MonthlyRecurrenceControl>
            <dxwschsc:YearlyRecurrenceControl ID="edtYearlyRecurrenceControl" runat="server" ClientVisible="false">
            </dxwschsc:YearlyRecurrenceControl>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dxwschsc:RecurrenceRangeControl ID="edtRecurrenceRangeControl" runat="server" >
            </dxwschsc:RecurrenceRangeControl>
        </td>
    </tr>
</table>
</div>
<script id="dxss_ASPxSchedulerClientRecurrenceForm" type="text/javascript"><!--
    ASPxClientRecurrenceAppointmentForm = ASPx.CreateClass(ASPxClientFormBase, {    
        Initialize: function() {
            this.defaultRecurrenceInfo = new ASPxClientRecurrenceInfo();
            this.controls.edtRecurrenceTypeEdit.SetSelectedIndex(0);
            this.controls.edtDailyRecurrenceControl.SetClientVisible(true);
            this.recurrenceEditors = new Object();
            this.recurrenceEditors[ASPxClientRecurrenceType.Daily] = this.controls.edtDailyRecurrenceControl;
            this.recurrenceEditors[ASPxClientRecurrenceType.Weekly] = this.controls.edtWeeklyRecurrenceControl;
            this.recurrenceEditors[ASPxClientRecurrenceType.Monthly] = this.controls.edtMonthlyRecurrenceControl;
            this.recurrenceEditors[ASPxClientRecurrenceType.Yearly] = this.controls.edtYearlyRecurrenceControl;
            
            this.controls.edtRecurrenceTypeEdit.SelectedIndexChanged.AddHandler(ASPx.CreateDelegate(this.OnEdtRecurrenceTypeEditSelectedIndexChanged, this));
        },
        OnEdtRecurrenceTypeEditSelectedIndexChanged: function(s, e) {
            for(var editor in this.recurrenceEditors) 
                this.recurrenceEditors[editor].SetClientVisible(false);
            var activeEditor = this.recurrenceEditors[this.controls.edtRecurrenceTypeEdit.recurrenceType];
            activeEditor.SetClientVisible(true);
        },
        Parse: function() {
            var recurrenceInfo = new ASPxClientRecurrenceInfo();
            var recurrenceType = this.controls.edtRecurrenceTypeEdit.GetRecurrenceType();
            recurrenceInfo.SetRecurrenceType(recurrenceType);
            
            var valueAccessor = this.recurrenceEditors[recurrenceInfo.type].valueAccessor;
            recurrenceInfo.SetDayNumber(valueAccessor.GetDayNumber());
            recurrenceInfo.SetPeriodicity(valueAccessor.GetPeriodicity());
            recurrenceInfo.SetMonth(valueAccessor.GetMonth());
            recurrenceInfo.SetWeekDays(valueAccessor.GetWeekDays());
            recurrenceInfo.SetWeekOfMonth(valueAccessor.GetWeekOfMonth());
            
            recurrenceInfo.SetRange(this.controls.edtRecurrenceRangeControl.GetRange());
            recurrenceInfo.SetOccurrenceCount(this.controls.edtRecurrenceRangeControl.GetOccurrenceCount());
            recurrenceInfo.SetStart(this.controls.edtRecurrenceRangeControl.GetEndDate());
            recurrenceInfo.SetEnd(this.controls.edtRecurrenceRangeControl.GetEndDate());
            return recurrenceInfo;
        },
        Update: function(recurrenceInfo) {
            if (!recurrenceInfo)
                return;
            var recurrenceTypeToHide = this.controls.edtRecurrenceTypeEdit.GetRecurrenceType();
            this.controls.edtRecurrenceTypeEdit.SetRecurrenceType(recurrenceInfo.type);
            this.recurrenceEditors[recurrenceTypeToHide].SetVisible(false);
            this.recurrenceEditors[recurrenceInfo.type].SetVisible(true);
                        
            this.controls.edtRecurrenceRangeControl.SetRange(recurrenceInfo.range);
            this.controls.edtRecurrenceRangeControl.SetOccurrenceCount(recurrenceInfo.occurrenceCount);
            this.controls.edtRecurrenceRangeControl.SetEndDate(recurrenceInfo.interval.GetEnd());
    
            for(var editorType in this.recurrenceEditors) { 
                var editor = this.recurrenceEditors[editorType];
                var actualRecurrenceInfo = (editorType == recurrenceInfo.type) ? recurrenceInfo : this.defaultRecurrenceInfo;
                editor.Update(actualRecurrenceInfo);
            }
        },
        Clear: function() {
            this.Update(this.defaultRecurrenceInfo);
            this.SetVisible(false);
        },
        SetVisible: function(isVisible) {
            var element = ASPx.GetElementById('mainDiv');
            this.SetVisibleCore(element, isVisible);
        }
    });
//--></script>
