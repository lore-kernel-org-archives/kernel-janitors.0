From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sun, 26 Mar 2006 03:05:21 +0000
Subject: [KJ][Patch] fix read beyond end of array in gus_wave.c
Message-Id: <1143342321.8088.15.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50950699368851815=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50950699368851815==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

Coverity spotted a static overrun in sound/oss/gus_wave.c @ line 1099

This is not a big problem as it can only _read_ a value (array + 1) and
this is oss, but I thought I should submit a patch anyway.

The patch below just extends an earlier check of the array index to
catch the (array + 1) error.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-git8/sound/oss/gus_wave.c.orig	2006-03-26 13:45:49.000000000 +1100
+++ linux-2.6.16-git8/sound/oss/gus_wave.c	2006-03-26 13:46:46.000000000 +1100
@@ -1085,7 +1085,7 @@ static int guswave_set_instr(int dev, in
 {
 	int sample_no;
 
-	if (instr_no < 0 || instr_no > MAX_PATCH)
+	if (instr_no < 0 || instr_no >= MAX_PATCH)
 		instr_no = 0;	/* Default to acoustic piano */
 
 	if (voice < 0 || voice > 31)



--===============50950699368851815==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50950699368851815==--
