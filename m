From: Bodo Eggert <7eggert@elstempel.de>
Date: Thu, 10 Aug 2006 11:58:10 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <E1GB9BH-0000hE-9m@be1.lrz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6DvTu-6tk-17@gated-at.bofh.it> <6Ho72-7do-3@gated-at.bofh.it> <6HpZd-1vB-19@gated-at.bofh.it> <6I6B4-72S-7@gated-at.bofh.it> <6I7np-8bD-11@gated-at.bofh.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Darren Jenkins <darrenrjenkins@gmail.com>, ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com, "Om N." <xhandle@gmail.com>, kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

Darren Jenkins <darrenrjenkins@gmail.com> wrote:

> The only Nitpick is
>=20
> - int timeup =3D 0;
> + unsigned char timeup =3D 0;

Using ints is usurally cheaper than using chars, especially if the
compiler can use a register. YMMV, and may the .s be with you.-)
--=20
Ich danke GMX daf=FCr, die Verwendung meiner Adressen mittels per SPF
verbreiteten L=FCgen zu sabotieren.

http://david.woodhou.se/why-not-spf.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
