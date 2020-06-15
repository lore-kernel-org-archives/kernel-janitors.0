From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 15 Jun 2020 15:43:06 +0000
Subject: Re: [PATCH] coccinelle: api: add device_attr_show script
Message-Id: <alpine.DEB.2.22.394.2006151742090.23306@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-34029661-1592235787=:23306"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1f028ee6-b014-c240-21d8-0c1950334fe6@web.de>
In-Reply-To: <1f028ee6-b014-c240-21d8-0c1950334fe6@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-34029661-1592235787=:23306
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 15 Jun 2020, Markus Elfring wrote:

> > +// Confidence: High
>
> Would you like to add any suggestion for a possible patch message?
>
>
> …
> > +virtual report
> > +virtual org
> > +virtual context
> > +virtual patch
>
> +virtual report, org, context, patch
>
> Is such a SmPL code variant more succinct?

This doens't matter.

>
>
> …
> > +ssize_t show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	<...
> > +*	return snprintf@p(...);
> > +	...>
> > +}
>
> I suggest to reconsider the selection of the SmPL nest construct.
> https://github.com/coccinelle/coccinelle/blob/e06b9156dfa02a28cf3cbf0913a10513f3d163ab/docs/manual/cocci_syntax.tex#L783
>
> Can the construct “<+... … ...+>” become relevant here?

<... ...> is fine if the only thing that will be used afterwards is what
is inside the <... ...>

julia

>
>
> Would you like to consider any further software design consequences
> around the safe application of the asterisk functionality in rules
> for the semantic patch language?
>
> Regards,
> Markus
>
--8323329-34029661-1592235787=:23306--
