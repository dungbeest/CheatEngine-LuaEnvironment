---@meta _


---Inherits from Component (CustomConnection->Component->Object)
---@class CustomConnection: Component (CustomConnection->Component->Object)
---@field Connected boolean # Gets the current connection state, and lets you connect as well
---@field LoginPrompt boolean #
local CustomConnection = {}

function CustomConnection.AfterConnect(sender) end

function CustomConnection.AfterDisconnect(sender) end

function CustomConnection.BeforeConnect(sender) end

function CustomConnection.BeforeDisconnect(sender) end

---@param forceClose? boolean
function CustomConnection.close(forceClose) end

function CustomConnection.open() end


---Inherits from CustomConnection (Database->CustomConnection->Component->Object)
---@class Database: CustomConnection 
---@field Connected boolean # Set this to true to activate the connection. (turns back to false on failure)
---@field DatabaseName string #
---@field KeepConnection boolean #
---@field Params Strings #
---@field TransactionCount integer # readonly


---@alias SQLConnectionOptions string
---| '"scoExplicitConnect"' #
---| '"scoApplyUpdatesChecksRowsAffected"' #
---| '"scoExplicitConnect, scoApplyUpdatesChecksRowsAffected"' #


---Inherits from Database (SQLConnection->Database->CustomConnection->Component->Object)
---@class SQLConnection: Database
---@field Password string #
---@field UserName string #
---@field Transaction SQLTransaction # SQLTransaction object. Needs to be set
---@field CharSet string #
---@field HostName string #
---@field Options SQLConnectionOptions #
local SQLConnection = {}

function SQLConnection.startTransaction() end

function SQLConnection.endTransaction() end

---@param sql string
function SQLConnection.executeDirect(sql) end

---@return string[] # A counted table with all tablenames
function SQLConnection.getTableNames() end


---Inherits from SQLConnection (SQLite3Connection->SQLConnection->Database->CustomConnection->Component->Object)
---@class SQLite3Connection: SQLConnection
local SQLite3Connection = {}

function SQLite3Connection.createDB() end

function SQLite3Connection.dropDB() end

---@return integer
function SQLite3Connection.getInsertID() end

---Inherits from SQLConnection (ODBCConnection->SQLConnection->Database->CustomConnection->Component->Object)
---@class ODBCConnection: SQLConnection
---@field DatabaseName string # Name of the ODBC connection
---@field Driver string #
---@field FileDSN string #


---Inherits from Component (DBTransaction->Component->Object)
---@class DBTransaction: Component
---@field Active boolean #
---@field DataBase Database #
local DBTransaction = {}

function DBTransaction.closeDataSets() end

---@alias SQLTransactionOptions string
---| '"stoUseImplicit"' # 
---| '"stoExplicitStart"' #
---| '"stoUseImplicit, stoExplicitStart"' #

---@alias SQLTransactionAction string
---| '"caNone"'
---| '"caCommit"'
---| '"caCommitRetaining"'
---| '"caRollback"'
---| '"caRollbackRetaining"'

---Inherits from DBTransaction (SQLTransaction->DBTransaction->Component->Object)
---@class SQLTransaction: DBTransaction #
---@field SQLConnection SQLConnection #
---@field Params Stringlist #
---@field Options SQLTransactionOptions # 
---@field Action SQLTransactionAction # 
local SQLTransaction = {}

function SQLTransaction.commit() end

function SQLTransaction.commitRetaining() end

function SQLTransaction.rollback() end

function SQLTransaction.rollbackRetaining() end

function SQLTransaction.startTransaction() end

function SQLTransaction.endTransaction() end


---Inherits from CollectionItem (Param->CollectionItem->Object)
---@class Param: CollectionItem
---@field Name string #
---@field Value any #
---@field DataType string #
---@field AsBoolean boolean #
---@field AsByteTable ByteTable #
---@field AsInteger integer #
---@field AsNumber number #
---@field AsString string #
---@field Text string #
---@field Size integer #
---@field Precision integer #
---@field IsNull boolean #



---Inherits from Collection (Params->Collection->Object)
---@class Params: Collection
---@field Items Param[] #
local Params = {}

---@param param Param
function Params.AddParam(param) end

---Inherits from Component (Field->Component->Object)
---@class Field: Component
---@field FieldName string #
---@field Index integer #
---@field Value any #
---@field DataType string #
---@field AsBoolean boolean #
---@field AsByteTable ByteTable #
---@field AsInteger integer #
---@field AsNumber number #
---@field AsString string #
---@field Text string #
---@field Size string #
---@field IsNull boolean #


---Inherits from Object (Fields->Object)
---@class Fields: Object
---@field Count integer #
---@field Fields Field[] #
local Fields = {}

---@param field Field
function Fields.add(field) end

function Fields.clear() end

---@param name string
---@return Field
function Fields.fieldByName(name) end

---@param number integer
---@return Field
function Fields.fieldByNumber(number) end

---@param field Field
---@return integer
function Fields.indexOf(field) end


---@alias DatasetOptions string
---| '"foCaseInsensitive"' #
---| '"foNoPartialCompare"' #
---| '"foCaseInsensitive, foNoPartialCompare"' #

---@alias DatasetLocateOptions string
---| '"loCaseInsensitive"' #
---| '"loPartialKey"' #
---| '"loCaseInsensitive, loPartialKey"' #

---Inherits from Component (Dataset->Component->Object)
---@class Dataset: Component
---@field BlockReadSize integer #
---@field BOF boolean # READONLY
---@field CanModify boolean # READONLY
---@field DefaultFields boolean # READONLY
---@field EOF boolean # READONLY
---@field FieldCount integer # READONLY
---@field Fields Fields # READONLY
---@field Found boolean # READONLY
---@field Modified boolean # READONLY
---@field IsUniDirectional boolean # READONLY
---@field RecordCount integer # READONLY
---@field RecNo integer #
---@field FieldValues table<string, any> #
---@field Filter string #
---@field Filtered boolean #
---@field FilterOptions DatasetOptions #
---@field Active boolean #
---@field AutoCalcFields boolean #
local Dataset = {}

function Dataset.append() end

---@param values any[]
function Dataset.appendRecord(values) end

function Dataset.cancel() end

function Dataset.checkBrowseMode() end

function Dataset.clearFields() end

function Dataset.close() end

---@return boolean
function Dataset.controlsDisabled() end

function Dataset.cursorPosChanged() end

function Dataset.delete() end

function Dataset.disableControls() end

function Dataset.edit() end

function Dataset.enableControls() end

---@param fieldName string
---@return Field #
function Dataset.fieldByName(fieldName) end

---@param fieldName string
---@return Field
function Dataset.findField(fieldName) end

---@return Field
function Dataset.findFirst() end

---@return Field
function Dataset.findLast() end

---@return Field
function Dataset.findNext() end

---@return Field
function Dataset.findPrior() end

---@return Field
function Dataset.first() end

function Dataset.insert() end

---@return boolean
function Dataset.isEmpty() end

---@return Field
function Dataset.last() end

---@param KeyFields string
---@param KeyValues string
---@param options string
---@return boolean
function Dataset.locate(KeyFields, KeyValues, options) end

---@param keyFields string
---@param KeyValues string
---@param ResultFields string
---@return any
function Dataset.lookup(keyFields, KeyValues, ResultFields) end

---@param distance integer
function Dataset.moveBy(distance) end

---???
function Dataset.next() end

---???
function Dataset.open() end

---???
function Dataset.post() end

---???
function Dataset.prior() end

---???
function Dataset.refresh() end

---???
function Dataset.updateCursorPos() end

---???
function Dataset.updateRecord() end



---Inherits from Dataset (DBDataset->Dataset->Component->Object)
---@class DBDataset: Dataset
---@field DataBase Database #
---@field Transaction DBTransaction #


---Inherits from DBDataset (CustomBufDataset->DBDataset->Dataset->Component->Object)
---@class CustomBufDataset: DBDataset
---@field FileName string #
---@field PacketRecords integer #
---@field UniDirectional boolean #
---@field IndexName string #
---@field MaxIndexesCount integer #
---@field ChangeCount integer #
---@field ReadOnly boolean #
local CustomBufDataset = {}

---@param maxErrors? integer
function CustomBufDataset.applyUpdates(maxErrors) end

function CustomBufDataset.cancelUpdates() end

---@param stream Stream
function CustomBufDataset.loadFromStream(stream) end

---@param stream Stream
function CustomBufDataset.saveToStream(stream) end

---@param fileName path
function CustomBufDataset.loadFromFile(fileName) end

---@param fileName path
function CustomBufDataset.saveToFile(fileName) end

function CustomBufDataset.createDataset() end


---Inherits from CustomBufDataset (CustomSQLQuery->CustomBufDataset->DBDataset->Dataset->Component->Object)
---@class CustomSQLQuery: CustomBufDataset
---@field prepared boolean # READONLY
---@field SQLConnection SQLConnection #
---@field SQLTransaction SQLTransaction #
local CustomSQLQuery = {}

function CustomSQLQuery.prepare() end

function CustomSQLQuery.unprepare() end

function CustomSQLQuery.execSQL() end

function CustomSQLQuery.rowsAffected() end

---@param paramName string
---@return Param
function CustomSQLQuery.paramByName(paramName) end


---@alias SQLQuerySchemaType string
---| '"stNoSchema"' # 
---| '"stTables"' # 
---| '"stSysTables"' # 
---| '"stProcedures"' # 
---| '"stColumns"' # 
---| '"stProcedureParams"' # 
---| '"stIndexes"' #
---| '"stPackages"' #
---| '"stSchemata"' #
---| '"stSequences"' #

---@alias SQLQueryStatementType string
---| '"stUnknown"' #
---| '"stSelect"' #
---| '"stInsert"' #
---| '"stUpdate"' #
---| '"stDelete"' #
---| '"stDDL"' #
---| '"stGetSegment"' #
---| '"stPutSegment"' #
---| '"stExecProcedure"' #
---| '"stStartTrans"' #
---| '"stCommit"' #
---| '"stRollback"' #
---| '"stSelectForUpd"' #

---@alias SQLQueryUpdateMode string
---| '"upWhereAll"' # 
---| '"upWhereChanged"' # 
---| '"upWhereKeyOnly"' #

---Set of options for a SQLQuery, use multiple comma-separated ones to activate multiple.
---
---Example:
---"sqoKeepOpenOnCommit, sqoCancelUpdatesOnRefresh, sqoRefreshUsingSelect"
---@alias SQLQueryOptions string
---| '"sqoKeepOpenOnCommit"' #
---| '"sqoAutoApplyUpdates"' #
---| '"sqoAutoCommit"' #
---| '"sqoCancelUpdatesOnRefresh"' #
---| '"sqoRefreshUsingSelect"' #


---Inherits from CustomSQLQuery (SQLQuery->CustomSQLQuery->CustomBufDataset->DBDataset->Dataset->Component->Object)
---@class SQLQuery
---@field Database Database #
---@field SchemaType SQLQuerySchemaType # READONLY
---@field StatementType SQLQueryStatementType # READONLY
---@field Params Params #
---@field ParamCheck boolean #
---@field ParseSQL boolean #
---@field UpdateMode SQLQueryUpdateMode #
---@field UsePrimaryKeyAsKey boolean #
---@field ReadOnly boolean #
---@field SQL string #
---@field InsertSQL Stringlist #
---@field UpdateSQL Stringlist #
---@field DeleteSQL Stringlist #
---@field RefreshSQL Stringlist #
---@field Options SQLQueryOptions # Set of options from the SQLQueryOptions, comma-separated 


---Creates a SQLite3Connection object.
---@generic T: Component
---@param owner T # A component that will own the new SQLite3Connection
---@return SQLite3Connection # A SQLite3Connection object
function createSQLite3Connection(owner) return {} end

---Set the path to the sqlite3.dll in case it's not .\win\*\sqlite3.dll.
---@param pathWithDLLName path # Alternate path to sqlite3.dll
function setSQLiteLibraryName(pathWithDLLName) end

---Creates an ODBCConnection object.
---@generic T: Component
---@param owner T # A component that will own the new ODBCConnection
---@return ODBCConnection # A ODBCConnection object
function createODBCConnection(owner) return {} end


---Creates a SQLTransaction object.
---@generic T: Component
---@param owner T # A component that will own the new SQLTransaction
---@return SQLTransaction # A SQLTransaction object
function createSQLTransaction(owner) return {} end


---Creates a SQLQuery object.
---@generic T: Component
---@param owner T # A component that will own the new SQLQuery
---@return SQLQuery # A SQLQuery object
function createSQLQuery(owner) return {} end
