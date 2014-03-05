From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Mar 2014 08:43:19 +0000
Subject: [patch]  Staging: rtl8712: fix an error test in start_drv_threads()
Message-Id: <20140305084319.GA9779@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Testing for "if (IS_ERR(padapter->cmdThread) < 0)" doesn't make sense.
The kthread_run() function returns error pointers on error pointers on
error so it should just be "if (IS_ERR(padapter->cmdThread))".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 37fe33005c02..6bd08213cb70 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -239,7 +239,7 @@ static u32 start_drv_threads(struct _adapter *padapter)
 {
 	padapter->cmdThread = kthread_run(r8712_cmd_thread, padapter, "%s",
 			      padapter->pnetdev->name);
-	if (IS_ERR(padapter->cmdThread) < 0)
+	if (IS_ERR(padapter->cmdThread))
 		return _FAIL;
 	return _SUCCESS;
 }
