From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:56:59 +0000
Subject: [KJ] [PATCH] [11/29] sn_hwperf.c - vfree() checking cleanups
Message-Id: <41db112b.239d2dd6.2568.07b8@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65681468692806166=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65681468692806166==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

sn_hwperf.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 sn_hwperf.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)


--- linux-2.6.10-vanilla/arch/ia64/sn/kernel/sn2/sn_hwperf.c	2004-12-24 13:35:24.000000000 -0800
+++ linux-2.6.10/arch/ia64/sn/kernel/sn2/sn_hwperf.c	2005-01-04 11:20:02.898659792 -0800
@@ -529,8 +529,7 @@
 	}
 
 error:
-	if (p)
-		vfree(p);
+	vfree(p);
 
 	lock_kernel();
 	return r;
@@ -641,7 +640,6 @@
 {
 	struct seq_file *seq  
-	if (seq->private)
-		vfree(seq->private);
+	vfree(seq->private);
 	return seq_release(inode, file);
 }



--===============65681468692806166==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65681468692806166==--
