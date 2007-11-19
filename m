From: Julia Lawall <julia@diku.dk>
Date: Mon, 19 Nov 2007 08:05:08 +0000
Subject: [PATCH 3/5] drivers/pci/pci-sysfs.c: Add missing pci_dev_put
Message-Id: <Pine.LNX.4.64.0711190903550.19198@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

There should be a pci_dev_put when breaking out of a loop that iterates
over calls to pci_get_device and similar functions.

This was fixed using the following semantic patch.

// <smpl>
@@
identifier d;
type T;
expression e;
iterator for_each_pci_dev;
@@

T *d;
...
for_each_pci_dev(d)
   {... when != pci_dev_put(d)
        when != e = d
(
    return d;
|
+  pci_dev_put(d);
?  return ...;
)
...}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
--- a/drivers/pci/pci-sysfs.c   2007-07-20 17:45:56.000000000 +0200
+++ b/drivers/pci/pci-sysfs.c   2007-11-19 08:17:43.000000000 +0100
@@ -702,8 +702,10 @@ static int __init pci_sysfs_init(void)
         sysfs_initialized = 1;
         for_each_pci_dev(pdev) {
                 retval = pci_create_sysfs_dev_files(pdev);
-               if (retval)
+               if (retval) {
+                       pci_dev_put(pdev);
                         return retval;
+               }
         }

         return 0;
