From: Julia Lawall <julia.lawall@inria.fr>
Date: Fri, 10 Jan 2020 12:34:41 +0000
Subject: Re: [PATCH v2] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <alpine.DEB.2.21.2001101334160.2897@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1162816898-1578659682=:2897"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
 <b6e7b8ac-4de8-00a0-d12c-ebf727af3e26@web.de>
In-Reply-To: <b6e7b8ac-4de8-00a0-d12c-ebf727af3e26@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Wen Yang <wenyang@linux.alibaba.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Matthias_M=E4nnich?= <maennich@google.com>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1162816898-1578659682=:2897
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 10 Jan 2020, Markus Elfring wrote:

> > +@initialize:python@
> …
> > +def construct_warnings(str, suggested_fun):
>
> This function will be used only for the operation modes “org” and “report”.
> Thus I suggest to replace the specification “initialize” by a corresponding dependency
> which is already applied for the SmPL rule “r”.
>
>
> Can subsequent SmPL disjunctions become more succinct?
>
>
> The passing of function name variants contains a bit of duplicate Python code.
> Will a feature request like “Support for SmPL rule groups” become more interesting
> for the shown use case?
> https://github.com/coccinelle/coccinelle/issues/164

The code is fine as it is in these respects.

julia
--8323329-1162816898-1578659682=:2897--
