From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 28 Oct 2020 13:31:06 +0000
Subject: [PATCH] agp: amd64: remove unneeded initialization
Message-Id: <20201028133106.5420-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, Lukas Bulwahn <lukas.bulwahn@gmail.com>

make clang-analyzer on x86_64 defconfig caught my attention with:

  drivers/char/agp/amd64-agp.c:336:2: warning: \
  Value stored to 'i' is never read [clang-analyzer-deadcode.DeadStores]
          i = 0;
          ^

Remove this unneeded initialization to make clang-analyzer happy.

Commit a32073bffc65 ("x86_64: Clean and enhance up K8 northbridge access
code") refactored cache_nbs() and introduced this unneeded dead-store
initialization.

As compilers will detect this unneeded assignment and optimize this anyway,
the resulting binary is identical before and after this change.

No functional change. No change in binary code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201028

David, please pick this minor non-urgent clean-up patch.

 drivers/char/agp/amd64-agp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index b40edae32817..0413b3136541 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -333,7 +333,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
 	if (!amd_nb_has_feature(AMD_NB_GART))
 		return -ENODEV;
 
-	i = 0;
 	for (i = 0; i < amd_nb_num(); i++) {
 		struct pci_dev *dev = node_to_amd_nb(i)->misc;
 		if (fix_northbridge(dev, pdev, cap_ptr) < 0) {
-- 
2.17.1
