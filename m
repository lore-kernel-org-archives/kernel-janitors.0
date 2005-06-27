From: Victor <victor@cetuc.puc-rio.br>
Date: Mon, 27 Jun 2005 15:07:54 +0000
Subject: [KJ] SET_MODULE_OWNER(dev)
Message-Id: <200506271507.54410.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29349442441083351=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29349442441083351==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all!

Can anyone explain the reason for this line in
linux-2.6.12/include/linux/netdevice.h:499:
	#define SET_MODULE_OWNER(dev) do { } while (0)

And why some net modules call SET_MODULE_OWNER(dev)?

-- Victor

--===============29349442441083351==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29349442441083351==--
