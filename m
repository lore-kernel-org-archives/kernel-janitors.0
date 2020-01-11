From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 11 Jan 2020 08:03:49 +0000
Subject: Re: [v3] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <c64b6f61-f523-dc8a-2abc-b0e9a8cd2d98@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110131526.60180-1-wenyang@linux.alibaba.com>
 <91abb141-57b8-7659-25ec-8080e290d846@web.de>
 <c4ada2f2-19b0-91ef-ddf3-a1999f4209ea@linux.alibaba.com>
 <5a9f1ad1-3881-2004-2a7b-d61f1d201cf9@web.de>
 <alpine.DEB.2.21.2001110841140.2965@hadrien>
In-Reply-To: <alpine.DEB.2.21.2001110841140.2965@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

>> Can the avoidance of duplicate source code (according to SmPL disjunctions)
>> trigger positive effects on run time characteristics and software maintenance?
>
> Markus.  Please stop asking this question.

This will not happen for a while.


> You are bothering people with this advice,

I present just another view.


> why don't _you_ figure out once and for all whether the change
> that you suggest has any "positive effects on the run time characteristics"?
> Hint: it will not.

* How much attention do you give to the software development principle
  "Don't repeat yourself"?

* Can the file size of a SmPL script matter a bit?


> Coccinelle has a pass that propagates disjunctions at the sub-statement level
> to the statement level.

This data processing can probably trigger further development considerations.

Regards,
Markus
