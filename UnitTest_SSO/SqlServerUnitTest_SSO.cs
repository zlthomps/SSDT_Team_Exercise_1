using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTest_SSO
{
    [TestClass()]
    public class SqlServerUnitTest_SSO : SqlDatabaseTestClass
    {

        public SqlServerUnitTest_SSO()
        {
            InitializeComponent();
        }

        [TestInitialize()]
        public void TestInitialize()
        {
            base.InitializeTest();
        }
        [TestCleanup()]
        public void TestCleanup()
        {
            base.CleanupTest();
        }

        #region Designer support code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_DeleteRoleTest_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SqlServerUnitTest_SSO));
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_InsertLoginTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_InsertRoleTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_UpdateLoginTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_UpdateRoleTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_DeleteRoleTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.EmptyResultSetCondition emptyResultSetCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition checksumCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_InsertLoginTest_PosttestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_InsertLoginTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition2;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition3;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition checksumCondition2;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_InsertRoleTest_PosttestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition4;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_UpdateLoginTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.NotEmptyResultSetCondition notEmptyResultSetCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition checksumCondition3;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_UpdateLoginTest_PosttestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_UpdateRoleTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.NotEmptyResultSetCondition notEmptyResultSetCondition2;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition checksumCondition4;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction dbo_usp_UpdateRoleTest_PosttestAction;
            this.dbo_usp_DeleteRoleTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.dbo_usp_InsertLoginTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.dbo_usp_InsertRoleTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.dbo_usp_UpdateLoginTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.dbo_usp_UpdateRoleTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            dbo_usp_DeleteRoleTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            dbo_usp_InsertLoginTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            dbo_usp_InsertRoleTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            dbo_usp_UpdateLoginTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            dbo_usp_UpdateRoleTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            dbo_usp_DeleteRoleTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            emptyResultSetCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.EmptyResultSetCondition();
            checksumCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition();
            dbo_usp_InsertLoginTest_PosttestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            scalarValueCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition();
            dbo_usp_InsertLoginTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            scalarValueCondition2 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition();
            scalarValueCondition3 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition();
            checksumCondition2 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition();
            dbo_usp_InsertRoleTest_PosttestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            scalarValueCondition4 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition();
            dbo_usp_UpdateLoginTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            notEmptyResultSetCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.NotEmptyResultSetCondition();
            checksumCondition3 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition();
            dbo_usp_UpdateLoginTest_PosttestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            dbo_usp_UpdateRoleTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            notEmptyResultSetCondition2 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.NotEmptyResultSetCondition();
            checksumCondition4 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition();
            dbo_usp_UpdateRoleTest_PosttestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            // 
            // dbo_usp_DeleteRoleTest_TestAction
            // 
            dbo_usp_DeleteRoleTest_TestAction.Conditions.Add(emptyResultSetCondition1);
            resources.ApplyResources(dbo_usp_DeleteRoleTest_TestAction, "dbo_usp_DeleteRoleTest_TestAction");
            // 
            // dbo_usp_InsertLoginTest_TestAction
            // 
            dbo_usp_InsertLoginTest_TestAction.Conditions.Add(checksumCondition1);
            resources.ApplyResources(dbo_usp_InsertLoginTest_TestAction, "dbo_usp_InsertLoginTest_TestAction");
            // 
            // dbo_usp_InsertRoleTest_TestAction
            // 
            dbo_usp_InsertRoleTest_TestAction.Conditions.Add(checksumCondition2);
            resources.ApplyResources(dbo_usp_InsertRoleTest_TestAction, "dbo_usp_InsertRoleTest_TestAction");
            // 
            // dbo_usp_UpdateLoginTest_TestAction
            // 
            dbo_usp_UpdateLoginTest_TestAction.Conditions.Add(checksumCondition3);
            resources.ApplyResources(dbo_usp_UpdateLoginTest_TestAction, "dbo_usp_UpdateLoginTest_TestAction");
            // 
            // dbo_usp_UpdateRoleTest_TestAction
            // 
            dbo_usp_UpdateRoleTest_TestAction.Conditions.Add(checksumCondition4);
            resources.ApplyResources(dbo_usp_UpdateRoleTest_TestAction, "dbo_usp_UpdateRoleTest_TestAction");
            // 
            // dbo_usp_DeleteRoleTestData
            // 
            this.dbo_usp_DeleteRoleTestData.PosttestAction = null;
            this.dbo_usp_DeleteRoleTestData.PretestAction = dbo_usp_DeleteRoleTest_PretestAction;
            this.dbo_usp_DeleteRoleTestData.TestAction = dbo_usp_DeleteRoleTest_TestAction;
            // 
            // dbo_usp_InsertLoginTestData
            // 
            this.dbo_usp_InsertLoginTestData.PosttestAction = dbo_usp_InsertLoginTest_PosttestAction;
            this.dbo_usp_InsertLoginTestData.PretestAction = dbo_usp_InsertLoginTest_PretestAction;
            this.dbo_usp_InsertLoginTestData.TestAction = dbo_usp_InsertLoginTest_TestAction;
            // 
            // dbo_usp_InsertRoleTestData
            // 
            this.dbo_usp_InsertRoleTestData.PosttestAction = dbo_usp_InsertRoleTest_PosttestAction;
            this.dbo_usp_InsertRoleTestData.PretestAction = null;
            this.dbo_usp_InsertRoleTestData.TestAction = dbo_usp_InsertRoleTest_TestAction;
            // 
            // dbo_usp_UpdateLoginTestData
            // 
            this.dbo_usp_UpdateLoginTestData.PosttestAction = dbo_usp_UpdateLoginTest_PosttestAction;
            this.dbo_usp_UpdateLoginTestData.PretestAction = dbo_usp_UpdateLoginTest_PretestAction;
            this.dbo_usp_UpdateLoginTestData.TestAction = dbo_usp_UpdateLoginTest_TestAction;
            // 
            // dbo_usp_UpdateRoleTestData
            // 
            this.dbo_usp_UpdateRoleTestData.PosttestAction = dbo_usp_UpdateRoleTest_PosttestAction;
            this.dbo_usp_UpdateRoleTestData.PretestAction = dbo_usp_UpdateRoleTest_PretestAction;
            this.dbo_usp_UpdateRoleTestData.TestAction = dbo_usp_UpdateRoleTest_TestAction;
            // 
            // dbo_usp_DeleteRoleTest_PretestAction
            // 
            resources.ApplyResources(dbo_usp_DeleteRoleTest_PretestAction, "dbo_usp_DeleteRoleTest_PretestAction");
            // 
            // emptyResultSetCondition1
            // 
            emptyResultSetCondition1.Enabled = true;
            emptyResultSetCondition1.Name = "emptyResultSetCondition1";
            emptyResultSetCondition1.ResultSet = 1;
            // 
            // checksumCondition1
            // 
            checksumCondition1.Checksum = "-456507280";
            checksumCondition1.Enabled = true;
            checksumCondition1.Name = "checksumCondition1";
            // 
            // dbo_usp_InsertLoginTest_PosttestAction
            // 
            dbo_usp_InsertLoginTest_PosttestAction.Conditions.Add(scalarValueCondition1);
            dbo_usp_InsertLoginTest_PosttestAction.Conditions.Add(scalarValueCondition3);
            resources.ApplyResources(dbo_usp_InsertLoginTest_PosttestAction, "dbo_usp_InsertLoginTest_PosttestAction");
            // 
            // scalarValueCondition1
            // 
            scalarValueCondition1.ColumnNumber = 1;
            scalarValueCondition1.Enabled = true;
            scalarValueCondition1.ExpectedValue = "1";
            scalarValueCondition1.Name = "scalarValueCondition1";
            scalarValueCondition1.NullExpected = false;
            scalarValueCondition1.ResultSet = 1;
            scalarValueCondition1.RowNumber = 1;
            // 
            // dbo_usp_InsertLoginTest_PretestAction
            // 
            dbo_usp_InsertLoginTest_PretestAction.Conditions.Add(scalarValueCondition2);
            resources.ApplyResources(dbo_usp_InsertLoginTest_PretestAction, "dbo_usp_InsertLoginTest_PretestAction");
            // 
            // scalarValueCondition2
            // 
            scalarValueCondition2.ColumnNumber = 1;
            scalarValueCondition2.Enabled = true;
            scalarValueCondition2.ExpectedValue = "9BC84DC5-9342-4232-A66D-6D374EA2BB94";
            scalarValueCondition2.Name = "scalarValueCondition2";
            scalarValueCondition2.NullExpected = false;
            scalarValueCondition2.ResultSet = 1;
            scalarValueCondition2.RowNumber = 1;
            // 
            // scalarValueCondition3
            // 
            scalarValueCondition3.ColumnNumber = 1;
            scalarValueCondition3.Enabled = true;
            scalarValueCondition3.ExpectedValue = "1";
            scalarValueCondition3.Name = "scalarValueCondition3";
            scalarValueCondition3.NullExpected = false;
            scalarValueCondition3.ResultSet = 2;
            scalarValueCondition3.RowNumber = 1;
            // 
            // checksumCondition2
            // 
            checksumCondition2.Checksum = "614096374";
            checksumCondition2.Enabled = true;
            checksumCondition2.Name = "checksumCondition2";
            // 
            // dbo_usp_InsertRoleTest_PosttestAction
            // 
            dbo_usp_InsertRoleTest_PosttestAction.Conditions.Add(scalarValueCondition4);
            resources.ApplyResources(dbo_usp_InsertRoleTest_PosttestAction, "dbo_usp_InsertRoleTest_PosttestAction");
            // 
            // scalarValueCondition4
            // 
            scalarValueCondition4.ColumnNumber = 1;
            scalarValueCondition4.Enabled = true;
            scalarValueCondition4.ExpectedValue = "1";
            scalarValueCondition4.Name = "scalarValueCondition4";
            scalarValueCondition4.NullExpected = false;
            scalarValueCondition4.ResultSet = 1;
            scalarValueCondition4.RowNumber = 1;
            // 
            // dbo_usp_UpdateLoginTest_PretestAction
            // 
            dbo_usp_UpdateLoginTest_PretestAction.Conditions.Add(notEmptyResultSetCondition1);
            resources.ApplyResources(dbo_usp_UpdateLoginTest_PretestAction, "dbo_usp_UpdateLoginTest_PretestAction");
            // 
            // notEmptyResultSetCondition1
            // 
            notEmptyResultSetCondition1.Enabled = true;
            notEmptyResultSetCondition1.Name = "notEmptyResultSetCondition1";
            notEmptyResultSetCondition1.ResultSet = 1;
            // 
            // checksumCondition3
            // 
            checksumCondition3.Checksum = "-1457382971";
            checksumCondition3.Enabled = true;
            checksumCondition3.Name = "checksumCondition3";
            // 
            // dbo_usp_UpdateLoginTest_PosttestAction
            // 
            resources.ApplyResources(dbo_usp_UpdateLoginTest_PosttestAction, "dbo_usp_UpdateLoginTest_PosttestAction");
            // 
            // dbo_usp_UpdateRoleTest_PretestAction
            // 
            dbo_usp_UpdateRoleTest_PretestAction.Conditions.Add(notEmptyResultSetCondition2);
            resources.ApplyResources(dbo_usp_UpdateRoleTest_PretestAction, "dbo_usp_UpdateRoleTest_PretestAction");
            // 
            // notEmptyResultSetCondition2
            // 
            notEmptyResultSetCondition2.Enabled = true;
            notEmptyResultSetCondition2.Name = "notEmptyResultSetCondition2";
            notEmptyResultSetCondition2.ResultSet = 1;
            // 
            // checksumCondition4
            // 
            checksumCondition4.Checksum = "-1883918214";
            checksumCondition4.Enabled = true;
            checksumCondition4.Name = "checksumCondition4";
            // 
            // dbo_usp_UpdateRoleTest_PosttestAction
            // 
            resources.ApplyResources(dbo_usp_UpdateRoleTest_PosttestAction, "dbo_usp_UpdateRoleTest_PosttestAction");
        }

        #endregion


        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        #endregion


        [TestMethod()]
        public void dbo_usp_DeleteRoleTest()
        {
            SqlDatabaseTestActions testActions = this.dbo_usp_DeleteRoleTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void dbo_usp_InsertLoginTest()
        {
            SqlDatabaseTestActions testActions = this.dbo_usp_InsertLoginTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void dbo_usp_InsertRoleTest()
        {
            SqlDatabaseTestActions testActions = this.dbo_usp_InsertRoleTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void dbo_usp_UpdateLoginTest()
        {
            SqlDatabaseTestActions testActions = this.dbo_usp_UpdateLoginTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void dbo_usp_UpdateRoleTest()
        {
            SqlDatabaseTestActions testActions = this.dbo_usp_UpdateRoleTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }
private SqlDatabaseTestActions dbo_usp_DeleteRoleTestData;
private SqlDatabaseTestActions dbo_usp_InsertLoginTestData;
private SqlDatabaseTestActions dbo_usp_InsertRoleTestData;
private SqlDatabaseTestActions dbo_usp_UpdateLoginTestData;
private SqlDatabaseTestActions dbo_usp_UpdateRoleTestData;
    }
}
