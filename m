From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 13:52:05 +0000
Subject: [PATCH 1/5] drm/sti: Reduce function calls for sequence output at five places
Message-Id: <1f5c5b0d-77c4-6efc-7906-cee76c33d2b0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
In-Reply-To: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 14:54:52 +0200

Some data were put into a sequence by separate function calls.
Print the same data by five single function calls instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/sti/sti_gdp.c  | 3 +--
 drivers/gpu/drm/sti/sti_hda.c  | 6 ++----
 drivers/gpu/drm/sti/sti_hdmi.c | 6 ++----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 88f16cdf6a4b..3caced5f2e86 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -266,8 +266,7 @@ static void gdp_node_dump_node(struct seq_file *s, struct sti_gdp_node *node)
 	seq_printf(s, "\n\tKEY2 0x%08X", node->gam_gdp_key2);
 	seq_printf(s, "\n\tPPT  0x%08X", node->gam_gdp_ppt);
 	gdp_dbg_ppt(s, node->gam_gdp_ppt);
-	seq_printf(s, "\n\tCML  0x%08X", node->gam_gdp_cml);
-	seq_puts(s, "\n");
+	seq_printf(s, "\n\tCML  0x%08X\n", node->gam_gdp_cml);
 }
 
 static int gdp_node_dbg_show(struct seq_file *s, void *arg)
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 0c0a75bc8bc3..e3475a17eaeb 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -320,8 +320,7 @@ static void hda_dbg_awg_microcode(struct seq_file *s, void __iomem *reg)
 {
 	unsigned int i;
 
-	seq_puts(s, "\n\n");
-	seq_puts(s, "  HDA AWG microcode:");
+	seq_puts(s, "\n\n  HDA AWG microcode:");
 	for (i = 0; i < AWG_MAX_INST; i++) {
 		if (i % 8 = 0)
 			seq_printf(s, "\n  %04X:", i);
@@ -333,8 +332,7 @@ static void hda_dbg_video_dacs_ctrl(struct seq_file *s, void __iomem *reg)
 {
 	u32 val = readl(reg);
 
-	seq_puts(s, "\n");
-	seq_printf(s, "\n  %-25s 0x%08X", "VIDEO_DACS_CONTROL", val);
+	seq_printf(s, "\n\n  %-25s 0x%08X", "VIDEO_DACS_CONTROL", val);
 	seq_puts(s, "\tHD DACs ");
 	seq_puts(s, val & DAC_CFG_HD_HZUVW_OFF_MASK ? "disabled" : "enabled");
 }
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 243905b6ae59..52cdff651c0d 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -692,8 +692,7 @@ static int hdmi_dbg_show(struct seq_file *s, void *data)
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD4, HDMI_IFRAME_SLOT_AVI);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD5, HDMI_IFRAME_SLOT_AVI);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD6, HDMI_IFRAME_SLOT_AVI);
-	seq_puts(s, "\n");
-	seq_printf(s, "\n AUDIO Infoframe (Data Island slot N=%d):",
+	seq_printf(s, "\n\n AUDIO Infoframe (Data Island slot N=%d):",
 		   HDMI_IFRAME_SLOT_AUDIO);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_HEAD_WORD, HDMI_IFRAME_SLOT_AUDIO);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD0, HDMI_IFRAME_SLOT_AUDIO);
@@ -703,8 +702,7 @@ static int hdmi_dbg_show(struct seq_file *s, void *data)
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD4, HDMI_IFRAME_SLOT_AUDIO);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD5, HDMI_IFRAME_SLOT_AUDIO);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD6, HDMI_IFRAME_SLOT_AUDIO);
-	seq_puts(s, "\n");
-	seq_printf(s, "\n VENDOR SPECIFIC Infoframe (Data Island slot N=%d):",
+	seq_printf(s, "\n\n VENDOR SPECIFIC Infoframe (Data Island slot N=%d):",
 		   HDMI_IFRAME_SLOT_VENDOR);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_HEAD_WORD, HDMI_IFRAME_SLOT_VENDOR);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD0, HDMI_IFRAME_SLOT_VENDOR);
-- 
2.12.2

