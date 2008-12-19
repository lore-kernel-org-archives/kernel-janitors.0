From: Julia Lawall <julia@diku.dk>
Date: Fri, 19 Dec 2008 17:11:01 +0000
Subject: [PATCH 2/3] drivers/staging/agnx: Move a dereference below a NULL
Message-Id: <Pine.LNX.4.64.0812191810240.11217@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dreamfly281@gmail.com, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/agnx/pci.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -u -p a/drivers/staging/agnx/pci.c b/drivers/staging/agnx/pci.c
--- a/drivers/staging/agnx/pci.c
+++ b/drivers/staging/agnx/pci.c
@@ -440,11 +440,12 @@ static struct ieee80211_ops agnx_ops = {
 static void __devexit agnx_pci_remove(struct pci_dev *pdev)
 {
 	struct ieee80211_hw *dev = pci_get_drvdata(pdev);
-	struct agnx_priv *priv = dev->priv;
+	struct agnx_priv *priv;
 	AGNX_TRACE;
 
 	if (!dev)
 		return;
+	priv = dev->priv;
 	ieee80211_unregister_hw(dev);
 	pci_iounmap(pdev, priv->ctl);
 	pci_iounmap(pdev, priv->data);
