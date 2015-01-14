From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jan 2015 21:02:18 +0000
Subject: [patch 3/6] usb: gadget: uvc: remove an impossible condition
Message-Id: <20150114210218.GC23203@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"num" is a u32 so "(num > 0xFFFFFFFF)" is never true.  Also the range
is already checked in kstrtou32().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 2bd0688..738d68f 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1156,8 +1156,6 @@ static inline int __uvcg_fill_frm_intrv(char *buf, void *priv)
 	ret = kstrtou32(buf, 0, &num);
 	if (ret)
 		return ret;
-	if (num > 0xFFFFFFFF)
-		return -EINVAL;
 
 	interv = priv;
 	**interv = cpu_to_le32(num);
