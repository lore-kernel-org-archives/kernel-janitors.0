From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 03 Aug 2017 19:12:50 +0000
Subject: [PATCH 1/4] axonram: Delete an error message for a failed memory allocation in axon_ram_probe()
Message-Id: <31790d2a-26b4-54f5-e52d-5637be0b676f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <009fdef0-b2c9-5e98-d32d-14149aec92c5@users.sourceforge.net>
In-Reply-To: <009fdef0-b2c9-5e98-d32d-14149aec92c5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@fb.com>, Dan Williams <dan.j.williams@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 3 Aug 2017 19:49:18 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/sysdev/axonram.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/sysdev/axonram.c b/arch/powerpc/sysdev/axonram.c
index 2799706106c6..b82d1b023a15 100644
--- a/arch/powerpc/sysdev/axonram.c
+++ b/arch/powerpc/sysdev/axonram.c
@@ -193,7 +193,6 @@ static int axon_ram_probe(struct platform_device *device)
 
 	bank = kzalloc(sizeof(struct axon_ram_bank), GFP_KERNEL);
 	if (bank = NULL) {
-		dev_err(&device->dev, "Out of memory\n");
 		rc = -ENOMEM;
 		goto failed;
 	}
-- 
2.13.4

