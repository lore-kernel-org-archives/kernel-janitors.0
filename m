From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 09:11:42 +0000
Subject: [patch -resend] [patch] tlb_uv: remove some dead code in parse_tunables_write()
Message-Id: <20120627091142.GY31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Cliff Wickman <cpw@sgi.com>, Andrew Morton <akpm@linux-foundation.org>, Jack Steiner <steiner@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code isn't reachable anymore after f073cc8f39 "x86, UV: Clean up
uv_tlb.c" because we will always hit a continue statement.  This causes
a Smatch message:

arch/x86/platform/uv/tlb_uv.c:1531 parse_tunables_write()
	info: ignoring unreachable code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I have cleaned up the commit message.  This was originally sent on
Sun, 7 Aug 2011.

diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
index 59880af..d625792 100644
--- a/arch/x86/platform/uv/tlb_uv.c
+++ b/arch/x86/platform/uv/tlb_uv.c
@@ -1528,8 +1528,6 @@ static int parse_tunables_write(struct bau_control *bcp, char *instr,
 				*tunables[cnt].tunp = val;
 			continue;
 		}
-		if (q = p)
-			break;
 	}
 	return 0;
 }
