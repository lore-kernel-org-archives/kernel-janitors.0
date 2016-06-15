From: Jinbum Park <jinb.park7@gmail.com>
Date: Wed, 15 Jun 2016 15:19:22 +0000
Subject: [PATCH] kprobes: fix a comment typo
Message-Id: <20160615151922.GA30806@pjb1027-Latitude-E5410>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160524170829.GA6931@pjb1027-Latitude-E5410>
In-Reply-To: <20160524170829.GA6931@pjb1027-Latitude-E5410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Just fix a typo in the code comment.

Signed-off-by: Jinbum Park <jinb.park7@gmail.com>
---
 arch/arm/probes/kprobes/opt-arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/probes/kprobes/opt-arm.c b/arch/arm/probes/kprobes/opt-arm.c
index bcdecc2..073c0ba 100644
--- a/arch/arm/probes/kprobes/opt-arm.c
+++ b/arch/arm/probes/kprobes/opt-arm.c
@@ -223,7 +223,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *or
 	 *
 	 * So the maximum forward branch should be:
 	 *   (0x007fffff << 2) = 0x01fffffc =  0x1fffffc
-	 * The maximum backword branch should be:
+	 * The maximum backward branch should be:
 	 *   (0xff800000 << 2) = 0xfe000000 = -0x2000000
 	 *
 	 * We can simply check (rel & 0xfe000003):
-- 
1.9.1

