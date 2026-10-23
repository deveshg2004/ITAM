const cds = require('@sap/cds');
const { INSERT } = cds.ql;

module.exports = cds.service.impl(async function () {
        const {
        DepartmentsSrv,
        EmployeesSrv,
        AssetsSrv,
        MaintenanceRecordsSrv,
        AssetAssignmentsSrv,
        ArchiveRecordsSrv
    } = this.entities;
    
    this.before('createEmployee', async (req) => {

    const email = req.data.email;

    if (!email.includes('@')) {
        req.error(400, 'Invalid email address');
    }

});


this.before('createAsset', async (req) => {

    const cost = req.data.purchase_cost;

    if (cost <= 0) {
        req.error(400, 'Purchase cost must be greater than zero');
    }

});


this.before('createMaintenanceRecord', async (req) => {

    const cost = req.data.cost;

    if (cost < 0) {
        req.error(400, 'Maintenance cost cannot be negative');
    }

});


    this.on('AssignAsset', async (req) => {
        const { assetId, employeeId } = req.data;

        return `Asset ${assetId} assigned to employee ${employeeId} successfully`;
    });

    this.on('TransferAsset', async (req) => {
        const { assetId, fromEmployeeId, toEmployeeId } = req.data;

        return `Asset ${assetId} transferred from ${fromEmployeeId} to ${toEmployeeId} successfully`;
    });

    this.on('ReturnAsset', async (req) => {
        const { assetId } = req.data;

        return `Asset ${assetId} returned successfully`;
    });

    this.on('RetireAsset', async (req) => {
        const { assetId, reason } = req.data;

        return `Asset ${assetId} retired successfully. Reason: ${reason}`;
    });

    this.on('ArchiveAsset', async (req) => {
        const { assetId, reason } = req.data;

        return `Asset ${assetId} archived successfully. Reason: ${reason}`;
    });

    this.on('RequestAsset', async (req) => {
        const { employeeId, assetId } = req.data;

        return `Asset request created for employee ${employeeId} and asset ${assetId}`;
    });

    this.on('ApproveAssetRequest', async (req) => {
        const { assignmentId } = req.data;

        return `Asset request ${assignmentId} approved successfully`;
    });

    this.on('CompleteMaintenance', async (req) => {
        const { maintenanceId } = req.data;

        return `Maintenance record ${maintenanceId} completed successfully`;
    });
        this.on('createEmployee', async (req) => {

        const data = req.data;
        const tx = cds.tx(req);

        await tx.run(
            INSERT.into(EmployeesSrv).entries(data)
        );

        return await tx.read(EmployeesSrv)
            .where({ employee_id: data.employee_id });

    });

    this.on('updateEmployee', async (req) => {

        const { employee_id, phone, location, status } = req.data;

        const tx = cds.tx(req);

        await tx.update(EmployeesSrv)
            .with({
                phone,
                location,
                status
            })
            .where({ employee_id });

        return 'Employee updated successfully';

    });

    this.on('deleteEmployee', async (req) => {

        const { employee_id } = req.data;

        const tx = cds.tx(req);

        await tx.delete(EmployeesSrv)
            .where({ employee_id });

        return 'Employee deleted successfully';

    });
        this.on('createAsset', async (req) => {

        const data = req.data;
        const tx = cds.tx(req);

        await tx.run(
            INSERT.into(AssetsSrv).entries(data)
        );

        return await tx.read(AssetsSrv)
            .where({ asset_id: data.asset_id });

    });

    this.on('updateAsset', async (req) => {

        const { asset_id, status } = req.data;

        const tx = cds.tx(req);

        await tx.update(AssetsSrv)
            .with({ status })
            .where({ asset_id });

        return 'Asset updated successfully';

    });

    this.on('deleteAsset', async (req) => {

        const { asset_id } = req.data;

        const tx = cds.tx(req);

        await tx.delete(AssetsSrv)
            .where({ asset_id });

        return 'Asset deleted successfully';

    });
        this.on('createMaintenanceRecord', async (req) => {

        const data = req.data;
        const tx = cds.tx(req);

        await tx.run(
            INSERT.into(MaintenanceRecordsSrv).entries(data)
        );

        return await tx.read(MaintenanceRecordsSrv)
            .where({ maintenance_id: data.maintenance_id });

    });

    this.on('updateMaintenanceRecord', async (req) => {

        const { maintenance_id, status } = req.data;

        const tx = cds.tx(req);

        await tx.update(MaintenanceRecordsSrv)
            .with({ status })
            .where({ maintenance_id });

        return 'Maintenance record updated successfully';

    });

    this.on('deleteMaintenanceRecord', async (req) => {

        const { maintenance_id } = req.data;

        const tx = cds.tx(req);

        await tx.delete(MaintenanceRecordsSrv)
            .where({ maintenance_id });

        return 'Maintenance record deleted successfully';

    });
        // Asset Assignment CRUD

    this.on('createAssetAssignment', async (req) => {

        const data = req.data;
        const tx = cds.tx(req);

        await tx.run(
            INSERT.into(AssetAssignmentsSrv).entries(data)
        );

        return await tx.read(AssetAssignmentsSrv)
            .where({ assignment_id: data.assignment_id });

    });

    this.on('updateAssetAssignment', async (req) => {

        const {
            assignment_id,
            assignment_status,
            remarks
        } = req.data;

        const tx = cds.tx(req);

        await tx.update(AssetAssignmentsSrv)
            .with({
                assignment_status,
                remarks
            })
            .where({ assignment_id });

        return 'Asset Assignment updated successfully';

    });

    this.on('deleteAssetAssignment', async (req) => {

        const { assignment_id } = req.data;

        const tx = cds.tx(req);

        await tx.delete(AssetAssignmentsSrv)
            .where({ assignment_id });

        return 'Asset Assignment deleted successfully';

    });
        // Department CRUD

    this.on('createDepartment', async (req) => {

        const data = req.data;
        const tx = cds.tx(req);

        await tx.run(
            INSERT.into(DepartmentsSrv).entries(data)
        );

        return await tx.read(DepartmentsSrv)
    .where({ dept_id: data.dept_id });

    });

    this.on('updateDepartment', async (req) => {

        const {
            dept_id,
            name,
            cost_center
        } = req.data;

        const tx = cds.tx(req);

        await tx.update(DepartmentsSrv)
    .with({
        name,
        cost_center
    })
    .where({ dept_id });

        return 'Department updated successfully';

    });

    this.on('deleteDepartment', async (req) => {

        const { dept_id } = req.data;

        const tx = cds.tx(req);

        await tx.delete(DepartmentsSrv)
            .where({ dept_id });

        return 'Department deleted successfully';

    });

        // Archive CRUD

        this.on('createArchiveRecord', async (req) => {

    const data = req.data;
    const tx = cds.tx(req);

    await tx.run(
        INSERT.into(ArchiveRecordsSrv).entries(data)
    );

    return await tx.read(ArchiveRecordsSrv)
        .where({ archive_id: data.archive_id });

});

    this.on('updateArchiveRecord', async (req) => {

        const {
            archive_id,
            reason,
            disposal_method,
            disposal_cert_no
        } = req.data;

        const tx = cds.tx(req);

        await tx.update(ArchiveRecordsSrv)
            .with({
                reason,
                disposal_method,
                disposal_cert_no
            })
            .where({ archive_id });

        return 'Archive record updated successfully';

    });

    this.on('deleteArchiveRecord', async (req) => {

        const { archive_id } = req.data;

        const tx = cds.tx(req);

        await tx.delete(ArchiveRecordsSrv)
            .where({ archive_id });

        return 'Archive record deleted successfully';

    });

});