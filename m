From: Wolfram Sang <w.sang@pengutronix.de>
Date: Fri, 12 Mar 2010 07:03:49 +0000
Subject: [PATCH 1/3] arch/mips/txx9/generic: init dynamic bin_attribute structures
Message-Id: <1268377431-11671-2-git-send-email-w.sang@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1268377431-11671-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1268377431-11671-1-git-send-email-w.sang@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Wolfram Sang <w.sang@pengutronix.de>, Ralf Baechle <ralf@linux-mips.org>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

Commit 6992f5334995af474c2b58d010d08bc597f0f2fe introduced this requirement.
Found with coccinelle, but fixed manually. Compile tested on X86 where
possible.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Eric W. Biederman <ebiederm@xmission.com>
---
 arch/mips/txx9/generic/setup.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 7174d83..95184a0 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -956,6 +956,7 @@ void __init txx9_sramc_init(struct resource *r)
 	if (!dev->base)
 		goto exit;
 	dev->dev.cls = &txx9_sramc_sysdev_class;
+	sysfs_bin_attr_init(&dev->bindata_attr);
 	dev->bindata_attr.attr.name = "bindata";
 	dev->bindata_attr.attr.mode = S_IRUSR | S_IWUSR;
 	dev->bindata_attr.read = txx9_sram_read;
-- 
1.7.0

