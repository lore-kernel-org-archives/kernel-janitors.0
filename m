From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 08 Feb 2006 04:17:27 +0000
Subject: [kj][Patch] remove implicit sign bit on single bit
Message-Id: <1139372248.9409.15.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13523124402183551=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13523124402183551==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

This is my first patch so I hope I get everything right.

http://linuxicc.sourceforge.net/

Warnings/Error while compiling with Intel C Compiler

Says there is a Warning #108: implictly-signed bit field of length 1

in sound/oss/viacXXX_audio.c @ line number 310

looking at the code it seems like it is supposed to be a single bit
field used as a lock. This just makes it unsigned.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>


--- linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c.orig	2006-02-08
13:43:27.000000000 +1100
+++ linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c	2006-02-08
13:45:39.000000000 +1100
@@ -306,9 +306,8 @@ struct via_info {
 	unsigned intmask: 1;	/* Needs int bits */
 	unsigned sixchannel: 1;	/* 8233/35 with 6 channel support */
 	unsigned volume: 1;
+	unsigned locked_rate : 1;
 
-	int locked_rate : 1;
-	
 	int mixer_vol;		/* 8233/35 volume  - not yet implemented */
 
 	struct semaphore syscall_sem;






--===============13523124402183551==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13523124402183551==--
