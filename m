From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:44 +0000
Subject: [KJ] [PATCH] [RESEND] [11/29] sn_hwperf.c - vfree() checking
Message-Id: <auto-000001227488@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============981745530623366=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============981745530623366==

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
 	struct seq_file *seq = file->private_data;
 
-	if (seq->private)
-		vfree(seq->private);
+	vfree(seq->private);
 	return seq_release(inode, file);
 }


--===============981745530623366==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============981745530623366==--
