From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 10 Jan 2020 10:00:34 +0000
Subject: Re: [PATCH v2] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <b6e7b8ac-4de8-00a0-d12c-ebf727af3e26@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
In-Reply-To: <20200107170240.47207-1-wenyang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

> +@initialize:python@
…
> +def construct_warnings(str, suggested_fun):

This function will be used only for the operation modes “org” and “report”.
Thus I suggest to replace the specification “initialize” by a corresponding dependency
which is already applied for the SmPL rule “r”.


Can subsequent SmPL disjunctions become more succinct?


The passing of function name variants contains a bit of duplicate Python code.
Will a feature request like “Support for SmPL rule groups” become more interesting
for the shown use case?
https://github.com/coccinelle/coccinelle/issues/164

Regards,
Markus
