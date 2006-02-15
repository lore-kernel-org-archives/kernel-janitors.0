From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Wed, 15 Feb 2006 23:16:35 +0000
Subject: Re: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <a01a16b50602151516h270b8329lc518b014d7cd6d17@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139970072.25492.4.camel@localhost.localdomain>
In-Reply-To: <1139970072.25492.4.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2/15/06, Greg KH <greg@kroah.com> wrote:
> On Tue, Feb 14, 2006 at 08:21:12PM -0600, Matthew Martin wrote:
> > -     unsigned char exp;
> > +     unsigned char exp =3D '\0';
>
> What's wrong with just "0" here?

In my opinion '\0' is the correct representation here.

'\0'	ASCII nul character
0	arithmetic value zero
NULL	null pointer

All of those _could_ be represented with just "0", however using 0 as
such a multipurpose character/value/pointer constant is not a good idea
because it makes the code less clear to read.

Linus has been very clear on that NULL and only NULL should be used for
pointers, and there was a large set of patches converting from 0 to NULL
in 2004.

How is '\0' vs 0 different?

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
