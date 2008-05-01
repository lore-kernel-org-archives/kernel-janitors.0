From: Ricardo Martins <ricardo@scarybox.net>
Date: Thu, 01 May 2008 19:54:48 +0000
Subject: Re: [PATCH 1/1] mmap: fix uninitialized entities warnings.
Message-Id: <20080501195448.GA954@macbookpro>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="45Z9DzgjV8m4Oswq"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
In-Reply-To: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
To: kernel-janitors@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 01 May 2008 13:16, Matthew Wilcox wrote:
> On Thu, May 01, 2008 at 08:06:52PM +0100, Ricardo Martins wrote:
> > This is my first patch for the Linux kernel. It fixes the following
> > warnings given by gcc 4.3.0 about uninitialzed entities in mmap.c:
>
> First, it's generally a bad idea to fix these warnings.  They sometimes
> obscure real bugs.

I see.

> > I'd appreciate some feedback.
>
> >   *		x: (no) no	x: (no) yes	x: (no) yes	x: (yes) yes
> > - *
> > + *
>
> Don't mix whitespace changes with other changes.

Ok, it won't happen again.

> > -	struct vm_area_struct *vma, *prev;
> > +	struct vm_area_struct *vma, *prev = NULL;
>
> gcc bug -- it's failing to notice that find_vma_prepare() will always
> initialise pprev.
>
> > -	struct rb_node **rb_link, *rb_parent;
> > +	struct rb_node **rb_link = NULL, *rb_parent = NULL;
>
> Likewise.

Hmm, that crossed my mind and I thought it was weird that gcc was
complaining about it.

> The other changes in your patch are either whitespace or fixes for the
> same gcc problem.

Thanks for your feedback; it was very helpful, since I'm a C newbie.

Regards,
--
 Ricardo Martins  *  scarybox.net  *  GPG key: 0x1308F1B4

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkgaIAgACgkQkH81LRMI8bRGHQCcCXuRAbpn2Dzy2Aw8G93IUFUC
YpgAnRfWtr4GE4YZBY9BhOWQrKtCXp3C
=AilR
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
