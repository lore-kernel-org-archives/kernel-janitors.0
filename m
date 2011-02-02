From: Julia Lawall <julia@diku.dk>
Date: Wed, 02 Feb 2011 16:47:39 +0000
Subject: [PATCH] drivers/char/bfin_jtag_comm.c: avoid calling put_tty_driver on NULL
Message-Id: <1296666450-15563-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, Torben Hohn <torbenh@gmx.de>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

put_tty_driver calls tty_driver_kref_put on its argument, and then
tty_driver_kref_put calls kref_put on the address of a field of this
argument.  kref_put checks for NULL, but in this case the field is likely
to have some offset and so the result of taking its address will not be
NULL.  Labels are added to be able to skip over the call to put_tty_driver
when the argument will be NULL.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
@@

*if (x = NULL)
{ ...
* put_tty_driver(x);
  ...
  return ...;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/bfin_jtag_comm.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/char/bfin_jtag_comm.c b/drivers/char/bfin_jtag_comm.c
index 1640244..03c285b 100644
--- a/drivers/char/bfin_jtag_comm.c
+++ b/drivers/char/bfin_jtag_comm.c
@@ -251,11 +251,11 @@ static int __init bfin_jc_init(void)
 	bfin_jc_write_buf.head = bfin_jc_write_buf.tail = 0;
 	bfin_jc_write_buf.buf = kmalloc(CIRC_SIZE, GFP_KERNEL);
 	if (!bfin_jc_write_buf.buf)
-		goto err;
+		goto err_buf;
 
 	bfin_jc_driver = alloc_tty_driver(1);
 	if (!bfin_jc_driver)
-		goto err;
+		goto err_driver;
 
 	bfin_jc_driver->owner        = THIS_MODULE;
 	bfin_jc_driver->driver_name  = DRV_NAME;
@@ -275,7 +275,9 @@ static int __init bfin_jc_init(void)
 
  err:
 	put_tty_driver(bfin_jc_driver);
+ err_driver:
 	kfree(bfin_jc_write_buf.buf);
+ err_buf:
 	kthread_stop(bfin_jc_kthread);
 	return ret;
 }

