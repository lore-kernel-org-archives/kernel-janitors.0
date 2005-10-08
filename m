From: Felix Oxley <lkml@oxley.org>
Date: Sat, 08 Oct 2005 17:02:33 +0000
Subject: [KJ] Question re make
Message-Id: <200510081802.35521.lkml@oxley.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43035753826000245=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43035753826000245==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


I want to test a fix that I have made to a particular file. 

However:
	# dell:/usr/src/linux-2.6.13.2-2 # make drivers/telephony/ixj.c
	make: Nothing to be done for `drivers/telephony/ixj.c'.

and:
	# dell:/usr/src/linux-2.6.13.2-2 # make drivers/telephony
	make: Nothing to be done for `drivers/telephony'.

and
	# cc driver/telephony/ixj.cjust gives hundreds of errors.

I have done make clean (and even make mrproper) .

How can I compile just this module?

thanks,
Felix


--===============43035753826000245==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43035753826000245==--
