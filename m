From: Julia Lawall <julia@diku.dk>
Date: Mon, 06 Apr 2009 15:38:24 +0000
Subject: [PATCH] drivers/video/sis: use the constant InterlaceMode
Message-Id: <Pine.LNX.4.64.0904061737430.20450@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thomas@winischhofer.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use the constant InterlaceMode rather than the magic number 0x0080.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r@
type T;
T E;
identifier fld;
identifier c;
@@

E->fld & c

@s@
constant C;
identifier r.c;
@@

#define c C

@@
r.T E;
identifier r.fld;
identifier r.c;
constant s.C;
@@

 E->fld &
- C
+ c
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/video/sis/initextlfb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/video/sis/initextlfb.c b/drivers/video/sis/initextlfb.c
--- a/drivers/video/sis/initextlfb.c 2008-12-07 19:29:06.000000000 +0100
+++ b/drivers/video/sis/initextlfb.c 2009-04-06 16:55:38.000000000 +0200
@@ -143,7 +143,7 @@ sisfb_mode_rate_to_ddata(struct SiS_Priv
        var->sync |= FB_SYNC_HOR_HIGH_ACT;
 
     var->vmode = FB_VMODE_NONINTERLACED;
-    if(SiS_Pr->SiS_RefIndex[RRTI].Ext_InfoFlag & 0x0080)
+    if (SiS_Pr->SiS_RefIndex[RRTI].Ext_InfoFlag & InterlaceMode)
        var->vmode = FB_VMODE_INTERLACED;
     else {
        j = 0;
