From: Joe Perches <joe@perches.com>
Date: Tue, 04 Jan 2011 17:07:14 +0000
Subject: Re: [patch] checkpatch: putting the && or || on the wrong line
Message-Id: <1294160834.6617.51.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110104055900.GA5062@bicker>
	 <20110104163836.GA30317@fieldses.org>
	 <20110104164414.GX5875@const.bordeaux.inria.fr>
In-Reply-To: <20110104164414.GX5875@const.bordeaux.inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Dan Carpenter <error27@gmail.com>, Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2011-01-04 at 17:44 +0100, Samuel Thibault wrote:
> J. Bruce Fields, le Tue 04 Jan 2011 11:38:36 -0500, a =C3=A9crit :
> > On Tue, Jan 04, 2011 at 08:59:00AM +0300, Dan Carpenter wrote:
> > > This patch makes checkpatch.pl complain if you break up conditions in
> > > the wrong way.
> > > Wrong:
> > > 	if ((really_long_condition)
> > > 		&& (second_condition)) { ...
> > > Right:
> > > 	if ((really_long_condition) &&
> > > 		(second_condition)) { ...
> > As far as I can tell, the convention in mathematical typesetting is to
> > put operators on the left, not the right.  When the conditions are short
> > of there are more lines, that allows you to left-align on the repeated
> > operator.
> I personally find the left approach more readable.

As do I, but perhaps coding style in a project like this
shouldn't be personal but collective.

The trailing style outnumbers the leading style ~ 5:1.

$ grep -rP --include=3D*.[ch] "(\|\||&&)[ \t]*$" * | wc -l
39890
$ grep -rP --include=3D*.[ch] "^[ \t]*(\|\||&&)" * | wc -l
8244

If you take out drivers/staging, trailing is used ~ 6:1.

I think that high enough to be declared the preferred style.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
