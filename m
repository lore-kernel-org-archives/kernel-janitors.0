From: Thomas Petazzoni <thomas.petazzoni@enix.org>
Date: Fri, 07 Sep 2007 13:45:11 +0000
Subject: Re: large patches
Message-Id: <20070907154511.28b3e4a3@thomas.toulouse>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070907131821.GA14711@ahaupt-debian-vm.localdomain>
In-Reply-To: <20070907131821.GA14711@ahaupt-debian-vm.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,

Le Fri, 7 Sep 2007 15:18:21 +0200,
Andre Haupt <andre@finow14.de> a =E9crit :

> I wonder how this driver made it into the kernel even though
> maintainers usually insist on CodingStyle.

This driver was already in the tree in 2.4.21, and it was probably
integrated a long time before that. And at that time, the quality
requirements for integration in the tree were much lower than they are
now.

This has some advantages, but also some drawbacks, which have been
discussed during the last kernel summit, according to
http://lwn.net/Articles/248195/ (end of the article).

Sincerly,

Thomas
--=20
Thomas Petazzoni - thomas.petazzoni@enix.org
http://{thomas,sos,kos}.enix.org - http://www.toulibre.org
http://www.{livret,agenda}dulibre.org
-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
