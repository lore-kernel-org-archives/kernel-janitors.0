From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 08 Feb 2006 07:17:51 +0000
Subject: [KJ][Patch] remove implicit sign bit in isdnhdlc.h
Message-Id: <1139383072.9409.51.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72018398660847005=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139380004.9409.40.camel@localhost.localdomain>
In-Reply-To: <1139380004.9409.40.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============72018398660847005==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list.

This patch removes the implicit sign bit in a couple of one bit struct
fields.
The fields here are used as one bit flags. So the patch just makes them
unsigned. As a bonus it converts spaces to a tab before the last field.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc2/drivers/isdn/hisax/isdnhdlc.h.orig	2006-02-08 18:05:43.000000000 +1100
+++ linux-2.6.16-rc2/drivers/isdn/hisax/isdnhdlc.h	2006-02-08 18:09:01.000000000 +1100
@@ -41,10 +41,10 @@ struct isdnhdlc_vars {
 	unsigned char shift_reg;
 	unsigned char ffvalue;
 
-	int data_received:1; 	// set if transferring data
-	int dchannel:1; 	// set if D channel (send idle instead of flags)
-	int do_adapt56:1; 	// set if 56K adaptation
-        int do_closing:1; 	// set if in closing phase (need to send CRC + flag
+	unsigned data_received:1; 	// set if transferring data
+	unsigned dchannel:1; 	// set if D channel (send idle instead of flags)
+	unsigned do_adapt56:1; 	// set if 56K adaptation
+	unsigned do_closing:1; 	// set if in closing phase (need to send CRC + flag
 };
 
 



--===============72018398660847005==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72018398660847005==--
