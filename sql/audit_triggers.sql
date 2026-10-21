CREATE OR REPLACE FUNCTION log_catalog_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Audit_Log (action_type, table_name, record_id, details)
    VALUES ('INSERT', 'Catalog_Item', NEW.item_id, CONCAT('Se insertó el código interno: ', NEW.internal_code));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_catalog_item_insert
AFTER INSERT ON Catalog_Item
FOR EACH ROW
EXECUTE FUNCTION log_catalog_insert();