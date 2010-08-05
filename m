From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:23:16 +0000
Subject: [PATCH 21/42] drivers/pci: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052223010.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Indent the branch of an if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/pci/pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7fa3cbd..cc232c0 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2689,7 +2689,7 @@ int pcie_get_readrq(struct pci_dev *dev)
 
 	ret = pci_read_config_word(dev, cap + PCI_EXP_DEVCTL, &ctl);
 	if (!ret)
-	ret = 128 << ((ctl & PCI_EXP_DEVCTL_READRQ) >> 12);
+		ret = 128 << ((ctl & PCI_EXP_DEVCTL_READRQ) >> 12);
 
 	return ret;
 }
