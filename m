From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 15 Feb 2006 23:31:27 +0000
Subject: Re: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <Pine.LNX.4.58.0602151522120.32155@shark.he.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139970072.25492.4.camel@localhost.localdomain>
In-Reply-To: <1139970072.25492.4.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, 16 Feb 2006, H=E5kon L=F8vdal wrote:

> On 2/15/06, Greg KH <greg@kroah.com> wrote:
> > On Tue, Feb 14, 2006 at 08:21:12PM -0600, Matthew Martin wrote:
> > > -     unsigned char exp;
> > > +     unsigned char exp =3D '\0';
> >
> > What's wrong with just "0" here?
>
> In my opinion '\0' is the correct representation here.
>
> '\0'	ASCII nul character
> 0	arithmetic value zero
> NULL	null pointer
>
> All of those _could_ be represented with just "0", however using 0 as
> such a multipurpose character/value/pointer constant is not a good idea
> because it makes the code less clear to read.
>
> Linus has been very clear on that NULL and only NULL should be used for
> pointers, and there was a large set of patches converting from 0 to NULL
> in 2004.
>
> How is '\0' vs 0 different?

I didn't see any problem with using '\0' either, as long as it's
meant to be a character instead of an 8-bit integer.

Looking at ov511.c, it appears to be an 8-bit integer...
so 0 makes more sense to me in this case.

I find its usage more interesting.  Did the patch also address
this part?  What does this do?

	sensor_get_exposure(ov, &exp);
	return sprintf(buf, "%d\n", exp >> 8);

Does that always print 0?  (for exp >> 8)

--=20
~Randy

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
