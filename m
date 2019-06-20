From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 20 Jun 2019 18:48:23 +0000
Subject: Re: [PATCH] Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <alpine.DEB.2.21.1906202046550.3087@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1240475580-1561056503=:3087"
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
In-Reply-To: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1240475580-1561056503=:3087
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Thu, 20 Jun 2019, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 20 Jun 2019 19:12:53 +0200
>
> The function “devm_ioremap_resource” contains appropriate error reporting.
> Thus it can be questionable to present another error message
> at other places.
>
> Provide design options for the adjustment of affected source code
> by the means of the semantic patch language (Coccinelle software).
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  .../coccinelle/misc/redundant_dev_err.cocci   | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 scripts/coccinelle/misc/redundant_dev_err.cocci
>
> diff --git a/scripts/coccinelle/misc/redundant_dev_err.cocci b/scripts/coccinelle/misc/redundant_dev_err.cocci
> new file mode 100644
> index 000000000000..aeb228280276
> --- /dev/null
> +++ b/scripts/coccinelle/misc/redundant_dev_err.cocci
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/// Reconsider a function call for redundant error reporting.
> +//
> +// Keywords: dev_err redundant device error messages
> +// Confidence: Medium
> +
> +virtual patch
> +virtual context
> +virtual org
> +virtual report
> +
> +@display depends on context@
> +expression e;
> +@@
> + e = devm_ioremap_resource(...);
> + if (IS_ERR(e))
> + {
> +*   dev_err(...);
> +    return (...);
> + }

Why do you assume that there is exactly one dev_err and one return after
the test?

> +
> +@deletion depends on patch@
> +expression e;
> +@@
> + e = devm_ioremap_resource(...);
> + if (IS_ERR(e))
> +-{
> +-   dev_err(...);
> +    return (...);
> +-}
> +
> +@or depends on org || report@
> +expression e;
> +position p;
> +@@
> + e = devm_ioremap_resource(...);
> + if (IS_ERR(e))
> + {
> +    dev_err@p(...);
> +    return (...);
> + }
> +
> +@script:python to_do depends on org@
> +p << or.p;
> +@@
> +coccilib.org.print_todo(p[0],
> +                        "WARNING: An error message is probably not needed here because the previously called function contains appropriate error reporting.")

"the previously called function" would be better as
"devm_ioremap_resource".

julia

> +
> +@script:python reporting depends on report@
> +p << or.p;
> +@@
> +coccilib.report.print_report(p[0],
> +                             "WARNING: An error message is probably not needed here because the previously called function contains appropriate error reporting.")
> --
> 2.22.0
>
>
--8323329-1240475580-1561056503=:3087--
