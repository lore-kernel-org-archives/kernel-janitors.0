From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 09 Jan 2020 12:14:45 +0000
Subject: Re: [v2] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <d0d7eda5-6f4b-8501-624c-1f25b481520a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
 <9a2b7d00-442e-0c1b-73cc-aed2bbecd13a@web.de>
 <alpine.DEB.2.21.2001091140380.10786@hadrien>
 <e479c5c7-2556-eb77-9e9c-8833fb883a39@web.de>
 <alpine.DEB.2.21.2001091304310.10786@hadrien>
In-Reply-To: <alpine.DEB.2.21.2001091304310.10786@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Wen Yang <wenyang@linux.alibaba.com>, cocci@systeme.lip6.fr
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

>> Does the Coccinelle software ensure that a variable like “r.ul” contains
>> really useful data even if the expected branch of the SmPL disjunction
>> was occasionally not matched?
>
> The python code will only be executed if it does.

The Python scripts will be executed if the SmPL rule “r” found something.
I suggest to take a closer look at the involved data types for
really safe case distinctions.
Does the dependency management around the application of SmPL disjunctions
need any further clarification?

Regards,
Markus
