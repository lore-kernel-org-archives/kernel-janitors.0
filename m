From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 26 Jan 2018 11:45:14 +0000
Subject: Re: mfd: Patch management?
Message-Id: <20180126114514.dwhwwgcp4n6fayre@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c50fe6a-21cc-e49d-1b10-5d2457ed4e2a@users.sourceforge.net>
 <20180123125851.ysypf7375sjlgsc6@dell>
 <20180123130130.powyttapsx3djawx@dell>
 <f8900a77-eea4-d244-37e1-44d22484f826@users.sourceforge.net>
 <20180123151419.prwq62c7gpsnpbx3@dell>
 <ef7a4d25-d4f1-77e3-5489-bbc385de3e5d@users.sourceforge.net>
 <20180123163130.h6ygmzig7syafxbh@dell>
 <49873902-c947-468d-094a-4ac175850116@users.sourceforge.net>
In-Reply-To: <49873902-c947-468d-094a-4ac175850116@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lars =?iso-8859-1?Q?P=F6schel?= <poeschel@lemonage.de>, Samuel Ortiz <sameo@linux.intel.com>

On Fri, 26 Jan 2018, SF Markus Elfring wrote:

Do not send private emails containing list related content.

<putting this conversation back on the list, where it belongs>

> > Moving forward, my advice to you would be to collect grouped patches
> > on a number of topic branches,
>=20
> I am using development branches generally.

Great, so write patches and add them to your topic branches.  Then
send them out periodically, together, as a threaded set.

  See: `git send-email` -- grep for "--thread"

> > then send them out in batches, perhaps every couple of weeks.
>=20
> I got other preferences for time ranges around patch distribution.

Not sure what this means.  I'm guessing you're saying that you are not
willing to collect your patches and you intend on sending them one at
a time, over time.

If I am understanding you correctly, then your patches will not be
reviewed.

> > Sending ~30 patches individually, spaced over a few hours/days,
> > is actually not a good system.
>=20
> It happened that several update candidates were noticed by static
> source code analysis also in this software area.

Doesn't matter.  Collect them up and send them as a batch.

> > It is in fact quite inappropriate and a pain to manage.
>=20
> It becomes more interesting when the patch numbers grow, doesn't it?

When contributors do not manage their submissions properly, it does
become more *annoying* and unmanageable, yes.

> > I for one find many (to be fair, very trivial) patches scatter-gunned
> > throughout my inbox to be rather inconvenient.
>=20
> Are you looking for any better management tools?

No.

> Do you find any of the remaining change possibilities acceptable
> in principle?

I'm not going to review them until you re-submit them in an acceptable
manner, as requested.

> > The two choices are to squash or to create a set.
>=20
> When will the adjustments which you could integrate already
> appear on the Linux next interface?
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/d=
rivers/mfd/

When the merge-window closes.

--=20
Lee Jones
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
