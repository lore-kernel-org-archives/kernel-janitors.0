From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 09 Jan 2020 12:17:44 +0000
Subject: Re: [v2] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <alpine.DEB.2.21.2001091315560.10786@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-695649286-1578572264=:10786"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
 <9a2b7d00-442e-0c1b-73cc-aed2bbecd13a@web.de>
 <alpine.DEB.2.21.2001091140380.10786@hadrien>
 <e479c5c7-2556-eb77-9e9c-8833fb883a39@web.de>
 <alpine.DEB.2.21.2001091304310.10786@hadrien>
 <d0d7eda5-6f4b-8501-624c-1f25b481520a@web.de>
In-Reply-To: <d0d7eda5-6f4b-8501-624c-1f25b481520a@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Wen Yang <wenyang@linux.alibaba.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Matthias_M=E4nnich?= <maennich@google.com>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-695649286-1578572264=:10786
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Thu, 9 Jan 2020, Markus Elfring wrote:

> >> Does the Coccinelle software ensure that a variable like “r.ul” contains
> >> really useful data even if the expected branch of the SmPL disjunction
> >> was occasionally not matched?
> >
> > The python code will only be executed if it does.
>
> The Python scripts will be executed if the SmPL rule “r” found something.
> I suggest to take a closer look at the involved data types for
> really safe case distinctions.
> Does the dependency management around the application of SmPL disjunctions
> need any further clarification?

I already clarified it.  The python code will only be executed if the
variables that it references have values.  The criterion is not just
whether the rule r was matched.

To see that this is the case, all or you have to do is try it.  Or read
the Coccinelle source code.

julia
--8323329-695649286-1578572264=:10786--
