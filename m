From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:34 +0000
Subject: [PATCH 14/33] Staging: intel_sst: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-14-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/intel_sst/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/intel_sst/Makefile b/drivers/staging/intel_sst/Makefile
index 1deda46..9eb7c15 100644
--- a/drivers/staging/intel_sst/Makefile
+++ b/drivers/staging/intel_sst/Makefile
@@ -1,7 +1,7 @@
 #
 # Makefile for Intel MID Audio drivers
 #
-snd-intel-sst-objs := intel_sst.o intel_sst_ipc.o intel_sst_stream.o intel_sst_drv_interface.o intel_sst_dsp.o intel_sst_pvt.o intel_sst_stream_encoded.o intel_sst_app_interface.o
-snd-intelmid-objs := intelmid.o intelmid_msic_control.o intelmid_ctrl.o intelmid_pvt.o intelmid_v0_control.o intelmid_v1_control.o intelmid_v2_control.o
+snd-intel-sst-y := intel_sst.o intel_sst_ipc.o intel_sst_stream.o intel_sst_drv_interface.o intel_sst_dsp.o intel_sst_pvt.o intel_sst_stream_encoded.o intel_sst_app_interface.o
+snd-intelmid-y := intelmid.o intelmid_msic_control.o intelmid_ctrl.o intelmid_pvt.o intelmid_v0_control.o intelmid_v1_control.o intelmid_v2_control.o
 obj-$(CONFIG_SND_INTEL_SST) += snd-intel-sst.o
 obj-$(CONFIG_SND_INTELMID) += snd-intelmid.o
-- 
1.7.3.1.50.g1e633

