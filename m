From: Julia Lawall <julia@diku.dk>
Date: Wed, 16 Jul 2008 14:34:29 +0000
Subject: [PATCH 1/2] drivers/net/r6040.c: adjust error handling
Message-Id: <Pine.LNX.4.64.0807161633570.28783@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, netdev@vger.kernel.org, jeff@garzik.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The just preceding error case does a lot of error handling, so it seems
like this one should as well.

The semantic match that found the problem is:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E,E1,E2;
@@

E = alloc_etherdev(...)
... when != E = E1
if (...) { ... free_netdev(E); ... return ...; }
... when != E = E2
(
  if (...)
   {
   ... when != free_netdev(E);
   return dev; }
|
* if (...)
   {
   ... when != free_netdev(E);
   return ...; }
|
register_netdev(E)
)

// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/drivers/net/r6040.c b/drivers/net/r6040.c
--- a/drivers/net/r6040.c
+++ b/drivers/net/r6040.c
@@ -1029,7 +1029,8 @@ static int __devinit r6040_init_one(stru
 	if (!ioaddr) {
 		printk(KERN_ERR "ioremap failed for device %s\n",
 			pci_name(pdev));
-		return -EIO;
+		err = -EIO;
+		goto err_out_res;
 	}
 
 	/* Init system & device */
