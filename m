From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:35 +0000
Subject: [KJ] [PATCH] [RESEND] [3/29] cpu_buffer.c - vfree() checking
Message-Id: <auto-000001227480@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26643008526254208=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26643008526254208==

cpu_buffer.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 cpu_buffer.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/drivers/oprofile/cpu_buffer.c	2004-12-24 13:33:49.000000000 -0800
+++ linux-2.6.10/drivers/oprofile/cpu_buffer.c	2005-01-04 11:39:01.000000000 -0800
@@ -37,8 +37,7 @@
 	int i;
  
 	for_each_online_cpu(i) {
-		if (cpu_buffer[i].buffer)
-			vfree(cpu_buffer[i].buffer);
+		vfree(cpu_buffer[i].buffer);
 	}
 }
  


--===============26643008526254208==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26643008526254208==--
