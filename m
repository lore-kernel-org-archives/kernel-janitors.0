From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 11 Dec 2007 04:33:04 +0000
Subject: [PATCH 6/6] pcmcia/pcnet_cs: Fix 'shadow variable' warning
Message-Id: <20071211043438.28518.66675.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Fixing:
  CHECK   drivers/net/pcmcia/pcnet_cs.c
drivers/net/pcmcia/pcnet_cs.c:523:15: warning: symbol 'hw_info' shadows an earlier one
drivers/net/pcmcia/pcnet_cs.c:148:18: originally declared here

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---


diff --git a/drivers/net/pcmcia/pcnet_cs.c b/drivers/net/pcmcia/pcnet_cs.c
index db6a97d..5779344 100644
--- a/drivers/net/pcmcia/pcnet_cs.c
+++ b/drivers/net/pcmcia/pcnet_cs.c
@@ -520,7 +520,7 @@ static int pcnet_config(struct pcmcia_device *link)
     int i, last_ret, last_fn, start_pg, stop_pg, cm_offset;
     int has_shmem = 0;
     u_short buf[64];
-    hw_info_t *hw_info;
+    hw_info_t *local_hw_info;
     DECLARE_MAC_BUF(mac);
 
     DEBUG(0, "pcnet_config(0x%p)\n", link);
@@ -589,23 +589,23 @@ static int pcnet_config(struct pcmcia_device *link)
 	dev->if_port = 0;
     }
 
-    hw_info = get_hwinfo(link);
-    if (hw_info = NULL)
-	hw_info = get_prom(link);
-    if (hw_info = NULL)
-	hw_info = get_dl10019(link);
-    if (hw_info = NULL)
-	hw_info = get_ax88190(link);
-    if (hw_info = NULL)
-	hw_info = get_hwired(link);
-
-    if (hw_info = NULL) {
+    local_hw_info = get_hwinfo(link);
+    if (local_hw_info = NULL)
+	local_hw_info = get_prom(link);
+    if (local_hw_info = NULL)
+	local_hw_info = get_dl10019(link);
+    if (local_hw_info = NULL)
+	local_hw_info = get_ax88190(link);
+    if (local_hw_info = NULL)
+	local_hw_info = get_hwired(link);
+
+    if (local_hw_info = NULL) {
 	printk(KERN_NOTICE "pcnet_cs: unable to read hardware net"
 	       " address for io base %#3lx\n", dev->base_addr);
 	goto failed;
     }
 
-    info->flags = hw_info->flags;
+    info->flags = local_hw_info->flags;
     /* Check for user overrides */
     info->flags |= (delay_output) ? DELAY_OUTPUT : 0;
     if ((link->manf_id = MANFID_SOCKET) &&
