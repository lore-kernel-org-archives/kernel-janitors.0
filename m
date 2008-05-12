From: Julia Lawall <julia@diku.dk>
Date: Mon, 12 May 2008 13:38:49 +0000
Subject: [PATCH 5/6] drivers/net/hamradio: remove null pointer dereference
Message-Id: <Pine.LNX.4.64.0805121538270.3694@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jpr@f6fbb.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If dev is NULL, it is not possible to access its name field.  So I have
simply modified the error message to drop the printing of the name field.


This problem was found using the following semantic match
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E, E1;
identifier f;
statement S1,S2,S3;
@@

* if (E = NULL)
{
  ... when != if (E = NULL) S1 else S2
      when != E = E1
* E->f
  ... when any
  return ...;
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
--- a/drivers/net/hamradio/yam.c	2008-04-07 13:50:26.000000000 +0200
+++ b/drivers/net/hamradio/yam.c	2008-05-12 09:52:58.000000000 +0200
@@ -1123,8 +1123,7 @@ static int __init yam_init_driver(void)
 		dev = alloc_netdev(sizeof(struct yam_port), name,
 				   yam_setup);
 		if (!dev) {
-			printk(KERN_ERR "yam: cannot allocate net device %s\n",
-			       dev->name);
+			printk(KERN_ERR "yam: cannot allocate net device\n");
 			err = -ENOMEM;
 			goto error;
 		}
