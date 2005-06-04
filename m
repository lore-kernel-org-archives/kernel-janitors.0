From: Domen Puncer <domen@coderock.org>
Date: Sat, 04 Jun 2005 15:01:44 +0000
Subject: [KJ] [patch] isdn: copy_from_user size fix in sc/ioctl.c
Message-Id: <20050604150144.GC9687@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70733948153680481=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70733948153680481==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A few lines above the patch we have:
	char *srec;
	srec = kmalloc(SCIOC_SRECSIZE, GFP_KERNEL);

sizeof pointer is probably not meant here.


Signed-off-by: Domen Puncer <domen@coderock.org>

diff -pruNX dontdiff c/drivers/isdn/sc/ioctl.c a/drivers/isdn/sc/ioctl.c
--- c/drivers/isdn/sc/ioctl.c	2005-01-22 02:48:21.000000000 +0100
+++ a/drivers/isdn/sc/ioctl.c	2005-06-04 15:36:48.000000000 +0200
@@ -72,14 +72,14 @@ int sc_ioctl(int card, scs_ioctl *data)
 		/*
 		 * Get the SRec from user space
 		 */
-		if (copy_from_user(srec, data->dataptr, sizeof(srec))) {
+		if (copy_from_user(srec, data->dataptr, SCIOC_SRECSIZE)) {
 			kfree(rcvmsg);
 			kfree(srec);
 			return -EFAULT;
 		}
 
 		status = send_and_receive(card, CMPID, cmReqType2, cmReqClass0, cmReqLoadProc,
-				0, sizeof(srec), srec, rcvmsg, SAR_TIMEOUT);
+				0, SCIOC_SRECSIZE, srec, rcvmsg, SAR_TIMEOUT);
 		kfree(rcvmsg);
 		kfree(srec);
 

--===============70733948153680481==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70733948153680481==--
