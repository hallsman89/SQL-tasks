drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;

drop function fnc_trg_person_insert_audit();
drop function fnc_trg_person_update_audit();
drop function fnc_trg_person_delete_audit();

truncate table person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS
$person_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit SELECT now(), 'I', NEW.*;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit SELECT now(), 'U', OLD.*;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit SELECT now(), 'D', OLD.*;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;
DELETE
FROM person
WHERE id = 10;