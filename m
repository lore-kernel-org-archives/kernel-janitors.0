From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 03 Aug 2017 19:14:21 +0000
Subject: [PATCH 2/4] axonram: Improve a size determination in axon_ram_probe()
Message-Id: <5dff1619-f3df-a6ef-7a75-11bae170e0d1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <009fdef0-b2c9-5e98-d32d-14149aec92c5@users.sourceforge.net>
In-Reply-To: <009fdef0-b2c9-5e98-d32d-14149aec92c5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@fb.com>, Dan Williams <dan.j.williams@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 3 Aug 2017 20:00:16 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/sysdev/axonram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/axonram.c b/arch/powerpc/sysdev/axonram.c
index b82d1b023a15..bf1506ec2ca4 100644
--- a/arch/powerpc/sysdev/axonram.c
+++ b/arch/powerpc/sysdev/axonram.c
@@ -191,7 +191,7 @@ static int axon_ram_probe(struct platform_device *device)
 	dev_info(&device->dev, "Found memory controller on %s\n",
 			device->dev.of_node->full_name);
 
-	bank = kzalloc(sizeof(struct axon_ram_bank), GFP_KERNEL);
+	bank = kzalloc(sizeof(*bank), GFP_KERNEL);
 	if (bank = NULL) {
 		rc = -ENOMEM;
 		goto failed;
-- 
2.13.4

