From: Joe Perches <joe@perches.com>
Date: Tue, 15 Dec 2015 18:34:11 +0000
Subject: Re: staging: lustre: Delete unnecessary goto statements in six functions
Message-Id: <1450204451.4142.19.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	 <566D7733.1030102@users.sourceforge.net>
	 <566D7830.9060000@users.sourceforge.net>
	 <1450189676.3551.1.camel@perches.com> <20151215144133.GC5284@mwanda>
	 <1450191751.3551.14.camel@perches.com> <20151215174844.GE5284@mwanda>
	 <1450203011.4142.4.camel@perches.com>
	 <56705B71.6090307@users.sourceforge.net>
In-Reply-To: <56705B71.6090307@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, 2015-12-15 at 19:26 +0100, SF Markus Elfring wrote:
> > 	rc =3D mdc_queue_wait(req);
> > 	goto out;
> > out:
> > 	ptlrpc_req_finished(req);
> > 	return rc;
> > }
> > ---------------------
> >=20
> > I think if the last goto out; is to be removed,
> > then it should be replaced by a blank line.
> >=20
> > It separates the last operation block from the return.
>=20
> Would you like to point a very specific coding style issue out?

Other than using vertical separation can help readability?

I think there should _not_ be a hardened rule.
Style is just a guide. =A0Do what you think appropriate.

> How often should jump labels preceded with blank lines?

When other nearby blocks are also separated by blank lines.

Localized consistency can be useful.

Inconsistency can make code harder to follow/predict.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
