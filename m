From: ed <ed-kj@s5h.net>
Date: Thu, 24 May 2007 22:01:55 +0000
Subject: [KJ] This might be a basic thing
Message-Id: <20070524230155.373c2642@ed-desktop.s5h.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3490664206063578718=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <46560307.90503@kroon.co.za>
In-Reply-To: <46560307.90503@kroon.co.za>
To: kernel-janitors@vger.kernel.org

--===============3490664206063578718==
Content-Type: multipart/signed; boundary=Sig_J8eCN0LuYfJyy.Hd_XXyxTE;
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_J8eCN0LuYfJyy.Hd_XXyxTE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

I have recently had an issue with a USB storage device that can read
many different removable media devices, SD, CF/MD, SM/XD etc etc.

However, on different computers I get different results, some can read
the SD only, (one other computer that belongs to a friend who has the
same gadget as me) can read/write the SD.

I am sure this is something hardware related to the device. I've had
it apart and I have tried to jam the SD read/lock tab sensor in the
write-present position to no avail.

Would this be a signal that is given to the kernel, or would it be a
signal that the usb device/gadget chip process.

What I'm looking to do is fiddle the usb-storage code so that the
write-present tab is always considered on (I've not yet read the code,
as I want to just get an idea for what is involved first).

Am I trying to do something insane or impossible - is the USB gadget
the overlord and I am just unfortunate to have a device that I cannot
write with - ever?

--=20
The HSSI to the Xbox is making a weird noise  because of overloaded
quake server. Tech Support is playing dope-wars on the palm pilot.
 :: http://www.s5h.net/ :: http://www.s5h.net/gpg

--Sig_J8eCN0LuYfJyy.Hd_XXyxTE
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGVgtT4dyr7s6PRYgRApVcAJ9JKUvZwrBj2fBCyxmXqDUfZgODegCfayom
k1KIYn3ng7LloRnE7Rc1FyE=
=4WRD
-----END PGP SIGNATURE-----

--Sig_J8eCN0LuYfJyy.Hd_XXyxTE--

--===============3490664206063578718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--===============3490664206063578718==--
