From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 17 Mar 2005 13:01:48 +0000
Subject: Re: [KJ] [PATCH] printk : drivers/net/tulip/dmfe.c
Message-Id: <20050317130148.GJ2102@rhum.iomeda.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050317103327.GH2102@rhum.iomeda.fr>
In-Reply-To: <20050317103327.GH2102@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Arnd Bergmann (arnd@arndb.de) wrote:
> On Dunnersdag 17 M=E4rz 2005 11:33, Christophe Lucas wrote:
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ent->driver_data >> 16,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pci_name(pdev));
> > =A0=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < 6; i++)
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0printk("%c%02x", i ? ':' =
: ' ', dev->dev_addr[i]);
> > -=A0=A0=A0=A0=A0=A0=A0printk(", irq %d.\n", dev->irq);
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0printk(KERN_INFO "%c%02x"=
, i ? ':' : ' ', dev->dev_addr[i]);
> > +=A0=A0=A0=A0=A0=A0=A0printk(KERN_INFO ", irq %d.\n", dev->irq);
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0pci_set_master(pdev);
>=20
> No, this is wrong. KERN_* constants only make sense at the start of an
> output line, i.e. after '\n'.
> In this case, the code prints a list of strings in a single line and your
> patch changes the output from the correct
>=20
> "Davicom DMxx at pci 0:0, a:b:c:d:e:f , irq 1"
>=20
> to=20
>=20
> "Davicom DMxx at pci 0:0,<6> a<6>:b<6>:c<6>:d<6>:e<6>:f<6>, irq 1"

Thanks for your comment. :)
It is appreciate.
--=20
	~Christophe

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
