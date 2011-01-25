From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Tue, 25 Jan 2011 00:46:18 +0000
Subject: [PATCH] Staging: bcm: Check correct user provided length and fix
Message-Id: <1295916378.5935.10.camel@javier-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

bcm driver copies a buffer length provided by userpace without checking it.

RxCntrlMsgBitMask is of type unsigned long so only makes sense to copy
sizeof(unsigned long) bytes.

Also, copy_from_user() returns the number of bytes that could not be copied.
The driver is returning that value as error code instead of -EFAULT.

This patch solves both issues.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---

Dan, Stephen,
This patch only changes the code needed to solve the bugs commented before
and just ignore the surrounding code since there are so many style issues.
In later patches I can clean up the driver since only checkpatch reports
933 errors and 544 warnings.

 drivers/staging/bcm/Bcmchar.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index 31674ea..7dff283 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -2024,6 +2024,12 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"copy of Ioctl buffer is failed from user space");
+					Status = -EFAULT;
+					break;
+				}
+
+				if (IoBuffer.InputLength != sizeof(unsigned long)) {
+					Status = -EINVAL;
 					break;
 				}
 
@@ -2031,6 +2037,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				if(Status)
 				{
 					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"copy of control bit mask failed from user space");
+					Status = -EFAULT;
 					break;
 				}
 				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"\n Got user defined cntrl msg bit mask :%lx", RxCntrlMsgBitMask);
-- 
1.7.0.4



