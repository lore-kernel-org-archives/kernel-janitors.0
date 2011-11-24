From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 09:06:48 +0000
Subject: [patch 2/2] staging/media: lirc_imon: remove unused definitions
Message-Id: <20111124090648.GB22994@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Jarod Wilson <jarod@redhat.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-media@vger.kernel.org, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't have these functions any more now we have module_usb_driver().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't know if this goes in through USB or the media tree.

diff --git a/drivers/staging/media/lirc/lirc_imon.c b/drivers/staging/media/lirc/lirc_imon.c
index f682180..c3eae4d 100644
--- a/drivers/staging/media/lirc/lirc_imon.c
+++ b/drivers/staging/media/lirc/lirc_imon.c
@@ -70,10 +70,6 @@ static ssize_t vfd_write(struct file *file, const char *buf,
 static int ir_open(void *data);
 static void ir_close(void *data);
 
-/* Driver init/exit prototypes */
-static int __init imon_init(void);
-static void __exit imon_exit(void);
-
 /*** G L O B A L S ***/
 #define IMON_DATA_BUF_SZ	35
 
