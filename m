From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 09 Jan 2020 10:35:33 +0000
Subject: Re: [PATCH v2] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <9a2b7d00-442e-0c1b-73cc-aed2bbecd13a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
In-Reply-To: <20200107170240.47207-1-wenyang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

> - fix 'WARNING:' twice in each case.

A duplicate text was removed.


> +@script:python depends on org@
> +p << r.p;
> +ul << r.ul;

I interpret this variable assignment in the way that it will work only
if the corresponding branch of the SmPL disjunction was actually matched
by the referenced SmPL rule.
Thus I suggest now to split the source code search pattern into
four separate rules.


> +warnings = construct_warnings(ul, "div64_ul")

* Can two identifiers be nicer without an “s”?

* Would it be sufficient to pass a shorter identification
  (without the prefix “div64_”)?

Regards,
Markus
