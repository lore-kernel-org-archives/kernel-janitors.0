From: Colin King <colin.king@canonical.com>
Date: Thu, 10 May 2018 16:59:00 +0000
Subject: [PATCH] MIPS: VPE: fix spelling mistake: "uneeded" -> "unneeded"
Message-Id: <20180510165900.13733-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_warn message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/kernel/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index 544ea21bfef9..0bef238d2c0c 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -872,7 +872,7 @@ static ssize_t vpe_write(struct file *file, const char __user *buffer,
 		return -ENODEV;
 
 	if ((count + v->len) > v->plen) {
-		pr_warn("VPE loader: elf size too big. Perhaps strip uneeded symbols\n");
+		pr_warn("VPE loader: elf size too big. Perhaps strip unneeded symbols\n");
 		return -ENOMEM;
 	}
 
-- 
2.17.0

