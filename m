From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 May 2017 21:28:48 +0000
Subject: [PATCH] aoe: harmless underflow in minor_get_static()
Message-Id: <20170519212848.xba4nc2zvr5xcjxg@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ed L. Cashin" <ed.cashin@acm.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "aoemin" comes from revalidate() in drivers/block/aoe/aoechr.c.  It
can be negative.  We cap the upper bound but not the lower bound so
that's an underflow bug.  But it doesn't matter because we check "n"
against N_DEVS so it all works out fine in the end.

Anyway, let's silence the static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/aoe/aoedev.c b/drivers/block/aoe/aoedev.c
index ffd1947500c6..eddd0ecc9e0b 100644
--- a/drivers/block/aoe/aoedev.c
+++ b/drivers/block/aoe/aoedev.c
@@ -58,7 +58,7 @@ minor_get_dyn(ulong *sysminor)
 }
 
 static int
-minor_get_static(ulong *sysminor, ulong aoemaj, int aoemin)
+minor_get_static(ulong *sysminor, ulong aoemaj, unsigned int aoemin)
 {
 	ulong flags;
 	ulong n;
