
public class PatchManagementService {

    private PatchRepository patchRepository;

    public PatchManagementService(PatchRepository patchRepository) {
        this.patchRepository = patchRepository;
    }

    public void scanAndUpdateServers(List<Server> servers) {
        for (Server server : servers) {
            Patch patch = patchRepository.getLatestPatch(server.getOS());
            if (patch != null) {
                applyPatch(server, patch);
            }
        }
    }

    private void applyPatch(Server server, Patch patch) {
        try {
            // Simulate patch application
            System.out.println("Applying patch " + patch.getVersion() + " to server " + server.getName());
            Thread.sleep(2000);
            System.out.println("Patch applied successfully to server " + server.getName());
            patchRepository.updateServerPatchStatus(server, patch, "SUCCESS");
        } catch (Exception e) {
            System.out.println("Failed to apply patch to server " + server.getName());
            patchRepository.updateServerPatchStatus(server, patch, "FAILED");
            rollbackPatch(server, patch);
        }
    }

    private void rollbackPatch(Server server, Patch patch) {
        System.out.println("Rolling back patch " + patch.getVersion() + " on server " + server.getName());
        // Simulate rollback process
    }
}
