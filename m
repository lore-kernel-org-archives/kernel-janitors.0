From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:12:46 +0000
Subject: [PATCH 02/15] arm/mach-u300: check kmalloc result
Message-Id: <1279296767-24823-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

If kmalloc() fails free already allocated memory and exit with -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/arm/mach-u300/dummyspichip.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-u300/dummyspichip.c b/arch/arm/mach-u300/dummyspichip.c
index 5f55012..452218a 100644
--- a/arch/arm/mach-u300/dummyspichip.c
+++ b/arch/arm/mach-u300/dummyspichip.c
@@ -64,6 +64,11 @@ static ssize_t dummy_looptest(struct device *dev,
 		goto out;
 	}
 	bigrxbuf_virtual = kmalloc(DMA_TEST_SIZE, GFP_KERNEL);
+	if (bigrxbuf_virtual = NULL) {
+		kfree(bigtxbuf_virtual);
+		status = -ENOMEM;
+		goto out;
+	}
 
 	/* Fill TXBUF with some happy pattern */
 	memset(bigtxbuf_virtual, 0xAA, DMA_TEST_SIZE);
-- 
1.7.0.4

