From: mirsal <mirsal@mirsal.fr>
Date: Mon, 11 Mar 2013 20:51:23 +0000
Subject: Re: [PATCH 3/4] drivers: android: binder: Remove excessive indentation
Message-Id: <1363035083.10491.31.camel@mirsal-laptop1.mirsal.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-uO5lED5+SzEIWjI/O3K2"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
	 <1363030315-10229-4-git-send-email-mirsal@mirsal.fr>
	 <1363033528.2056.48.camel@joe-AO722>
In-Reply-To: <1363033528.2056.48.camel@joe-AO722>
To: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <greg@kroah.com>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--=-uO5lED5+SzEIWjI/O3K2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-03-11 at 13:25 -0700, Joe Perches wrote:
> On Mon, 2013-03-11 at 20:31 +0100, Mirsal Ennaime wrote:
> > Remove one level of indentation from the binder proc page release code
> > by using slightly different control semantics.
> []
> > diff --git a/drivers/staging/android/binder.c b/drivers/staging/android=
/binder.c
> []
> > @@ -3002,18 +3002,20 @@ static void binder_deferred_release(struct bind=
er_proc *proc)
> >  	if (proc->pages) {
> >  		int i;
> >  		for (i =3D 0; i < proc->buffer_size / PAGE_SIZE; i++) {
> > -			if (proc->pages[i]) {
> > -				void *page_addr =3D proc->buffer + i * PAGE_SIZE;
> > -				binder_debug(BINDER_DEBUG_BUFFER_ALLOC,
> > -					"binder_release: %d: page %d at %p not freed\n",
> > -					proc->pid, i,
> > -					page_addr);
> > -				unmap_kernel_range((unsigned long)page_addr,
> > -					PAGE_SIZE);
> > -				__free_page(proc->pages[i]);
> > -				page_count++;
> > -			}
> > +			if (!proc->pages[i])
> > +				continue;
> > +
> > +			void *page_addr =3D proc->buffer + i * PAGE_SIZE;
>=20
> Please declare variables immediately after an open brace.
> [...]

Indeed, I shall merge patches 3 and 4, then.

thanks!

--=20
mirsal=20

--=-uO5lED5+SzEIWjI/O3K2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAABCAAGBQJRPkPLAAoJEPePn+hK5bYQhkwH+wRpsXBqo87dQQ23rvz5kEku
OYFk3Nh6ptzaiv71Wxh4iTjSy5hLQq93ukL/mP3ofzqlkRh44tC4yWc/XlQ11vB8
7Fsx+LEnmNo1gBmjhmZjMt9ECVZP/HyAA9puRC7Rs7Ot6iOSNpHJvXrHaIfQtXQA
1FwRe7xKYQ+f5JO96hxtFqzqfk59nN2fUAuws6GNGP6ERA4pvhQrD5Sls6c9Esrj
IV0oKhIwioKBtNgEDytcK+I/Cyqi+Jjx/ijc7uLcxPipc5yc+Gsr26SMYdsauB3F
eaRE/5Jem0Ogra8q0D9/YtNhhm6Q2iDhB+hRSkc/ZMJevCNlx9lTKez62TuOmII=
=1TOp
-----END PGP SIGNATURE-----

--=-uO5lED5+SzEIWjI/O3K2--

