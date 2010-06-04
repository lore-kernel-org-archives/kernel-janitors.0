From: Dan Carpenter <error27@gmail.com>
Date: Fri, 04 Jun 2010 15:39:03 +0000
Subject: [patch v2] V4L/DVB: dvb_ca_en50221: return -EFAULT on copy_to_user
Message-Id: <20100604153903.GH5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100604103629.GC5483@bicker> <4C08F0DD.50702@bfs.de>
In-Reply-To: <4C08F0DD.50702@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Frederic Weisbecker <fweisbec@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_to_user() returns the number of bytes remaining to be copied which
isn't the right thing to return here.  The comments say that these 
functions in dvb_ca_en50221.c should return the number of bytes copied or
an error return.  I've changed it to return -EFAULT.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
V2: Some style fixes suggested by Walter Harms.

diff --git a/drivers/media/dvb/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb/dvb-core/dvb_ca_en50221.c
index ef259a0..cb97e6b 100644
--- a/drivers/media/dvb/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb/dvb-core/dvb_ca_en50221.c
@@ -1318,8 +1318,11 @@ static ssize_t dvb_ca_en50221_io_write(struct file *file,
 
 		fragbuf[0] = connection_id;
 		fragbuf[1] = ((fragpos + fraglen) < count) ? 0x80 : 0x00;
-		if ((status = copy_from_user(fragbuf + 2, buf + fragpos, fraglen)) != 0)
+		status = copy_from_user(fragbuf + 2, buf + fragpos, fraglen);
+		if (status) {
+			status = -EFAULT;
 			goto exit;
+		}
 
 		timeout = jiffies + HZ / 2;
 		written = 0;
@@ -1494,8 +1497,11 @@ static ssize_t dvb_ca_en50221_io_read(struct file *file, char __user * buf,
 
 	hdr[0] = slot;
 	hdr[1] = connection_id;
-	if ((status = copy_to_user(buf, hdr, 2)) != 0)
+	status = copy_to_user(buf, hdr, 2);
+	if (status) {
+		status = -EFAULT;
 		goto exit;
+	}
 	status = pktlen;
 
 exit:
