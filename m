From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:52 +0000
Subject: [KJ] [PATCH] [RESEND] [19/29] super.c - vfree() checking cleanups
Message-Id: <auto-000001227499@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============057785963221707259=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============057785963221707259==

super.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 super.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/fs/reiserfs/super.c	2004-12-24 13:34:33.000000000 -0800
+++ linux-2.6.10/fs/reiserfs/super.c	2005-01-04 11:14:27.088710664 -0800
@@ -1649,8 +1649,7 @@
 	    if (SB_AP_BITMAP (s))
 		brelse (SB_AP_BITMAP (s)[j].bh);
 	}
-	if (SB_AP_BITMAP (s))
-	    vfree (SB_AP_BITMAP (s));
+	vfree (SB_AP_BITMAP (s));
     }
     if (SB_BUFFER_WITH_SB (s))
 	brelse(SB_BUFFER_WITH_SB (s));


--===============057785963221707259==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============057785963221707259==--
