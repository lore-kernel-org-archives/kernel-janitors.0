From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Jul 2015 14:44:54 +0000
Subject: [PATCH] intel_scu_ipc: move local memory initialization out of a mutex
Message-Id: <1436798694-6907-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'{ }' and memset will both reset the cbuf buffer.
Only once is enough and this can be done outside fo the mutex.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/platform/x86/intel_scu_ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 001b199..187d108 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -216,13 +216,13 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
 	int nc;
 	u32 offset = 0;
 	int err;
-	u8 cbuf[IPC_WWBUF_SIZE] = { };
+	u8 cbuf[IPC_WWBUF_SIZE];
 	u32 *wbuf = (u32 *)&cbuf;
 
-	mutex_lock(&ipclock);
-
 	memset(cbuf, 0, sizeof(cbuf));
 
+	mutex_lock(&ipclock);
+
 	if (ipcdev.pdev = NULL) {
 		mutex_unlock(&ipclock);
 		return -ENODEV;
-- 
2.1.4

