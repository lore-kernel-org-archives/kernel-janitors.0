From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 27 Jun 2020 08:03:05 +0000
Subject: Re: [PATCH V3] firmware: stratix10-svc: Fix some error handling code
Message-Id: <20200627080305.GB1547070@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ecc14c7-b4df-1890-fbe7-91307c2db398@wanadoo.fr>
 <20200626193720.949431-1-christophe.jaillet@wanadoo.fr>
 <20200627051556.GD233327@kroah.com>
 <eb3ed7ba-902e-8ecf-1246-82ce88efd436@wanadoo.fr>
In-Reply-To: <eb3ed7ba-902e-8ecf-1246-82ce88efd436@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: richard.gong@linux.intel.com, atull@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jun 27, 2020 at 09:31:27AM +0200, Marion & Christophe JAILLET wrote:
>=20
> Le 27/06/2020 =E0 07:15, Greg KH a =E9crit=A0:
> > On Fri, Jun 26, 2020 at 09:37:20PM +0200, Christophe JAILLET wrote:
> > > ---
> > > v2: takes Dan's comment into account and fix another resource leak.
> > > v3: merge the previous 4 patches in a single one to ease review
> >=20
> > No, 4 small patches are _MUCH_ easier to review than one larger one that
> > mixes everything together.  Who told you to put them together?
>=20
> The cover letter of v2 serie can be found at [1].
> The request for merging them in 1 patch is in [2].
>=20
> V3, should be the same as v2, but all in one.
>=20
> [1]: https://lkml.org/lkml/2020/4/29/77
> [2]: https://lkml.org/lkml/2020/5/5/541

Please use lore.kernel.org in the future, we don't control lkml.org and
can't rely on it.

Anyway, that request was incorrect, sorry.  Please keep them split up in
a way that makes it easy to review.

Which would you want to read if you had to review hundreds of patches?

thanks,

greg k-h
