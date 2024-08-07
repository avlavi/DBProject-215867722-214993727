ALTER TABLE MILITARY_RABBI
DROP COLUMN Row_Num;

ALTER TABLE Shekem
DROP COLUMN Row_Num;

ALTER TABLE MILITARY_RABBI
DROP COLUMN Base_num;

ALTER TABLE MILITARY_RABBI DROP CONSTRAINT fk_MILITARY_RABBI_Shekem;

ALTER TABLE MILITARY_RABBI
ADD Row_Num INTEGER;

ALTER TABLE Shekem
ADD Row_Num INTEGER;

UPDATE MILITARY_RABBI
SET Row_Num = ROWNUM;

UPDATE Shekem
SET Row_Num = ROWNUM;

ALTER TABLE MILITARY_RABBI
ADD Base_num INTEGER;

UPDATE MILITARY_RABBI st
SET st.Base_num = (
    SELECT so.Base_num
    FROM Shekem so
    WHERE so.Row_Num = st.Row_Num
);


ALTER TABLE MILITARY_RABBI
ADD CONSTRAINT fk_MILITARY_RABBI_Shekem
FOREIGN KEY (Base_num)
REFERENCES Shekem(Base_num);

ALTER TABLE MILITARY_RABBI
DROP COLUMN Row_Num;

ALTER TABLE Shekem
DROP COLUMN Row_Num;


SELECT * FROM MILITARY_RABBI;
SELECT * FROM Shekem;
commit;
