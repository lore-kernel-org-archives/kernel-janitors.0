From: Aaron Grothe <ajgrothe@yahoo.com>
Date: Wed, 29 Sep 2004 01:05:32 +0000
Subject: [Kernel-janitors] LinuxCPD - New mini project
Message-Id: <20040929010532.82474.qmail@web41005.mail.yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96613474816859002=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============96613474816859002==
Content-Type: text/plain; charset=us-ascii

Hi,

I've put a small project up at Sourceforge http://linuxcpd.sf.net

The project is called LinuxCPD for Linux Cut and Paste Detection.  The goal of the project is to
hopefully lead to some refactoring of the kernel and reducing the amount of Cut and Pasted code in
the kernel.

It runs Red Hill consulting's Simian tool against the 2.4 and 2.6 kernel and reports all sections
of code that are duplicated that are larger than 50 lines.  Looking at I'm happily surprised about
how much less duplicated code there appears to be in the 2.6 kernel series.

If anybody has any ideas or suggestions on how to make this tool more useful I would be very
appreciative.

Regards,

Aaron
=-=-=
"The Journey is the Reward" - Old Zen Buddhist Saying


		
__________________________________
Do you Yahoo!?
Read only the mail you want - Yahoo! Mail SpamGuard.
http://promotions.yahoo.com/new_mail 

--===============96613474816859002==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96613474816859002==--
