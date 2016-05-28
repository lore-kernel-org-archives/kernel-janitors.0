From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 May 2016 10:53:39 +0000
Subject: Re: [patch] usb: f_fs: off by one bug in _ffs_func_bind()
Message-Id: <20160528105339.GG10957@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160527112311.GC3255@mwanda>
In-Reply-To: <20160527112311.GC3255@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sat, May 28, 2016 at 12:15:24PM +0200, Michal Nazarewicz wrote:
> On Sat, May 28 2016, Dan Carpenter wrote:
> > Also in the kernel we have to declare variables at the start of the
> > block.
>=20
> /me shrugs
>=20
> I looked at this out of curiosity and there are precedents:
>=20
>     $ git grep 'for (\(int\|unsigned\|signed\|long\|char\)[[:space:]]' |w=
c -l
>     19
>=20
> (albeit mostly in tools and scripts), CodingStyle is silent on that
> front and checkpatch.pl doesn=E2=80=99t complain about it.

Try compiling the code you suggested.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
