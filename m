From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Tue, 04 Jan 2011 16:44:14 +0000
Subject: Re: [patch] checkpatch: putting the && or || on the wrong line
Message-Id: <20110104164414.GX5875@const.bordeaux.inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110104055900.GA5062@bicker> <20110104163836.GA30317@fieldses.org>
In-Reply-To: <20110104163836.GA30317@fieldses.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Dan Carpenter <error27@gmail.com>, Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, joe@perches.com

J. Bruce Fields, le Tue 04 Jan 2011 11:38:36 -0500, a =E9crit :
> On Tue, Jan 04, 2011 at 08:59:00AM +0300, Dan Carpenter wrote:
> > This patch makes checkpatch.pl complain if you break up conditions in
> > the wrong way.
> >=20
> > Wrong:
> > 	if ((really_long_condition)
> > 		&& (second_condition)) { ...
> > Right:
> > 	if ((really_long_condition) &&
> > 		(second_condition)) { ...
>=20
> As far as I can tell, the convention in mathematical typesetting is to
> put operators on the left, not the right.  When the conditions are short
> of there are more lines, that allows you to left-align on the repeated
> operator.

I personnally find the left approach more readable.

Samuel
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
