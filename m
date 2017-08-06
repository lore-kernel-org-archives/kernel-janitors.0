From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 19:20:12 +0000
Subject: [PATCH 2/5] mtip32xx: Improve a size determination in two functions
Message-Id: <1c74be0c-6457-2f59-54b2-5e4fe1a70ace@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
In-Reply-To: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <Bart.VanAssche@sandisk.com>, Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn <jthumshirn@suse.de>, Ming Lei <ming.lei@redhat.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 19:54:49 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/mtip32xx/mtip32xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 5ccbab619e57..97cbf39b4273 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -3019,9 +3019,7 @@ static int mtip_hw_init(struct driver_data *dd)
 	num_command_slots = dd->slot_groups * 32;
 
 	hba_setup(dd);
-
-	dd->port = kzalloc_node(sizeof(struct mtip_port), GFP_KERNEL,
-				dd->numa_node);
+	dd->port = kzalloc_node(sizeof(*dd->port), GFP_KERNEL, dd->numa_node);
 	if (!dd->port)
 		return -ENOMEM;
 
@@ -4215,7 +4213,7 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 		my_node, pcibus_to_node(pdev->bus), dev_to_node(&pdev->dev),
 		cpu_to_node(raw_smp_processor_id()), raw_smp_processor_id());
 
-	dd = kzalloc_node(sizeof(struct driver_data), GFP_KERNEL, my_node);
+	dd = kzalloc_node(sizeof(*dd), GFP_KERNEL, my_node);
 	if (!dd)
 		return -ENOMEM;
 
-- 
2.13.4

