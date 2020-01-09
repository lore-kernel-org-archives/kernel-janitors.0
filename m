From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 09 Jan 2020 12:04:48 +0000
Subject: Re: [v2] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <alpine.DEB.2.21.2001091304310.10786@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-300527455-1578571488=:10786"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
 <9a2b7d00-442e-0c1b-73cc-aed2bbecd13a@web.de>
 <alpine.DEB.2.21.2001091140380.10786@hadrien>
 <e479c5c7-2556-eb77-9e9c-8833fb883a39@web.de>
In-Reply-To: <e479c5c7-2556-eb77-9e9c-8833fb883a39@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Wen Yang <wenyang@linux.alibaba.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Matthias_M=E4nnich?= <maennich@google.com>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-300527455-1578571488=:10786
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Thu, 9 Jan 2020, Markus Elfring wrote:

> >> Thus I suggest now to split the source code search pattern into
> >> four separate rules.
> >
> > Why?
>
> Does the Coccinelle software ensure that a variable like “r.ul” contains
> really useful data even if the expected branch of the SmPL disjunction
> was occasionally not matched?

The python code will only be executed if it does.

julia
--8323329-300527455-1578571488=:10786--
