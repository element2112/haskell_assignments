module Simplify where 
    import StatementsExpressions
    
    -- data Statement = 
    -- ExpStmt Expression
    -- | AssignStmt String Expression
    -- | IfStmt Expression Statement deriving (Eq, Show)
    -- data Expression =
    --  VarExp String
    -- | NumExp Integer
    -- | EqualsExp Expression Expression
    -- | BeginExp [Statement] Expression deriving (Eq, Show)
    
    simplify :: Statement -> Statement
    simplify (ExpStmt e) = (ExpStmt (expr e))
    simplify (AssignStmt v e) = (AssignStmt v (expr e))
    simplify (IfStmt e s) = (simplify s)
            
    expr :: Expression -> Expression
    expr (VarExp v) = (VarExp v)
    expr (NumExp i) = (NumExp i)
    expr (EqualsExp e1 e2) = (EqualsExp (expr e1) (expr e2))
    expr (BeginExp stmts e) =  (expr e)