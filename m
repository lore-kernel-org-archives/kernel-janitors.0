From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Apr 2019 17:38:57 +0000
Subject: [PATCH] ARM: kprobes: fix spelling mistake "undefeined" -> "undefined"
Message-Id: <20190418173857.31285-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510160239.21091-1-colin.king@canonical.com>
In-Reply-To: <20180510160239.21091-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake on the TEST_UNSUPPORTED macro. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/arm/probes/kprobes/test-thumb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/probes/kprobes/test-thumb.c b/arch/arm/probes/kprobes/test-thumb.c
index b683b4517458..6841909757cd 100644
--- a/arch/arm/probes/kprobes/test-thumb.c
+++ b/arch/arm/probes/kprobes/test-thumb.c
@@ -787,7 +787,7 @@ CONDITION_INSTRUCTIONS(22,
 
 	TEST_UNSUPPORTED(__inst_thumb32(0xf7f08000) " @ smc #0")
 
-	TEST_UNSUPPORTED(__inst_thumb32(0xf7f0a000) " @ undefeined")
+	TEST_UNSUPPORTED(__inst_thumb32(0xf7f0a000) " @ undefined")
 
 	TEST_BF(  "b.w	2f")
 	TEST_BB(  "b.w	2b")
-- 
2.20.1
