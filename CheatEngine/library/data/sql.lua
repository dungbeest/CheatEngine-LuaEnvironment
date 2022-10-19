---@meta


---Inherits from Component (CustomConnection->Component->Object)
---@class CustomConnection: Component (CustomConnection->Component->Object)
---@field Connected boolean # Gets the current connection state, and lets you connect as well
---@field LoginPrompt boolean #
---@field AfterConnect fun(sender) #
---@field AfterDisconnect fun(sender) #
---@field BeforeConnect fun(sender) #
---@field BeforeDisconnect fun(sender) #
---@field close fun(forceClose?: boolean) #
---@field open fun() #


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
---@field startTransaction fun() #
---@field endTransaction fun() #
---@field executeDirect fun(sql: string) #
---@field getTableNames fun(): string[] # Returns a counted table with all tablenames


---Inherits from SQLConnection (SQLite3Connection->SQLConnection->Database->CustomConnection->Component->Object)
---@class SQLite3Connection: SQLConnection
---@field createDB fun() #
---@field dropDB fun() #
---@field getInsertID fun(): integer #

---Inherits from SQLConnection (ODBCConnection->SQLConnection->Database->CustomConnection->Component->Object)
---@class ODBCConnection: SQLConnection
---@field DatabaseName string # Name of the ODBC connection
---@field Driver string #
---@field FileDSN string #


---Inherits from Component (DBTransaction->Component->Object)
---@class DBTransaction: Component
---@field Active boolean #
---@field DataBase Database #
---@field closeDataSets fun() #

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
---@field commit fun() #
---@field commitRetaining fun() #
---@field rollback fun() #
---@field rollbackRetaining fun() #
---@field startTransaction fun() #
---@field endTransaction fun() #


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
---@field AddParam fun(param: Param) #


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
---@field add fun(field: Field) #
---@field clear fun()
---@field fieldByName fun(name: string): Field
---@field fieldByNumber fun(number: integer): Field
---@field indexOf fun(field: Field): integer


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
---@field append fun() #
---@field appendRecord fun(values: any[]) #
---@field cancel fun() #
---@field checkBrowseMode fun() #
---@field clearFields fun() #
---@field close fun() #
---@field controlsDisabled fun(): boolean #
---@field cursorPosChanged fun() #
---@field delete fun() #
---@field disableControls fun() #
---@field edit fun()
---@field enableControls fun() #
---@field fieldByName fun(fieldName: string): Field #
---@field findField fun(fieldName: string): Field #
---@field findFirst fun(): Field #
---@field findLast fun(): Field #
---@field findNext fun(): Field #
---@field findPrior fun(): Field #
---@field first fun(): Field #
---@field insert function #
---@field isEmpty fun(): boolean #
---@field last fun(): Field #
---@field locate fun(KeyFields: string, KeyValues: string, options: string): boolean #
---@field lookup fun(keyFields: string, KeyValues: string, ResultFields: string): any #
---@field moveBy fun(distance: integer) #
---@field next function #
---@field open function #
---@field post function #
---@field prior function #
---@field refresh fun() #
---@field updateCursorPos function #
---@field updateRecord function #



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
---@field applyUpdates fun(maxErrors?: integer) #
---@field cancelUpdates fun() #
---@field loadFromStream fun(stream: Stream) #
---@field saveToStream fun(stream: Stream) #
---@field loadFromFile fun(fileName: path) #
---@field saveToFile fun(fileName: path) #
---@field createDataset fun() #


---Inherits from CustomBufDataset (CustomSQLQuery->CustomBufDataset->DBDataset->Dataset->Component->Object)
---@class CustomSQLQuery: CustomBufDataset
---@field prepared boolean # READONLY
---@field SQLConnection SQLConnection #
---@field SQLTransaction SQLTransaction #
---@field prepare fun() #
---@field unprepare fun() #
---@field execSQL fun() #
---@field rowsAffected fun() #
---@field paramByName fun(paramName: string): Param #


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
