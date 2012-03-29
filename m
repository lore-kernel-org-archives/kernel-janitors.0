From: linux@audioscience.com
Date: Thu, 29 Mar 2012 20:52:25 +0000
Subject: [PATCH] ALSA: asihpi - fix return value of hpios_locked_mem_alloc()
Message-Id: <1333054345-1416-1-git-send-email-linux@audioscience.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5hk424t1h9.wl%tiwai@suse.de>
In-Reply-To: <s5hk424t1h9.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tiwai@suse.de
Cc: Eliot Blennerhassett <eblennerhassett@audioscience.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com

From: Eliot Blennerhassett <eblennerhassett@audioscience.com>

Make this function consistent with others in this module by
returning 1 for error, instead of -ENOMEM
(reverts function signature change from a938fb1e)

Signed-off-by: Eliot Blennerhassett <eblennerhassett@audioscience.com>
---
 sound/pci/asihpi/hpi_internal.h |    4 ++--
 sound/pci/asihpi/hpios.c        |   10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/asihpi/hpi_internal.h b/sound/pci/asihpi/hpi_internal.h
index 8c63200..bc86cb7 100644
--- a/sound/pci/asihpi/hpi_internal.h
+++ b/sound/pci/asihpi/hpi_internal.h
@@ -1,7 +1,7 @@
 /******************************************************************************
 
     AudioScience HPI driver
-    Copyright (C) 1997-2011  AudioScience Inc. <support@audioscience.com>
+    Copyright (C) 1997-2012  AudioScience Inc. <support@audioscience.com>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of version 2 of the GNU General Public License as
@@ -42,7 +42,7 @@ On error *pLockedMemHandle marked invalid, non-zero returned.
 If this function succeeds, then HpiOs_LockedMem_GetVirtAddr() and
 HpiOs_LockedMem_GetPyhsAddr() will always succed on the returned handle.
 */
-int hpios_locked_mem_alloc(struct consistent_dma_area *p_locked_mem_handle,
+u16 hpios_locked_mem_alloc(struct consistent_dma_area *p_locked_mem_handle,
 							   /**< memory handle */
 	u32 size, /**< Size in bytes to allocate */
 	struct pci_dev *p_os_reference
diff --git a/sound/pci/asihpi/hpios.c b/sound/pci/asihpi/hpios.c
index 87f4385..5ef4fe9 100644
--- a/sound/pci/asihpi/hpios.c
+++ b/sound/pci/asihpi/hpios.c
@@ -1,7 +1,7 @@
 /******************************************************************************
 
     AudioScience HPI driver
-    Copyright (C) 1997-2011  AudioScience Inc. <support@audioscience.com>
+    Copyright (C) 1997-2012  AudioScience Inc. <support@audioscience.com>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of version 2 of the GNU General Public License as
@@ -39,11 +39,11 @@ void hpios_delay_micro_seconds(u32 num_micro_sec)
 
 }
 
-/** Allocated an area of locked memory for bus master DMA operations.
+/** Allocate an area of locked memory for bus master DMA operations.
 
-On error, return -ENOMEM, and *pMemArea.size = 0
+If allocation fails, return 1, and *pMemArea.size = 0
 */
-int hpios_locked_mem_alloc(struct consistent_dma_area *p_mem_area, u32 size,
+u16 hpios_locked_mem_alloc(struct consistent_dma_area *p_mem_area, u32 size,
 	struct pci_dev *pdev)
 {
 	/*?? any benefit in using managed dmam_alloc_coherent? */
@@ -62,7 +62,7 @@ int hpios_locked_mem_alloc(struct consistent_dma_area *p_mem_area, u32 size,
 		HPI_DEBUG_LOG(WARNING,
 			"failed to allocate %d bytes locked memory\n", size);
 		p_mem_area->size = 0;
-		return -ENOMEM;
+		return 1;
 	}
 }
 
-- 
1.7.0.4

