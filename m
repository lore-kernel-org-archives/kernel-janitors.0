From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 03 Jul 2006 11:40:25 +0000
Subject: Re: [KJ] [PATCH 2] drivers/atm/idt77252.c: Fix more KERN_* in
Message-Id: <20060703114025.GG12211@rotomalug.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44A83604.5090700@chello.nl>
In-Reply-To: <44A83604.5090700@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

H=E5kon L=F8vdal (hlovdal@gmail.com) wrote:
> On 03/07/06, Om Narasimhan <om.turyx@gmail.com> wrote:> On 7/3/06, Alexey=
 Dobriyan <adobriyan@gmail.com> wrote:> > On Sun, Jul 02, 2006 at 11:09:24P=
M +0200, Richard wrote:> > >                       for (i =3D 16; i < 64; i=
++)> > > -                             printk(" %02x", queue->data[i]);> > =
> +                             printk("KERN_DEBUG %02x", queue->data[i]);>=
 Shouldn't it be>             printk(KERN_DEBUG "%02x", queue->data[i]);> N=
ote the `"`
> Yes but  the KERN_* constants should only be used at thebeginning of line=
s and this loop is printing something in themiddle, so in this case KERN_DE=
BUG should not be added.
> BR H=E5kon L=F8vdal

Please configure your MUA correctly (72 cars,...).

Have a nice day,

			 - Christophe -

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
