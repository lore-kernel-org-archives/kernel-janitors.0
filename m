From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sun, 02 May 2004 17:45:58 +0000
Subject: Re: [Kernel-janitors] av7110.c
Message-Id: <20040502104558.24c49c8c.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50711097378693326=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405020712300.1291@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405020712300.1291@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============50711097378693326==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 2 May 2004 08:11:28 -0600 (MDT) MJK <mkemp@cs.nmsu.edu> wrote:

| 
| 	Audited some a part of this code for kernel_thread()'s return
| value. Seems to compile OK.
| 
| --MJK

--- old.linux-2.6.5/drivers/media/dvb/ttpci/av7110.c	2004-04-03 20:37:36.000000000 -0700
+++ linux-2.6.5/drivers/media/dvb/ttpci/av7110.c	2004-05-02 07:06:37.000000000 -0600
@@ -1440,7 +1440,10 @@
 		printk ("av7110: Warning, firmware version 0x%04x is too old. "
 			"System might be unstable!\n", FW_VERSION(av7110->arm_app));
 
-	kernel_thread(arm_thread, (void *) av7110, 0);
+	ret = kernel_thread(arm_thread, (void *) av7110, 0);
+	if(ret < 0) {
*** BTW, needs a space after "if"
+		goto err2;
+	}

A similar change is already in Linux-2.6.6-rc3 (or maybe even earlier),
made on 2004-04-26.

You can (should) check the current kernel by downloading more recent
versions or by browsing the BK repo, e.g.:

http://linux.bkbits.net:8080/linux-2.5/cset@408d306e0J5Egxqm5Ek7mWzsv9LV4w?nav=index.html|src/|src/drivers|src/drivers/media|src/drivers/media/dvb|src/drivers/media/dvb/ttpci|related/drivers/media/dvb/ttpci/av7110.c

(Yes, it changes frequently.  It's a moving target.)

--
~Randy

--===============50711097378693326==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50711097378693326==--
