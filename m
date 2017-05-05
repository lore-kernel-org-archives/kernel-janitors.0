From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 13:54:02 +0000
Subject: [PATCH 2/5] drm/sti: Replace 17 seq_puts() calls by seq_putc()
Message-Id: <5b4e2964-0742-8367-976f-678356d9347a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
In-Reply-To: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 15:00:46 +0200

Single characters should be put into a sequence at several places.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/sti/sti_cursor.c |  3 +--
 drivers/gpu/drm/sti/sti_dvo.c    |  3 +--
 drivers/gpu/drm/sti/sti_hda.c    |  3 +--
 drivers/gpu/drm/sti/sti_hdmi.c   | 17 ++++++++---------
 drivers/gpu/drm/sti/sti_hqvdp.c  |  3 +--
 drivers/gpu/drm/sti/sti_mixer.c  |  3 +--
 drivers/gpu/drm/sti/sti_tvout.c  |  5 ++---
 drivers/gpu/drm/sti/sti_vid.c    |  5 ++---
 8 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index cca75bddb9ad..cd35b9d9de26 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -121,8 +121,7 @@ static int cursor_dbg_show(struct seq_file *s, void *data)
 	cursor_dbg_cml(s, cursor, readl(cursor->regs + CUR_CML));
 	DBGFS_DUMP(CUR_AWS);
 	DBGFS_DUMP(CUR_AWE);
-	seq_puts(s, "\n");
-
+	seq_putc(s, '\n');
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index bb23318a44b7..24ebc6b2f34d 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -186,8 +186,7 @@ static int dvo_dbg_show(struct seq_file *s, void *data)
 	DBGFS_DUMP(DVO_LUT_PROG_MID);
 	DBGFS_DUMP(DVO_LUT_PROG_HIGH);
 	dvo_dbg_awg_microcode(s, dvo->regs + DVO_DIGSYNC_INSTR_I);
-	seq_puts(s, "\n");
-
+	seq_putc(s, '\n');
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index e3475a17eaeb..d6ed909d9d75 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -354,8 +354,7 @@ static int hda_dbg_show(struct seq_file *s, void *data)
 	hda_dbg_awg_microcode(s, hda->regs + HDA_SYNC_AWGI);
 	if (hda->video_dacs_ctrl)
 		hda_dbg_video_dacs_ctrl(s, hda->video_dacs_ctrl);
-	seq_puts(s, "\n");
-
+	seq_putc(s, '\n');
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 52cdff651c0d..a59c95a8081b 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -592,7 +592,7 @@ static void hdmi_dbg_cfg(struct seq_file *s, int val)
 {
 	int tmp;
 
-	seq_puts(s, "\t");
+	seq_putc(s, '\t');
 	tmp = val & HDMI_CFG_HDMI_NOT_DVI;
 	DBGFS_PRINT_STR("mode:", tmp ? "HDMI" : "DVI");
 	seq_puts(s, "\t\t\t\t\t");
@@ -616,7 +616,7 @@ static void hdmi_dbg_sta(struct seq_file *s, int val)
 {
 	int tmp;
 
-	seq_puts(s, "\t");
+	seq_putc(s, '\t');
 	tmp = (val & HDMI_STA_DLL_LCK);
 	DBGFS_PRINT_STR("pll:", tmp ? "locked" : "not locked");
 	seq_puts(s, "\t\t\t\t\t");
@@ -632,7 +632,7 @@ static void hdmi_dbg_sw_di_cfg(struct seq_file *s, int val)
 			       "once every field",
 			       "once every frame"};
 
-	seq_puts(s, "\t");
+	seq_putc(s, '\t');
 	tmp = (val & HDMI_IFRAME_CFG_DI_N(HDMI_IFRAME_MASK, 1));
 	DBGFS_PRINT_STR("Data island 1:", en_di[tmp]);
 	seq_puts(s, "\t\t\t\t\t");
@@ -664,16 +664,16 @@ static int hdmi_dbg_show(struct seq_file *s, void *data)
 	DBGFS_DUMP("\n", HDMI_STA);
 	hdmi_dbg_sta(s, hdmi_read(hdmi, HDMI_STA));
 	DBGFS_DUMP("", HDMI_ACTIVE_VID_XMIN);
-	seq_puts(s, "\t");
+	seq_putc(s, '\t');
 	DBGFS_PRINT_INT("Xmin:", hdmi_read(hdmi, HDMI_ACTIVE_VID_XMIN));
 	DBGFS_DUMP("", HDMI_ACTIVE_VID_XMAX);
-	seq_puts(s, "\t");
+	seq_putc(s, '\t');
 	DBGFS_PRINT_INT("Xmax:", hdmi_read(hdmi, HDMI_ACTIVE_VID_XMAX));
 	DBGFS_DUMP("", HDMI_ACTIVE_VID_YMIN);
-	seq_puts(s, "\t");
+	seq_putc(s, '\t');
 	DBGFS_PRINT_INT("Ymin:", hdmi_read(hdmi, HDMI_ACTIVE_VID_YMIN));
 	DBGFS_DUMP("", HDMI_ACTIVE_VID_YMAX);
-	seq_puts(s, "\t");
+	seq_putc(s, '\t');
 	DBGFS_PRINT_INT("Ymax:", hdmi_read(hdmi, HDMI_ACTIVE_VID_YMAX));
 	DBGFS_DUMP("", HDMI_SW_DI_CFG);
 	hdmi_dbg_sw_di_cfg(s, hdmi_read(hdmi, HDMI_SW_DI_CFG));
@@ -712,8 +712,7 @@ static int hdmi_dbg_show(struct seq_file *s, void *data)
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD4, HDMI_IFRAME_SLOT_VENDOR);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD5, HDMI_IFRAME_SLOT_VENDOR);
 	DBGFS_DUMP_DI(HDMI_SW_DI_N_PKT_WORD6, HDMI_IFRAME_SLOT_VENDOR);
-	seq_puts(s, "\n");
-
+	seq_putc(s, '\n');
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 66f843148ef7..372ea294da80 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -625,8 +625,7 @@ static int hqvdp_dbg_show(struct seq_file *s, void *data)
 		hqvdp_dbg_dump_cmd(s, (struct sti_hqvdp_cmd *)virt);
 	}
 
-	seq_puts(s, "\n");
-
+	seq_putc(s, '\n');
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/sti/sti_mixer.c b/drivers/gpu/drm/sti/sti_mixer.c
index 4ddc58f7fe2e..2bd1d46fe1cd 100644
--- a/drivers/gpu/drm/sti/sti_mixer.c
+++ b/drivers/gpu/drm/sti/sti_mixer.c
@@ -162,8 +162,7 @@ static int mixer_dbg_show(struct seq_file *s, void *arg)
 	DBGFS_DUMP(GAM_MIXER_MBP);
 	DBGFS_DUMP(GAM_MIXER_MX0);
 	mixer_dbg_mxn(s, mixer->regs + GAM_MIXER_MX0);
-	seq_puts(s, "\n");
-
+	seq_putc(s, '\n');
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index 8b8ea717c121..63b982048743 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -459,7 +459,7 @@ static void tvout_dbg_vip(struct seq_file *s, int val)
 				   "Aux (color matrix by-passed)",
 				   "", "", "", "", "", "Force value"};
 
-	seq_puts(s, "\t");
+	seq_putc(s, '\t');
 	mask = TVO_VIP_REORDER_MASK << TVO_VIP_REORDER_R_SHIFT;
 	r = (val & mask) >> TVO_VIP_REORDER_R_SHIFT;
 	mask = TVO_VIP_REORDER_MASK << TVO_VIP_REORDER_G_SHIFT;
@@ -558,8 +558,7 @@ static int tvout_dbg_show(struct seq_file *s, void *data)
 	DBGFS_DUMP(TVO_CSC_AUX_M6);
 	DBGFS_DUMP(TVO_CSC_AUX_M7);
 	DBGFS_DUMP(TVO_AUX_IN_VID_FORMAT);
-	seq_puts(s, "\n");
-
+	seq_putc(s, '\n');
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/sti/sti_vid.c b/drivers/gpu/drm/sti/sti_vid.c
index 2ad59892b57e..577a3341d3c1 100644
--- a/drivers/gpu/drm/sti/sti_vid.c
+++ b/drivers/gpu/drm/sti/sti_vid.c
@@ -61,7 +61,7 @@
 static void vid_dbg_ctl(struct seq_file *s, int val)
 {
 	val = val >> 30;
-	seq_puts(s, "\t");
+	seq_putc(s, '\t');
 
 	if (!(val & 1))
 		seq_puts(s, "NOT ");
@@ -114,8 +114,7 @@ static int vid_dbg_show(struct seq_file *s, void *arg)
 	DBGFS_DUMP(VID_BC);
 	DBGFS_DUMP(VID_TINT);
 	DBGFS_DUMP(VID_CSAT);
-	seq_puts(s, "\n");
-
+	seq_putc(s, '\n');
 	return 0;
 }
 
-- 
2.12.2

