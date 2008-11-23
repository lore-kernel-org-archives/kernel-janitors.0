From: Julia Lawall <julia@diku.dk>
Date: Sun, 23 Nov 2008 08:07:35 +0000
Subject: [PATCH 1/2] drivers/char/agp: Add missing pci_dev_get
Message-Id: <Pine.LNX.4.64.0811230906340.28343@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

pci_get_slot does a pci_dev_get, so pci_dev_put needs to be called in an
error case.

In the first three cases, it might also be possible to move the call to
pci_get_slot downwards below the error handling code.

The problem was fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
local idexpression *n;
statement S1,S2;
expression E,E1;
expression *ptr != NULL;
type T,T1;
@@

(
if (!(n = pci_get_slot(...))) S1
|
n = pci_get_slot(...)
)
<... when != pci_dev_put(n)
    when != if (...) { <+... pci_dev_put(n) ...+> }
    when != true !n  || ...
    when != n = (T)E
    when != E = n
if (!n || ...) S2
...>
(
  return \(0\|<+...n...+>\|ptr\);
|
+ pci_dev_put(n);
return ...;
|
pci_dev_put(n);
|
n = (T1)E1
|
E1 = n
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

 drivers/char/agp/amd64-agp.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff -u -p a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -393,6 +393,7 @@ static int __devinit uli_agp_init(struct
 
 	if (i = ARRAY_SIZE(uli_sizes)) {
 		dev_info(&pdev->dev, "no ULi size found for %d\n", size);
+		pci_dev_put(dev1);
 		return -ENODEV;
 	}
 
@@ -400,8 +401,10 @@ static int __devinit uli_agp_init(struct
 	pci_read_config_dword (k8_northbridges[0], AMD64_GARTAPERTUREBASE, &httfea);
 
 	/* if x86-64 aperture base is beyond 4G, exit here */
-	if ((httfea & 0x7fff) >> (32 - 25))
+	if ((httfea & 0x7fff) >> (32 - 25)) {
+		pci_dev_put(dev1);
 		return -ENODEV;
+	}
 
 	httfea = (httfea& 0x7fff) << 25;
 
@@ -451,6 +454,7 @@ static int nforce3_agp_init(struct pci_d
 
 	if (i = ARRAY_SIZE(nforce3_sizes)) {
 		dev_info(&pdev->dev, "no NForce3 size found for %d\n", size);
+		pci_dev_put(dev1);
 		return -ENODEV;
 	}
 
@@ -465,6 +469,7 @@ static int nforce3_agp_init(struct pci_d
 	/* if x86-64 aperture base is beyond 4G, exit here */
 	if ( (apbase & 0x7fff) >> (32 - 25) ) {
 		dev_info(&pdev->dev, "aperture base > 4G\n");
+		pci_dev_put(dev1);
 		return -ENODEV;
 	}
 
