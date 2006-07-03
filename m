From: "=?UTF-8?Q?H=C3=A5kon_L=C3=B8vdal?=" <hlovdal@gmail.com>
Date: Mon, 03 Jul 2006 11:08:28 +0000
Subject: Re: [KJ] [PATCH 2] drivers/atm/idt77252.c: Fix more KERN_* in
Message-Id: <a01a16b50607030408s46535f6xfd3b1c7c712cc5eb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44A83604.5090700@chello.nl>
In-Reply-To: <44A83604.5090700@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 03/07/06, Om Narasimhan <om.turyx@gmail.com> wrote:> On 7/3/06, Alexey D=
obriyan <adobriyan@gmail.com> wrote:> > On Sun, Jul 02, 2006 at 11:09:24PM =
+0200, Richard wrote:> > >                       for (i =3D 16; i < 64; i++=
)> > > -                             printk(" %02x", queue->data[i]);> > > =
+                             printk("KERN_DEBUG %02x", queue->data[i]);> S=
houldn't it be>             printk(KERN_DEBUG "%02x", queue->data[i]);> Not=
e the `"`
Yes but  the KERN_* constants should only be used at thebeginning of lines =
and this loop is printing something in themiddle, so in this case KERN_DEBU=
G should not be added.
BR H=E5kon L=F8vdal
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
