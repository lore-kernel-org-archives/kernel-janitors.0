From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sun, 26 Mar 2006 03:25:12 +0000
Subject: [KJ][Patch][update] fix read beyond end of array in gus_wave.c
Message-Id: <1143343512.8088.24.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24580722712314262=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24580722712314262==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

Nix the last patch, sorry but the next coverity error in the list was an
identical problem in the same file. So here is a combined patch for the
two errors. (I looked and I don't think there are anymore now)


Coverity spotted a static overrun in sound/oss/gus_wave.c @ line 1099 &
1754.

This is not a big problem as it is oss, but I thought I should submit a
patch anyway.


The patch below just extends the earlier checks of the array index to
catch the (array + 1) error.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>


--- linux-2.6.16-git8/sound/oss/gus_wave.c.orig	2006-03-26 13:45:49.000000000 +1100
+++ linux-2.6.16-git8/sound/oss/gus_wave.c	2006-03-26 14:09:09.000000000 +1100
@@ -1085,7 +1085,7 @@ static int guswave_set_instr(int dev, in
 {
 	int sample_no;
 
-	if (instr_no < 0 || instr_no > MAX_PATCH)
+	if (instr_no < 0 || instr_no >= MAX_PATCH)
 		instr_no = 0;	/* Default to acoustic piano */
 
 	if (voice < 0 || voice > 31)
@@ -1676,7 +1676,7 @@ static int guswave_load_patch(int dev, i
 
 	instr = patch.instr_no;
 
-	if (instr < 0 || instr > MAX_PATCH)
+	if (instr < 0 || instr >= MAX_PATCH)
 	{
 /*		printk(KERN_ERR "GUS: Invalid patch number %d\n", instr);*/
 		return -EINVAL;




--===============24580722712314262==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24580722712314262==--
