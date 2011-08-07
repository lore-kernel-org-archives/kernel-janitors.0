From: Dan Carpenter <error27@gmail.com>
Date: Sun, 07 Aug 2011 18:26:04 +0000
Subject: [patch] tlb_uv: remove some dead code in parse_tunables_write()
Message-Id: <20110807182604.GP7659@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This code isn't reachable anymore after f073cc8f39 "x86, UV: Clean up
uv_tlb.c"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
index 68e467f..30ec45a 100644
--- a/arch/x86/platform/uv/tlb_uv.c
+++ b/arch/x86/platform/uv/tlb_uv.c
@@ -1310,8 +1310,6 @@ static int parse_tunables_write(struct bau_control *bcp, char *instr,
 				*tunables[cnt].tunp = val;
 			continue;
 		}
-		if (q = p)
-			break;
 	}
 	return 0;
 }
