CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop integer DEFAULT 10)
RETURNS TABLE (fibonacci_number integer) AS $$
DECLARE
    a integer := 0;
    b integer := 1;
    temp integer;
BEGIN
    IF pstop > 0 THEN
        fibonacci_number := 0;
        RETURN NEXT;
    END IF;
    
    WHILE b < pstop LOOP
        fibonacci_number := b;
        RETURN NEXT;
        
        temp := a + b;
        a := b;
        b := temp;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();