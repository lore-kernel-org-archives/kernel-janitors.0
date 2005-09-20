From: Jesse Millan <jesse.millan@gmail.com>
Date: Tue, 20 Sep 2005 19:29:48 +0000
Subject: [KJ] [PATCH] specialix: eliminate deprecated check_region() call
Message-Id: <25465C7B-EEA6-4184-869C-A43AB6079D2F@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-5-761016462"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Apple-Mail-5-761016462
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed


Eliminate deprecated call to check_region(). Call is replaced with  
request_region().


--Apple-Mail-5-761016462
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0644;
	name="deprecated_check_region_specialix.patch"
Content-Disposition: attachment;
	filename=deprecated_check_region_specialix.patch


Eliminate deprecated call to check_region(). Call is replaced with request_region().
Signed-off-by: Jesse Millan <jesse.millan@gmail.com>
---

 drivers/char/specialix.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletion(-)

diff -puN drivers/char/specialix.c~deprecated_check_region_specialix drivers/char/specialix.c
--- linux-2.6.14-rc1/drivers/char/specialix.c~deprecated_check_region_specialix	2005-09-20 11:37:38.000000000 -0700
+++ linux-2.6.14-rc1-jessem/drivers/char/specialix.c	2005-09-20 11:39:41.000000000 -0700
@@ -340,7 +340,13 @@ static inline void sx_wait_CCR_off(struc
 
 static inline int sx_check_io_range(struct specialix_board * bp)
 {
-	return check_region (bp->base, SX_IO_SPACE);
+	if(!request_region(bp->base, SX_IO_SPACE, "specialix IO8+")) {
+		/* region busy */
+		return 1;
+	}
+	else {
+		return 0;
+	}
 }
 
 
_

--Apple-Mail-5-761016462
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Apple-Mail-5-761016462--
