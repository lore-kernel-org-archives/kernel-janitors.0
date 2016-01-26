From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Jan 2016 09:24:25 +0000
Subject: [patch] intel_scu_ipcutil: underflow in scu_reg_access()
Message-Id: <20160126092425.GA15717@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Hart <dvhart@infradead.org>, Sreedhara DS <sreedhara.ds@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"count" is controlled by the user and it can be negative.  Let's prevent
that by making it unsigned.  You have to have CAP_SYS_RAWIO to call this
function so the bug is not as serious as it could be.

Fixes: 5369c02d951a ('intel_scu_ipc: Utility driver for intel scu ipc')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/intel_scu_ipcutil.c b/drivers/platform/x86/intel_scu_ipcutil.c
index 02bc5a6..aa45424 100644
--- a/drivers/platform/x86/intel_scu_ipcutil.c
+++ b/drivers/platform/x86/intel_scu_ipcutil.c
@@ -49,7 +49,7 @@ struct scu_ipc_data {
 
 static int scu_reg_access(u32 cmd, struct scu_ipc_data  *data)
 {
-	int count = data->count;
+	unsigned int count = data->count;
 
 	if (count = 0 || count = 3 || count > 4)
 		return -EINVAL;
