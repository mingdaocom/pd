use mdworksheet;

db.wscontrols.createIndex({ wsid: 1 }, { background: true, name: "ix_wsid" });
db.wscontrols.createIndex({ cid: 1,wsid: 1 }, { background: true, name: "ix_cid_wsid" });
db.printcontrol.createIndex({ worksheetId: 1 }, { background: true, name: "ix_worksheetId" });
db.printcontrol.createIndex({ worksheetId: 1,status: 1 }, { background: true, name: "ix_worksheetId_status" });