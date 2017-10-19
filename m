From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Date: Thu, 19 Oct 2017 14:16:37 +0000
Subject: Re: [PATCH 4/4] char/tpm: Less checks in tpm_ibmvtpm_probe() after error detection
Message-Id: <20171019161637.7eaba6e4@kitsune.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d3516a2-a8e6-9e95-d438-f115fac84c7f@users.sourceforge.net>
        <09a2c3a1-1b10-507d-a866-258b570f6da1@users.sourceforge.net>
        <20171019135632.4af42743@kitsune.suse.cz>
        <20171019133646.gu7qv2tywfk4tcxj@mwanda>
In-Reply-To: <20171019133646.gu7qv2tywfk4tcxj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 19 Oct 2017 16:36:46 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Thu, Oct 19, 2017 at 01:56:32PM +0200, Michal Such=C3=A1nek wrote:
> >=20
> > I think a single cleanup section is better than many labels that
> > just avoid a single null check.
> > =20
>=20
> I am not a big advocate of churn, but one err style error handling is
> really bug prone.
>=20
> I'm dealing with static analysis so most of the bugs I see are error
> handling bugs. =20

But it looks like you do not deal much with actual code development
because then you would know that some of the changes proposed by the
static analysis lead to errors later when the code dynamically changes.

> That's because error handling is hard to test but easy
> for static analysis.  One err style error handling is the worst
> because you get things like:
>=20
> fail:
> 	kfree(foo->bar);
> 	kfree(foo);
>=20
> Oops, foo->bar is a NULL dereference.  And generally, it's a bad thing
> to free things that haven't been allocated so, for example, I see
> refcounting bugs in error handling paths as well where we decrement
> something that wasn't incremented.  Freeing everything is more
> complicated than just freeing one specific thing the way standard
> kernel error handling works.

It depends on the function in question. If it only allocates memory
which is not reference-counted and kfree() checks for the null in most
cases it is easier to do just one big cleanup.=20

If it is more complex more labels are preferable.

>=20
> > As long as you can tell easily which resources were already
> > allocated and need to be freed it is saner to keep only one cleanup
> > section.=20
>=20
> Sure, if the function is simple and short then the error handling is
> normally simple and short.  This is true for any style of error
> handling.
>=20
> > If the code doing the allocation is changed in the future the single
> > cleanup can stay whereas multiple labels have to be rewritten
> > again. =20
>=20
> No, they don't unless you choose bad label names. =20

You obviously miss the fact that resource allocation is not always
added at the end of the function.

You may need to reorder the code and hence the order of allocation or
add allocation at the start. Both of these cases break multiple labels
and special cases but work with one big cleanup just fine.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
