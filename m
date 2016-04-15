From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Apr 2016 14:45:58 +0000
Subject: [patch] intel_telemetry_pltdrv: silence an unintialized variable warning
Message-Id: <20160415144558.GD8953@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Presumably "pss_period" and "ioss_period" can't both be zero, but this
function is never called so we can't infer that using static analysis
alone.

Let's silence the warning by setting "ret" to zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index 397119f..781bd10 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -659,7 +659,7 @@ static int telemetry_plt_update_events(struct telemetry_evtconfig pss_evtconfig,
 static int telemetry_plt_set_sampling_period(u8 pss_period, u8 ioss_period)
 {
 	u32 telem_ctrl = 0;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&(telm_conf->telem_lock));
 	if (ioss_period) {
