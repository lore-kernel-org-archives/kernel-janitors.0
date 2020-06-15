From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 15 Jun 2020 14:04:39 +0000
Subject: Re: [PATCH] coccinelle: api: add device_attr_show script
Message-Id: <1f028ee6-b014-c240-21d8-0c1950334fe6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> +// Confidence: High

Would you like to add any suggestion for a possible patch message?


…
> +virtual report
> +virtual org
> +virtual context
> +virtual patch

+virtual report, org, context, patch

Is such a SmPL code variant more succinct?


…
> +ssize_t show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	<...
> +*	return snprintf@p(...);
> +	...>
> +}

I suggest to reconsider the selection of the SmPL nest construct.
https://github.com/coccinelle/coccinelle/blob/e06b9156dfa02a28cf3cbf0913a10513f3d163ab/docs/manual/cocci_syntax.tex#L783

Can the construct “<+... … ...+>” become relevant here?


Would you like to consider any further software design consequences
around the safe application of the asterisk functionality in rules
for the semantic patch language?

Regards,
Markus
