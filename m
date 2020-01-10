From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 10 Jan 2020 16:35:21 +0000
Subject: Re: [PATCH v3] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <91abb141-57b8-7659-25ec-8080e290d846@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110131526.60180-1-wenyang@linux.alibaba.com>
In-Reply-To: <20200110131526.60180-1-wenyang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

> +@initialize:python@
…
> +def filter_out_safe_constants(str):
…
> +def construct_warnings(str, suggested_fun):

* I suggest once more to adjust the dependency specifications for the usage
  of these functions by SmPL rules.

* Can the local variable “msg” be omitted?


> +coccilib.org.print_todo(p[0], construct_warnings("div64_ul"))

I suggest again to move the prefix “div64_” into the string literal
of the function implementation.


The SmPL code for two disjunctions could become shorter.

Regards,
Markus
