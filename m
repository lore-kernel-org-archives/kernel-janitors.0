From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 17 Oct 2012 06:44:44 +0000
Subject: drivers/gpu/drm/radeon/radeon_gart.c:580:5: sparse: symbol 'radeon_vm_evict' was not declared. Shoul
Message-Id: <20121017064444.GA17885@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Christian,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux master
head:   8d2b6b3ae280dcf6f6c7a95623670a57cdf562ed
commit: 90a51a329258e3c868f6f4c1fb264ca01c590c57 drm/radeon: allocate page tables on demand v4
date:   2 days ago

+ drivers/gpu/drm/radeon/radeon_gart.c:580:5: sparse: symbol 'radeon_vm_evict' was not declared. Should it be static?

vim +580 drivers/gpu/drm/radeon/radeon_gart.c

09db8644 Alex Deucher    2012-07-17  569  /**
90a51a32 Christian König 2012-10-09  570   * radeon_vm_evict - evict page table to make room for new one
90a51a32 Christian König 2012-10-09  571   *
90a51a32 Christian König 2012-10-09  572   * @rdev: radeon_device pointer
90a51a32 Christian König 2012-10-09  573   * @vm: VM we want to allocate something for
90a51a32 Christian König 2012-10-09  574   *
90a51a32 Christian König 2012-10-09  575   * Evict a VM from the lru, making sure that it isn't @vm. (cayman+).
90a51a32 Christian König 2012-10-09  576   * Returns 0 for success, -ENOMEM for failure.
90a51a32 Christian König 2012-10-09  577   *
90a51a32 Christian König 2012-10-09  578   * Global and local mutex must be locked!
90a51a32 Christian König 2012-10-09  579   */
90a51a32 Christian König 2012-10-09 @580  int radeon_vm_evict(struct radeon_device *rdev, struct radeon_vm *vm)
90a51a32 Christian König 2012-10-09  581  {
90a51a32 Christian König 2012-10-09  582  	struct radeon_vm *vm_evict;
90a51a32 Christian König 2012-10-09  583  
90a51a32 Christian König 2012-10-09  584  	if (list_empty(&rdev->vm_manager.lru_vm))
90a51a32 Christian König 2012-10-09  585  		return -ENOMEM;
90a51a32 Christian König 2012-10-09  586  
90a51a32 Christian König 2012-10-09  587  	vm_evict = list_first_entry(&rdev->vm_manager.lru_vm,
90a51a32 Christian König 2012-10-09  588  				    struct radeon_vm, list);

Shall we apply the attached diff?

Thanks,
Fengguang

--7AUc2qLy4jB3hD7Z
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-90a51a3.diff"

diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeon/radeon_gart.c
index 98b170a..3bae351 100644
--- a/drivers/gpu/drm/radeon/radeon_gart.c
+++ b/drivers/gpu/drm/radeon/radeon_gart.c
@@ -577,7 +577,7 @@ void radeon_vm_manager_fini(struct radeon_device *rdev)
  *
  * Global and local mutex must be locked!
  */
-int radeon_vm_evict(struct radeon_device *rdev, struct radeon_vm *vm)
+static int radeon_vm_evict(struct radeon_device *rdev, struct radeon_vm *vm)
 {
 	struct radeon_vm *vm_evict;
 

--7AUc2qLy4jB3hD7Z--
