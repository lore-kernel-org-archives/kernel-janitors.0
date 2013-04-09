From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Apr 2013 05:18:38 +0000
Subject: [patch] tty: mxser: forever loops on error
Message-Id: <20130409051838.GB1516@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There were a couple signedness bugs decrementing "i" which would lead to
a forever loops.

I've made a couple other variables signed as well because they are all
related array offsets and it would be weird if they weren't the same
type.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/mxser.c b/drivers/tty/mxser.c
index d996038..a095859 100644
--- a/drivers/tty/mxser.c
+++ b/drivers/tty/mxser.c
@@ -2556,9 +2556,9 @@ static int mxser_probe(struct pci_dev *pdev,
 {
 #ifdef CONFIG_PCI
 	struct mxser_board *brd;
-	unsigned int i, j;
 	unsigned long ioaddress;
 	struct device *tty_dev;
+	int i, j;
 	int retval = -EINVAL;
 
 	for (i = 0; i < MXSER_BOARDS; i++)
@@ -2700,7 +2700,7 @@ static int __init mxser_module_init(void)
 {
 	struct mxser_board *brd;
 	struct device *tty_dev;
-	unsigned int b, i, m;
+	int b, i, m;
 	int retval;
 
 	mxvar_sdriver = alloc_tty_driver(MXSER_PORTS + 1);
