From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 26 Dec 2015 22:26:36 +0000
Subject: Re: [PATCH v2] coccinelle: api: check for propagation of error from platform_get_irq
Message-Id: <567F141C.8010000@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451157891-24881-1-git-send-email-Julia.Lawall@lip6.fr>
 <567EF188.7020203@cogentembedded.com>
 <alpine.DEB.2.02.1512262107340.2070@localhost6.localdomain6>
 <alpine.DEB.2.02.1512262123500.2070@localhost6.localdomain6>
 <567EF895.6080702@cogentembedded.com>
 <alpine.DEB.2.02.1512262156580.2070@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1512262156580.2070@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On 12/26/2015 11:58 PM, Julia Lawall wrote:

> The error return value of platform_get_irq seems to often get dropped.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>
> v2: Check for the direct return case also.  Added some mailing lists of
> common offenders.
>
> diff --git a/scripts/coccinelle/api/platform_get_irq_return.cocci b/scripts/coccinelle/api/platform_get_irq_return.cocci
> new file mode 100644
> index 0000000..44680d0
> --- /dev/null
> +++ b/scripts/coccinelle/api/platform_get_irq_return.cocci
> @@ -0,0 +1,58 @@
> +/// Propagate the return value of platform_get_irq.
> +//# Sometimes the return value of platform_get_irq is tested using <= 0, but 0
> +//# might not be an appropriate return value in an error case.
> +///
> +// Confidence: Moderate
> +// Copyright: (C) 2015 Julia Lawall, Inria. GPLv2.
> +// URL: http://coccinelle.lip6.fr/
> +// Options: --no-includes --include-headers
> +
> +virtual context
> +virtual org
> +virtual report
> +
> +// ----------------------------------------------------------------------------
> +
> +@r depends on context || org || report@
> +constant C;
> +statement S;
> +expression e, ret;
> +position j0, j1;
> +@@
> +
> +* e@j0 = platform_get_irq(...);
> +(
> +if@j1 (...) {
> +  ...
> +  return -C;
> +} else S
> +|
> +if@j1 (...) {
> +  ...
> +  ret = -C;
> +  ...
> +  return ret;
> +} else S

    Well, this seems to also cover the (e <= 0) checks which do make same 
sense in the light of Linus considering IRQ0 invalid. So I'd be more specific 
about the checks here -- 0 should indeed be overridden with something if it's 
considered invalid.

MBR, Sergei

