From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 Nov 2019 21:00:58 +0000
Subject: Re: Coccinelle: zalloc-simple: Adjust a message construction
Message-Id: <8c92e3e6-83bd-7416-d15a-dee36521c69e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <042136cf-4e58-02bd-4d49-5d5055f22c65@web.de>
 <alpine.DEB.2.21.1911032039150.2557@hadrien>
In-Reply-To: <alpine.DEB.2.21.1911032039150.2557@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>

>> * Simplify a message construction in a Python script rule
>>   for the semantic patch language.
>
> The benefit is what?

The avoidance to store the shown string in the extra Python variable “msg”.


>> * Delete also a duplicate space character then.

I find the proposed wording a bit nicer, don't you?

Regards,
Markus
