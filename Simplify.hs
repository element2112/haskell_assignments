module Simplify where
import StatementsExpressions

-- Worked on with Daniel Lam
-- Referenced Dr. Leavens "Follow the Grammar"

simplify :: Statement -> Statement
simplify (ExpStmt e) = (ExpStmt (expr e))
simplify (AssignStmt v e) = (AssignStmt v (expr e))
simplify (IfStmt e s) = (simplify s)

expr :: Expression -> Expression
expr (VarExp v) = (VarExp v)
expr (NumExp i) = (NumExp i)
expr (EqualsExp e1 e2) = (EqualsExp (expr e1) (expr e2))
expr (BeginExp [] e) =  (expr e)
expr (BeginExp stmts e) = (BeginExp (map simplify stmts) (expr e))
