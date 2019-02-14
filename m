From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 14 Feb 2019 01:51:52 +0000
Subject: [PATCH -next] scsi: lpfc: Remove set but not used variable 'phys_id'
Message-Id: <20190214015152.124072-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/lpfc/lpfc_init.c: In function 'lpfc_cpu_affinity_check':
drivers/scsi/lpfc/lpfc_init.c:10599:19: warning:
 variable 'phys_id' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit 6a828b0f6192 ("scsi: lpfc: Support
non-uniform allocation of MSIX vectors to hardware queues")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/lpfc/lpfc_init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 900edae7ccc4..1ec1ec0d11de 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -10596,7 +10596,7 @@ lpfc_find_hyper(struct lpfc_hba *phba, int cpu,
 static void
 lpfc_cpu_affinity_check(struct lpfc_hba *phba, int vectors)
 {
-	int i, cpu, idx, phys_id;
+	int i, cpu, idx;
 	int max_phys_id, min_phys_id;
 	int max_core_id, min_core_id;
 	struct lpfc_vector_map_info *cpup;
@@ -10614,7 +10614,6 @@ lpfc_cpu_affinity_check(struct lpfc_hba *phba, int vectors)
 	min_phys_id = 0xffff;
 	max_core_id = 0;
 	min_core_id = 0xffff;
-	phys_id = 0;
 
 	/* Update CPU map with physical id and core id of each CPU */
 	for_each_present_cpu(cpu) {
