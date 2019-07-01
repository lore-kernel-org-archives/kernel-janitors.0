From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jul 2019 12:40:43 +0000
Subject: Re: [v2] Coccinelle: Suppression of warnings?
Message-Id: <eb95005d-e685-0a8f-416c-1a30ad3fbaa0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <2744a3fc-9e67-8113-1dd9-43669e06386a@web.de>
 <0b48a5c5-0814-6414-39ba-beb1b8b5253a@metux.net>
In-Reply-To: <0b48a5c5-0814-6414-39ba-beb1b8b5253a@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrico Weigelt <lkml@metux.net>, kernel-janitors@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>

> By the way: do we have any mechanism for explicitly suppressing
> individual warnings (some kind of annotation),

I do not know such an accepted specification interface
(for the handling together with SmPL scripts) so far.
How would you identify possibly unwanted messages in a safe way?


> when the maintainer is sure that some particular case is a false-positive ?

Do you know any specific source code places already where you would get
concerned about the confidence and relevance of the provided information?

Regards,
Markus
