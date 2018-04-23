Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxScheduler

Partial Public Class UserForms_ScriptRecurrenceForm
	Inherits ASPxSchedulerClientFormBase
	Public Overrides ReadOnly Property ClassName() As String
		Get
			Return "ASPxClientRecurrenceAppointmentForm"
		End Get
	End Property

	Protected Overrides Function GetChildControls() As Control()
		Dim controls() As Control = { edtDailyRecurrenceControl, edtWeeklyRecurrenceControl, edtMonthlyRecurrenceControl, edtYearlyRecurrenceControl, edtRecurrenceTypeEdit, edtRecurrenceRangeControl}
		Return controls
	End Function
End Class
