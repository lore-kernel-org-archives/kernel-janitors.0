From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 19 Nov 2019 21:33:37 +0000
Subject: Re: [PATCH 2/4] coccinelle: platform_get_irq: handle 2-statement branches
Message-Id: <75dbbf44-01ee-5d15-4b3b-1c9106fa8412@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1574184500-29870-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1574184500-29870-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org

> From: Masahiro Yamada <yamada.masahiro@socionext.com>

I wonder about this information.
Would you like to use the tag “Suggested-by” instead?


…
> +++ b/scripts/coccinelle/api/platform_get_irq.cocci
> @@ -31,6 +31,25 @@ if ( \( ret < 0 \| ret <= 0 \) )
…
> +ret =
> +(
> +platform_get_irq
> +|
> +platform_get_irq_byname
> +)(E, ...);
> +
> +if ( \( ret < 0 \| ret <= 0 \) )
> +-{
> +-dev_err(...);
> +S
> +-}

How do you think about to use the following SmPL code variant?

+ ret =
+(platform_get_irq
+|platform_get_irq_byname
+)(E, ...);
+
+ if ( \( ret < 0 \| ret <= 0 \) )
+-{
+-dev_err(...);
+ S
+-}

Regards,
Markus
