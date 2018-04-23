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
using DevExpress.XtraScheduler;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Internal;
using System.Drawing;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page {

	protected void Page_Load(object sender, EventArgs e) {
        // Data binding should be performed manually
        DataHelper.SetupDefaultMappings(ASPxScheduler1);
        DataHelper.ProvideRowInsertion(ASPxScheduler1, objectDataSource.AppointmentDataSource);
        objectDataSource.AttachTo(ASPxScheduler1);
        if(!IsPostBack) {
            AppointmentForm.DataBind();
        }
	}


    protected void ASPxScheduler1_BeforeExecuteCallbackCommand(object sender, SchedulerCallbackCommandEventArgs e) {
        if(e.CommandId == SchedulerCallbackCommandId.ClientSideUpdateAppointment)
            e.Command = new MyUpdateAppointmentCommand((ASPxScheduler)sender);
        else if (e.CommandId == SchedulerCallbackCommandId.ClientSideInsertAppointment)
            e.Command = new MyInsertAppointmentCommand((ASPxScheduler)sender);
    }
}
class MyInsertAppointmentCommand : AppointmentClientSideInsertCallbackCommand {
    public MyInsertAppointmentCommand(ASPxScheduler scheduler) : base(scheduler) { 
    }

    protected override AppointmentFormController CreateAppointmentFormController(Appointment apt) {
        return new MyAppointmentFormController(Control, apt);
    }

    protected override void AssignControllerCustomFieldsValues(AppointmentFormController controller, ClientAppointmentProperties clientAppointment) {
        Appointment editedAppointment = controller.EditedAppointmentCopy;
        double result = 0;
        if(clientAppointment.Properties["Price"] != null) 
            Double.TryParse(clientAppointment.Properties["Price"].ToString(), out result);
        editedAppointment.CustomFields["Price"] = result;
        base.AssignControllerCustomFieldsValues(controller, clientAppointment);
    }
}
class MyUpdateAppointmentCommand : AppointmentClientSideUpdateCallbackCommand {
    public MyUpdateAppointmentCommand(ASPxScheduler scheduler)
        : base(scheduler) {
    }

    protected override AppointmentFormController CreateAppointmentFormController(Appointment apt) {
        return new MyAppointmentFormController(Control, apt);
    }

    protected override void AssignControllerCustomFieldsValues(AppointmentFormController controller, ClientAppointmentProperties clientAppointment) {
        Appointment editedAppointment = controller.EditedAppointmentCopy;
        double result = 0;
        if(clientAppointment.Properties["Price"] != null) 
            Double.TryParse(clientAppointment.Properties["Price"].ToString(), out result);
        editedAppointment.CustomFields["Price"] = result;
        base.AssignControllerCustomFieldsValues(controller, clientAppointment);
    }
}

public class MyAppointmentFormController : AppointmentFormController {
    private const string PriceFieldName = "Price";

    public MyAppointmentFormController(ASPxScheduler control, Appointment apt)
        : base(control, apt) {
    }
    public double Price { get { return (double)EditedAppointmentCopy.CustomFields[PriceFieldName]; } set { EditedAppointmentCopy.CustomFields[PriceFieldName] = value; } }

    double SourcePrice { get { return (double)SourceAppointment.CustomFields[PriceFieldName]; } set { SourceAppointment.CustomFields[PriceFieldName] = value; } }

    protected override void ApplyCustomFieldsValues() {
        SourcePrice = Price;
    }
}
