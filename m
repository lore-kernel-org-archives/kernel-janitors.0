From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 05 Jan 2020 10:33:41 +0000
Subject: Re: [PATCH] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <21e9861a-5afc-fd66-cfd1-a9b5b92b230b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200104064448.24314-1-wenyang@linux.alibaba.com>
In-Reply-To: <20200104064448.24314-1-wenyang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

> +virtual context
> +virtual org
> +virtual report

The operation mode “patch” is not supported here.
Should the term “semantic code search” be used instead in the subject again?


> +@@
> +(
> +* do_div(f, l);
> +|
> +* do_div(f, ul);
> +|
> +* do_div(f, ul64);
> +|
> +* do_div(f, sl64);
> +)

I suggest to avoid the specification of duplicate SmPL code.

+@@
+*do_div(f, \( l \| ul \| ul64 \| sl64 \) );


Will any more case distinctions become helpful?


> +@script:python depends on report@
> +p << r.p;
> +@@
> +
> +msg="WARNING: WARNING: do_div() does a 64-by-32 division, which may truncation the divisor to 32-bit"
> +coccilib.report.print_report(p[0], msg)

Please improve the message construction.

Regards,
Markus
