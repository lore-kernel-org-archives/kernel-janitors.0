From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 23 Jan 2018 16:31:30 +0000
Subject: Re: mfd: Patch management?
Message-Id: <20180123163130.h6ygmzig7syafxbh@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c50fe6a-21cc-e49d-1b10-5d2457ed4e2a@users.sourceforge.net>
 <20180123125851.ysypf7375sjlgsc6@dell>
 <20180123130130.powyttapsx3djawx@dell>
 <f8900a77-eea4-d244-37e1-44d22484f826@users.sourceforge.net>
 <20180123151419.prwq62c7gpsnpbx3@dell>
 <ef7a4d25-d4f1-77e3-5489-bbc385de3e5d@users.sourceforge.net>
In-Reply-To: <ef7a4d25-d4f1-77e3-5489-bbc385de3e5d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lars =?iso-8859-1?Q?P=F6schel?= <poeschel@lemonage.de>, Samuel Ortiz <sameo@linux.intel.com>

On Tue, 23 Jan 2018, SF Markus Elfring wrote:

> > My preferred mailer (Mutt) re-orders replied-to mails by putting them
> > to the top of my Inbox.  At which point I have to re-navigate down to
> > the next patch to review.
>=20
> How much does this tool influence the amount of update suggestions
> which you could handle easily and safely?

In the 5 years I've been doing this, this is the first time someone
has submitted in such a way as to cause an issue.

> > This is fine for most submissions, but you have fired ~30,
> > mostly individual patches at me.
>=20
> This number could be appropriate. I tried to contribute hundreds
> of change possibilities for various software components.

Moving forward, my advice to you would be to collect grouped patches
on a number of topic branches, then send them out in batches, perhaps
every couple of weeks.

Sending ~30 patches individually, spaced over a few hours/days, is
actually not a good system.  It is in fact quite inappropriate and a
pain to manage.  I for one find many (to be fair, very trivial)
patches scatter-gunned throughout my inbox to be rather inconvenient.

What I should do really is ask you to take all similar (remove error
message, don't use sizeof(struct X), remove '=3D NULL') changes and
squash them into single patches.  However, I realise that you might
want the "upstream creds", so I won't do that -- but not at the
expense of my time/effort.

The two choices are to squash or to create a set.

> > I'd like you to do the following please:
>=20
> It will take a while until you might get the next chance to take
> another look at these subsequent patches.

I'm not in a hurry.

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
