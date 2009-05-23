From: =?ISO-8859-1?Q?Andr=E9_Lopes?= <andre.neo.net@gmail.com>
Date: Sat, 23 May 2009 20:45:00 +0000
Subject: [PATCH] b3dfg: Clean up MODULE_PARM_DESC newline
Message-Id: <5c43c2d40905231345x4166fd45p807f21783f73c9ce@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, jsbronder@brontes3d.com

This trivial patch just clean up MODULE_PARM_DESC newline from
drivers/staging/b3dfg/b3dfg.c .

---
 drivers/staging/b3dfg/b3dfg.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/b3dfg/b3dfg.c b/drivers/staging/b3dfg/b3dfg.c
index 75ebe33..7b18cea 100644
--- a/drivers/staging/b3dfg/b3dfg.c
+++ b/drivers/staging/b3dfg/b3dfg.c
@@ -42,7 +42,7 @@ static unsigned int b3dfg_nbuf = 2;

 module_param_named(buffer_count, b3dfg_nbuf, uint, 0444);

-MODULE_PARM_DESC(buffer_count, "Number of buffers (min 2, default 2)\n");
+MODULE_PARM_DESC(buffer_count, "Number of buffers (min 2, default 2)");

 MODULE_AUTHOR("Daniel Drake <ddrake@brontes3d.com>");
 MODULE_DESCRIPTION("Brontes frame grabber driver");
-- 
1.6.0.6
