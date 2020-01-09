From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 09 Jan 2020 12:21:40 +0000
Subject: Re: [v2] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <d9680368-fb50-fc89-48fc-2c31cf8ee614@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
 <9a2b7d00-442e-0c1b-73cc-aed2bbecd13a@web.de>
 <alpine.DEB.2.21.2001091140380.10786@hadrien>
 <e479c5c7-2556-eb77-9e9c-8833fb883a39@web.de>
 <alpine.DEB.2.21.2001091304310.10786@hadrien>
 <d0d7eda5-6f4b-8501-624c-1f25b481520a@web.de>
 <alpine.DEB.2.21.2001091315560.10786@hadrien>
In-Reply-To: <alpine.DEB.2.21.2001091315560.10786@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

>> Does the dependency management around the application of SmPL disjunctions
>> need any further clarification?
>
> I already clarified it.  The python code will only be executed if the
> variables that it references have values.  The criterion is not just
> whether the rule r was matched.

Thanks for this information.


> To see that this is the case, all or you have to do is try it.  Or read
> the Coccinelle source code.

I would prefer a software documentation format which can be easier to read.

Regards,
Markus
