From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 13:48:36 +0000
Subject: [PATCH 3/4] C6X/megamode-pic: Delete an unnecessary return statement in megamod_pic_init()
Message-Id: <7f92b7a6-1814-02f5-4026-8cfcdc1dfc6a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1b8c2efb-1096-3b78-9100-e20c55b6ecf1@users.sourceforge.net>
In-Reply-To: <1b8c2efb-1096-3b78-9100-e20c55b6ecf1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c6x-dev@linux-c6x.org, Aurelien Jacquiot <a-jacquiot@ti.com>, Mark Salter <msalter@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 15:05:41 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/c6x/platforms/megamod-pic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/c6x/platforms/megamod-pic.c b/arch/c6x/platforms/megamod-pic.c
index cf0ebf25e42f..c49aa63289fa 100644
--- a/arch/c6x/platforms/megamod-pic.c
+++ b/arch/c6x/platforms/megamod-pic.c
@@ -339,6 +339,4 @@ void __init megamod_pic_init(void)
 
 	soc_ops.get_exception = get_exception;
 	soc_ops.assert_event = assert_event;
-
-	return;
 }
-- 
2.12.3

