From: Joe Perches <joe@perches.com>
Date: Thu, 19 Oct 2017 11:29:27 +0000
Subject: Re: kernel/module: Delete an error message for a failed memory allocation in add_module_usage()
Message-Id: <1508412567.6806.36.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a47bc166-7592-2ff8-9b94-4d45e18b6004@users.sourceforge.net>
         <20171019110824.wqkep7bpcx3dcw5w@redbean>
         <43c71898-82c3-215a-3176-e1a6d56ef10a@users.sourceforge.net>
In-Reply-To: <43c71898-82c3-215a-3176-e1a6d56ef10a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, Jessica Yu <jeyu@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>

On Thu, 2017-10-19 at 13:18 +0200, SF Markus Elfring wrote:
> > > Omit an extra message for a memory allocation failure in this functio=
n.
> > >=20
> > > This issue was detected by using the Coccinelle software.
> > >=20
> > > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >=20
> > Applied to modules-next, thanks.
>=20
> Thanks for your acceptance of this update suggestion after a bit of clari=
fication.
>=20
> Do you see any need that I should extend subsequent commit messages
> for this software transformation pattern?

Add=A0a description of _why_ this is being done.

Something like:

"because there is a dump_stack() done on allocation failures
 without __GFP_JNOWARN"

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
