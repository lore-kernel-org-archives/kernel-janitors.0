From: irwan.djajadi@iname.com
Date: Tue, 25 Oct 2005 03:47:06 +0000
Subject: [KJ] drivers/char/serial167.c status ?
Message-Id: <20051025034706.GA22430@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23330158524001465=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23330158524001465==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I just found that drivers/char/serial167.c is mentioned in the Makefile, but
not in Kconfig. Doesn't this mean that serial167.c is not compilable ever ?
I suppose to fix this, we either need to:
1. add it into Kconfig
2. remove it completely..

What's the right thing to do here?
Thanks
--
Irwan

--===============23330158524001465==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23330158524001465==--
