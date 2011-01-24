From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 24 Jan 2011 01:12:28 +0000
Subject: [PATCH v2] Staging: bcm: Fix potential buffer overflow and style
Message-Id: <1295831548.3921.10.camel@javier-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

bcm driver copies from userpace with the following statement:

copy_from_user(&RxCntrlMsgBitMask, IoBuffer.InputBuffer, IoBuffer.InputLength);

Compiling gives the following warning:

In function ‘copy_from_user’,
    inlined from ‘bcm_char_ioctl’ at drivers/staging/bcm/Bcmchar.c:2030:
linux-next/arch/x86/include/asm/uaccess_32.h:212: warning: call to
‘copy_from_user_overflow’ declared with attribute warning: copy_from_user()
buffer size is not provably correct.

RxCntrlMsgBitMask is of type unsigned long so we have to check that
IoBuffer.InputLength is not greater than sizeof(unsigned long).

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 V2: Check the user provided length recommended by Stephen Hemminger
     Check for copy_from_user() and return -EFAULT; do not use ULONG and 
     get rid of unnecessary log information recommended by Dan Carpenter.
	
 drivers/staging/bcm/Bcmchar.c |   48 +++++++++++++++++++++++-----------------
 1 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index 31674ea..969c766 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -2015,28 +2015,36 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 				break ;
 			 }
 
-		case IOCTL_BCM_CNTRLMSG_MASK:
-			 {
-				ULONG RxCntrlMsgBitMask = 0 ;
+	case IOCTL_BCM_CNTRLMSG_MASK:
+	{
+		unsigned long RxCntrlMsgBitMask = 0;
+
+		/* Copy Ioctl Buffer structure */
+		Status = copy_from_user(&IoBuffer, argp, sizeof(IOCTL_BUFFER));
+		if (Status) {
+			BCM_DEBUG_PRINT(Adapter, DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,
+					"copy of Ioctl buffer is failed from user space");
+			Status = -EFAULT;
+			break;
+		}
 
-				/* Copy Ioctl Buffer structure */
-				Status = copy_from_user(&IoBuffer, argp, sizeof(IOCTL_BUFFER));
-				if(Status)
-				{
-					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"copy of Ioctl buffer is failed from user space");
-					break;
-				}
+		if (IoBuffer.InputLength > sizeof(unsigned long)) {
+			Status = -EINVAL;
+			break;
+		}
 
-				Status = copy_from_user(&RxCntrlMsgBitMask, IoBuffer.InputBuffer, IoBuffer.InputLength);
-				if(Status)
-				{
-					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"copy of control bit mask failed from user space");
-					break;
-				}
-				BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"\n Got user defined cntrl msg bit mask :%lx", RxCntrlMsgBitMask);
-				pTarang->RxCntrlMsgBitMask = RxCntrlMsgBitMask ;
-			 }
-			 break;
+		Status = copy_from_user(&RxCntrlMsgBitMask, IoBuffer.InputBuffer,
+					IoBuffer.InputLength);
+		if (Status) {
+			BCM_DEBUG_PRINT(Adapter, DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,
+					"copy of control bit mask failed from user space");
+			Status = -EFAULT;
+			break;
+		}
+
+		pTarang->RxCntrlMsgBitMask = RxCntrlMsgBitMask;
+	}
+	break;
 			case IOCTL_BCM_GET_DEVICE_DRIVER_INFO:
 			{
 				DEVICE_DRIVER_INFO DevInfo;
-- 
1.7.0.4




