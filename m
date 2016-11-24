From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 10:46:23 +0000
Subject: [patch] char/pcmcia: add some error checking in scr24x_read()
Message-Id: <20161124104623.GA17225@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The "ret = " assignment seems to have accidentally been left off.

Fixes: f2ed287bcc90 ("char/pcmcia: add scr24x_cs chip card interface driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/pcmcia/scr24x_cs.c b/drivers/char/pcmcia/scr24x_cs.c
index 4f215ce..8523ec5 100644
--- a/drivers/char/pcmcia/scr24x_cs.c
+++ b/drivers/char/pcmcia/scr24x_cs.c
@@ -157,7 +157,7 @@ static ssize_t scr24x_read(struct file *filp, char __user *buf, size_t count,
 		ret = -EIO;
 		goto out;
 	}
-	read_chunk(dev, CCID_HEADER_SIZE, len);
+	ret = read_chunk(dev, CCID_HEADER_SIZE, len);
 	if (ret < 0)
 		goto out;
 
