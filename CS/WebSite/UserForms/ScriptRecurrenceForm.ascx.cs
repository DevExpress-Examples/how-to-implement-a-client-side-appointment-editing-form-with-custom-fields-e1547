using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxScheduler;

public partial class UserForms_ScriptRecurrenceForm : ASPxSchedulerClientFormBase {
    public override string ClassName { get { return "ASPxClientRecurrenceAppointmentForm"; } }

    protected override Control[] GetChildControls() {
        Control[] controls = new Control[] { edtDailyRecurrenceControl, edtWeeklyRecurrenceControl, 
            edtMonthlyRecurrenceControl, edtYearlyRecurrenceControl, 
            edtRecurrenceTypeEdit, edtRecurrenceRangeControl};
        return controls;
    }
}
