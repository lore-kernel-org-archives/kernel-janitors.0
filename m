From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Dec 2017 12:12:38 +0000
Subject: [PATCH][next] misc: rtsx: rts5260: make several functions static
Message-Id: <20171204121238.4751-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Bristot de Oliveira <bristot@redhat.com>, Rui Feng <rui_feng@realsil.com.cn>, Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Several functios are local to the source and do not need to be in global
scope, so make them static.

Cleans up sparse warnings:
symbol 'rts5260_get_ocpstat' was not declared. Should it be static?
symbol 'rts5260_get_ocpstat2' was not declared. Should it be static?
symbol 'rts5260_clear_ocpstat' was not declared. Should it be static?
symbol 'rts5260_process_ocp' was not declared. Should it be static?
symbol 'rts5260_init_hw' was not declared. Should it be static?
symbol 'rts5260_set_aspm' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/cardreader/rts5260.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/cardreader/rts5260.c b/drivers/misc/cardreader/rts5260.c
index 07cb93abf685..a493b01c5bc6 100644
--- a/drivers/misc/cardreader/rts5260.c
+++ b/drivers/misc/cardreader/rts5260.c
@@ -388,17 +388,17 @@ static void rts5260_disable_ocp(struct rtsx_pcr *pcr)
 				OC_POWER_DOWN);
 }
 
-int rts5260_get_ocpstat(struct rtsx_pcr *pcr, u8 *val)
+static int rts5260_get_ocpstat(struct rtsx_pcr *pcr, u8 *val)
 {
 	return rtsx_pci_read_register(pcr, REG_OCPSTAT, val);
 }
 
-int rts5260_get_ocpstat2(struct rtsx_pcr *pcr, u8 *val)
+static int rts5260_get_ocpstat2(struct rtsx_pcr *pcr, u8 *val)
 {
 	return rtsx_pci_read_register(pcr, REG_DV3318_OCPSTAT, val);
 }
 
-void rts5260_clear_ocpstat(struct rtsx_pcr *pcr)
+static void rts5260_clear_ocpstat(struct rtsx_pcr *pcr)
 {
 	u8 mask = 0;
 	u8 val = 0;
@@ -418,7 +418,7 @@ void rts5260_clear_ocpstat(struct rtsx_pcr *pcr)
 				DV3318_OCP_INT_CLR | DV3318_OCP_CLR, 0);
 }
 
-void rts5260_process_ocp(struct rtsx_pcr *pcr)
+static void rts5260_process_ocp(struct rtsx_pcr *pcr)
 {
 	if (!pcr->option.ocp_en)
 		return;
@@ -449,7 +449,7 @@ void rts5260_process_ocp(struct rtsx_pcr *pcr)
 	}
 }
 
-int rts5260_init_hw(struct rtsx_pcr *pcr)
+static int rts5260_init_hw(struct rtsx_pcr *pcr)
 {
 	int err;
 
@@ -620,7 +620,7 @@ static int rts5260_extra_init_hw(struct rtsx_pcr *pcr)
 	return 0;
 }
 
-void rts5260_set_aspm(struct rtsx_pcr *pcr, bool enable)
+static void rts5260_set_aspm(struct rtsx_pcr *pcr, bool enable)
 {
 	struct rtsx_cr_option *option = &pcr->option;
 	u8 val = 0;
-- 
2.14.1

