From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 17 Jul 2010 20:39:54 +0000
Subject: [PATCH 1/4] staging/spectra: remove duplicate GLOB_VERSION
Message-Id: <1279399194.14049.18.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is the first patch of a patchset that removes all compilations warnings in staging/spectra.

These patches are a delta from a previous patchset and it assumes that these three patches all already applied:

[PATCH 1/3] fix staging/spectra: removes q->prepare_flush_fn
[PATCH 2/3] fix staging/spectra: use new REQ_FLUSH flag
[PATCH 3/3] fix staging/spectra: don't use locked_ioctl

Thanks a lot


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/spectra/ffsport.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/spectra/ffsport.c b/drivers/staging/spectra/ffsport.c
index 7b34635..44a7fbe 100644
--- a/drivers/staging/spectra/ffsport.c
+++ b/drivers/staging/spectra/ffsport.c
@@ -114,7 +114,6 @@ u64 GLOB_u64_Remainder(u64 addr, u32 divisor_type)
 
 #define GLOB_SBD_NAME          "nd"
 #define GLOB_SBD_IRQ_NUM       (29)
-#define GLOB_VERSION		"driver version 20091110"
 
 #define GLOB_SBD_IOCTL_GC                        (0x7701)
 #define GLOB_SBD_IOCTL_WL                        (0x7702)
-- 
1.7.0.4




