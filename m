From: Julia Lawall <julia@diku.dk>
Date: Fri, 14 Nov 2008 18:06:36 +0000
Subject: [PATCH 3/3] sound/pci/pcxhr/pcxhr.c: introduce missing kfree and
Message-Id: <Pine.LNX.4.64.0811141906050.10023@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: perex@server.perex.cz, tiwai@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kzalloc should free the allocated data.
The error handling code is adjusted to call pci_disable_device(pci); as
well, as done later in the function

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,l;
position p1,p2;
expression *ptr != NULL;
@@

(
if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
|
x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
)
<... when != x
     when != if (...) { <+...x...+> }
x->f = E
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 sound/pci/pcxhr/pcxhr.c       |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index 0e06c6c..73de6e9 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -1229,8 +1229,11 @@ static int __devinit pcxhr_probe(struct pci_dev *pci, const struct pci_device_id
 		return -ENOMEM;
 	}
 
-	if (snd_BUG_ON(pci_id->driver_data >= PCI_ID_LAST))
+	if (snd_BUG_ON(pci_id->driver_data >= PCI_ID_LAST)) {
+		kfree(mgr);
+		pci_disable_device(pci);
 		return -ENODEV;
+	}
 	card_name = pcxhr_board_params[pci_id->driver_data].board_name;
 	mgr->playback_chips = pcxhr_board_params[pci_id->driver_data].playback_chips;
 	mgr->capture_chips  = pcxhr_board_params[pci_id->driver_data].capture_chips;
