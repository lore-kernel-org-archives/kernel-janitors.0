From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 06 Jun 2020 11:21:41 +0000
Subject: Re: coccinelle: api: add kvfree script
Message-Id: <bf698c44-4384-e471-3ff0-e38587140b98@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
 <alpine.DEB.2.21.2006060944320.2578@hadrien>
 <51a176d4-8c59-5da1-b4d2-c97b17b691a7@web.de>
 <alpine.DEB.2.21.2006061307020.2578@hadrien>
In-Reply-To: <alpine.DEB.2.21.2006061307020.2578@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> So there are a lot of reasons why constraints are useful.

Thanks for such a view.

Thus I dare to point the possibility out to consider their application
for mentioned function name lists (besides using SmPL disjunctions).
Can coding style concerns be resolved in a more constructive way then?


> But hiding information that could be apparent to the SmPL compiler
> and could be used to improve the performance of the matching
> process is not one of them.

Will any software extensions become possible also in this area?

Regards,
Markus
