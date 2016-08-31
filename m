From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 31 Aug 2016 07:30:43 +0000
Subject: [PATCH 1/6] staging: slicoss: constify ethtool_ops structures
Message-Id: <1472628648-3603-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472628648-3603-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472628648-3603-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lior Dotan <liodot@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Christopher Harrer <charrer@alacritech.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Check for ethtool_ops structures that are only stored in the ethtool_ops
field of a net_device structure or passed as the second argument to
netdev_set_default_ethtool_ops.  These contexts are declared const, so
ethtool_ops structures that have these properties can be declared as const
also.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct ethtool_ops i@p = { ... };

@ok1@
identifier r.i;
struct net_device e;
position p;
@@
e.ethtool_ops = &i@p;

@ok2@
identifier r.i;
expression e;
position p;
@@
netdev_set_default_ethtool_ops(e, &i@p)

@bad@
position p != {r.p,ok1.p,ok2.p};
identifier r.i;
@@
i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct ethtool_ops i = { ... };
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/slicoss/slicoss.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/slicoss/slicoss.c b/drivers/staging/slicoss/slicoss.c
index 7834bda..21280a3 100644
--- a/drivers/staging/slicoss/slicoss.c
+++ b/drivers/staging/slicoss/slicoss.c
@@ -124,7 +124,7 @@ static const struct pci_device_id slic_pci_tbl[] = {
 	{ 0 }
 };
 
-static struct ethtool_ops slic_ethtool_ops;
+static const struct ethtool_ops slic_ethtool_ops;
 
 MODULE_DEVICE_TABLE(pci, slic_pci_tbl);
 
@@ -3128,7 +3128,7 @@ static void __exit slic_module_cleanup(void)
 	pci_unregister_driver(&slic_driver);
 }
 
-static struct ethtool_ops slic_ethtool_ops = {
+static const struct ethtool_ops slic_ethtool_ops = {
 	.get_coalesce = slic_get_coalesce,
 	.set_coalesce = slic_set_coalesce
 };

