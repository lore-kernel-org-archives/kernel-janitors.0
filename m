From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Sep 2017 17:11:31 +0000
Subject: [PATCH v2] axonram: Delete an unnecessary variable initialisation in axon_ram_probe()
Message-Id: <96042828-9707-8af9-664a-5c71818dd817@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201708042137.1QRfZLa9%fengguang.wu@intel.com>
In-Reply-To: <201708042137.1QRfZLa9%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kbuild test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@fb.com>, Dan Williams <dan.j.williams@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: kbuild-all@01.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Sep 2017 18:47:02 +0200

The local variable "rc" will eventually be set only to an error code.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Three update steps were integrated for this software module on 2017-09-01.
Thus improve another source code place.

 arch/powerpc/sysdev/axonram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/axonram.c b/arch/powerpc/sysdev/axonram.c
index c60e84e4558d..1b307c80b401 100644
--- a/arch/powerpc/sysdev/axonram.c
+++ b/arch/powerpc/sysdev/axonram.c
@@ -184,7 +184,7 @@ static int axon_ram_probe(struct platform_device *device)
 	static int axon_ram_bank_id = -1;
 	struct axon_ram_bank *bank;
 	struct resource resource;
-	int rc = 0;
+	int rc;
 
 	axon_ram_bank_id++;
 
-- 
2.14.1

