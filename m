From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:48 +0000
Subject: [KJ] [PATCH] [RESEND] [15/29] qla_os.c - vfree() checking cleanups
Message-Id: <auto-000001227494@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39356329970754267=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39356329970754267==

qla_os.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 qla_os.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/drivers/scsi/qla2xxx/qla_os.c	2004-12-24 13:35:40.000000000 -0800
+++ linux-2.6.10/drivers/scsi/qla2xxx/qla_os.c	2005-01-04 11:32:17.000000000 -0800
@@ -3125,8 +3125,7 @@
 	if (ha->fw_dump)
 		free_pages((unsigned long)ha->fw_dump, ha->fw_dump_order);
 
-	if (ha->fw_dump_buffer)
-		vfree(ha->fw_dump_buffer);
+	vfree(ha->fw_dump_buffer);
 
 	ha->fw_dump = NULL;
 	ha->fw_dump_reading = 0;


--===============39356329970754267==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39356329970754267==--
