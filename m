From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Jun 2016 12:23:16 +0000
Subject: [patch] usb: gadget: f_fs: check for allocation failure
Message-Id: <20160624122316.GB23169@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Return -ENOMEM if kmalloc() fails.

Fixes: 9353afbbfa7b ('usb: gadget: f_fs: buffer data from ‘oversized’ OUT requests')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index a91fcb0..5c8429f 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -775,6 +775,8 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 
 	data_len -= ret;
 	buf = kmalloc(sizeof(*buf) + data_len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 	buf->length = data_len;
 	buf->data = buf->storage;
 	memcpy(buf->storage, data + ret, data_len);
