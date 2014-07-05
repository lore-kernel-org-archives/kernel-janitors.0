From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Sat, 05 Jul 2014 00:25:14 +0000
Subject: [PATCH] staging: ft1000-usb: check for errors in card_send_command
Message-Id: <1404519914-31078-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, greg@kroah.com, marek.belisko@gmail.com
Cc: Andrey Utkin <andrey.krieger.utkin@gmail.com>

See https://bugzilla.kernel.org/show_bug.cgi?idx561
---8<---
Reported-by: Maksymilian Arciemowicz <max@cert.cx>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/staging/ft1000/ft1000-usb/ft1000_debug.c |  6 +++---
 drivers/staging/ft1000/ft1000-usb/ft1000_hw.c    | 25 +++++++++++++++++-------
 drivers/staging/ft1000/ft1000-usb/ft1000_usb.h   |  2 +-
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_debug.c b/drivers/staging/ft1000/ft1000-usb/ft1000_debug.c
index a8945b7..9f4c785 100644
--- a/drivers/staging/ft1000/ft1000-usb/ft1000_debug.c
+++ b/drivers/staging/ft1000/ft1000-usb/ft1000_debug.c
@@ -482,14 +482,14 @@ static long ft1000_ioctl(struct file *file, unsigned int command,
         /* Connect Message */
         DEBUG("FT1000:ft1000_ioctl: IOCTL_FT1000_CONNECT\n");
         ConnectionMsg[79] = 0xfc;
-			   card_send_command(ft1000dev, (unsigned short *)ConnectionMsg, 0x4c);
+			   result = card_send_command(ft1000dev, (unsigned short *)ConnectionMsg, 0x4c);
 
         break;
     case IOCTL_DISCONNECT:
         /* Disconnect Message */
         DEBUG("FT1000:ft1000_ioctl: IOCTL_FT1000_DISCONNECT\n");
         ConnectionMsg[79] = 0xfd;
-			   card_send_command(ft1000dev, (unsigned short *)ConnectionMsg, 0x4c);
+			   result = card_send_command(ft1000dev, (unsigned short *)ConnectionMsg, 0x4c);
         break;
     case IOCTL_GET_DSP_STAT_CMD:
         /* DEBUG("FT1000:ft1000_ioctl: IOCTL_FT1000_GET_DSP_STAT called\n"); */
@@ -652,7 +652,7 @@ static long ft1000_ioctl(struct file *file, unsigned int command,
                             }
                             pmsg++;
 				ppseudo_hdr = (struct pseudo_hdr *)pmsg;
-                           card_send_command(ft1000dev,(unsigned short*)dpram_data,total_len+2);
+                           result = card_send_command(ft1000dev,(unsigned short*)dpram_data,total_len+2);
 
 
                             ft1000dev->app_info[app_index].nTxMsg++;
diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c b/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
index b6a7708..7012e09 100644
--- a/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
+++ b/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
@@ -322,18 +322,23 @@ static void card_reset_dsp(struct ft1000_usb *ft1000dev, bool value)
 *               ptempbuffer - command buffer
 *               size - command buffer size
 */
-void card_send_command(struct ft1000_usb *ft1000dev, void *ptempbuffer,
+int card_send_command(struct ft1000_usb *ft1000dev, void *ptempbuffer,
 		       int size)
 {
+	int ret;
 	unsigned short temp;
 	unsigned char *commandbuf;
 
 	DEBUG("card_send_command: enter card_send_command... size=%d\n", size);
 
 	commandbuf = kmalloc(size + 2, GFP_KERNEL);
+	if (!commandbuf)
+		return -ENOMEM;
 	memcpy((void *)commandbuf + 2, (void *)ptempbuffer, size);
 
-	ft1000_read_register(ft1000dev, &temp, FT1000_REG_DOORBELL);
+	ret = ft1000_read_register(ft1000dev, &temp, FT1000_REG_DOORBELL);
+	if (ret)
+		return ret;
 
 	if (temp & 0x0100)
 		usleep_range(900, 1100);
@@ -345,19 +350,23 @@ void card_send_command(struct ft1000_usb *ft1000dev, void *ptempbuffer,
 	if (size % 4)
 		size += 4 - (size % 4);
 
-	ft1000_write_dpram32(ft1000dev, 0, commandbuf, size);
+	ret = ft1000_write_dpram32(ft1000dev, 0, commandbuf, size);
+	if (ret)
+		return ret;
 	usleep_range(900, 1100);
-	ft1000_write_register(ft1000dev, FT1000_DB_DPRAM_TX,
+	ret = ft1000_write_register(ft1000dev, FT1000_DB_DPRAM_TX,
 			      FT1000_REG_DOORBELL);
+	if (ret)
+		return ret;
 	usleep_range(900, 1100);
 
-	ft1000_read_register(ft1000dev, &temp, FT1000_REG_DOORBELL);
+	ret = ft1000_read_register(ft1000dev, &temp, FT1000_REG_DOORBELL);
 
 #if 0
 	if ((temp & 0x0100) = 0)
 		DEBUG("card_send_command: Message sent\n");
 #endif
-
+	return ret;
 }
 
 /* load or reload the DSP */
@@ -1375,8 +1384,10 @@ static int ft1000_proc_drvmsg(struct ft1000_usb *dev, u16 size)
 			*pmsg++ = convert.wrd;
 			*pmsg++ = htons(info->DrvErrNum);
 
-			card_send_command(dev, (unsigned char *)&tempbuffer[0],
+			status = card_send_command(dev, (unsigned char *)&tempbuffer[0],
 					(u16)(0x0012 + PSEUDOSZ));
+			if (status)
+				goto out;
 			info->DrvErrNum = 0;
 		}
 		dev->DrvMsgPend = 0;
diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_usb.h b/drivers/staging/ft1000/ft1000-usb/ft1000_usb.h
index 2d4b02e..464e5ab 100644
--- a/drivers/staging/ft1000/ft1000-usb/ft1000_usb.h
+++ b/drivers/staging/ft1000/ft1000-usb/ft1000_usb.h
@@ -136,7 +136,7 @@ extern spinlock_t free_buff_lock;
 
 int ft1000_create_dev(struct ft1000_usb *dev);
 void ft1000_destroy_dev(struct net_device *dev);
-extern void card_send_command(struct ft1000_usb *ft1000dev,
+extern int card_send_command(struct ft1000_usb *ft1000dev,
 			      void *ptempbuffer, int size);
 
 struct dpram_blk *ft1000_get_buffer(struct list_head *bufflist);
-- 
1.8.3.2

