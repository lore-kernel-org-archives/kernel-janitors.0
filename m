From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Jul 2018 09:09:38 +0000
Subject: [PATCH][V2] x86/uv: remove redundant check of p == q
Message-Id: <20180731090938.11856-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for p = q is dead code because the proceeding switch
statements jump to the end of the outer for-loop with continue
statements.  Remove the dead code.

Detected by CoverityScan, CID#145071 ("Structurally dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/platform/uv/tlb_uv.c | 2 --
 1 file changed, 2 deletions(-)

---

V2: fix spelling mistake in commit message "Structurally"

diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
index ca446da48fd2..e26dfad507c8 100644
--- a/arch/x86/platform/uv/tlb_uv.c
+++ b/arch/x86/platform/uv/tlb_uv.c
@@ -1607,8 +1607,6 @@ static int parse_tunables_write(struct bau_control *bcp, char *instr,
 				*tunables[cnt].tunp = val;
 			continue;
 		}
-		if (q = p)
-			break;
 	}
 	return 0;
 }
-- 
2.17.1

