From: Julia Lawall <julia@diku.dk>
Date: Sun, 23 Nov 2008 08:08:28 +0000
Subject: [PATCH 2/2] drivers/pci/hotplug: Add missing pci_dev_get
Message-Id: <Pine.LNX.4.64.0811230907370.28343@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

pci_get_slot does a pci_dev_get, so pci_dev_put needs to be called in an
error case.

An alterative would be to move the test_and_set_bit before the call to
pci_get_slot.

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

 drivers/pci/hotplug/fakephp.c |    1 +
 1 file changed, 1 insertion(+)

diff -u -p a/drivers/pci/hotplug/fakephp.c b/drivers/pci/hotplug/fakephp.c
--- a/drivers/pci/hotplug/fakephp.c
+++ b/drivers/pci/hotplug/fakephp.c
@@ -324,6 +324,7 @@ static int disable_slot(struct hotplug_s
 
 		if (test_and_set_bit(0, &dslot->removed)) {
 			dbg("Slot already scheduled for removal\n");
+			pci_dev_put(dev);
 			return -ENODEV;
 		}
 
