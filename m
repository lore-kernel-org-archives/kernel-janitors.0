From: Firo Yang <firogm@gmail.com>
Date: Wed, 22 Apr 2015 16:35:27 +0000
Subject: [PATCH 13/16] Clean up unnecessary void* pointer cast.
Message-Id: <1429720530-20044-13-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 945d622..4d7bc95 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -203,8 +203,7 @@ static void kfd_process_destroy_delayed(struct rcu_head *rcu)
 
 	mmdrop(p->mm);
 
-	work = (struct kfd_process_release_work *)
-		kmalloc(sizeof(struct kfd_process_release_work), GFP_ATOMIC);
+	work = kmalloc(sizeof(struct kfd_process_release_work), GFP_ATOMIC);
 
 	if (work) {
 		INIT_WORK((struct work_struct *) work, kfd_process_wq_release);
-- 
2.1.0

