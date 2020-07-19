From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 19 Jul 2020 08:36:25 +0000
Subject: Re: [v2 1/4] coccinelle: api: extend memdup_user transformation with GFP_USER
Message-Id: <f97743d2-4840-94a0-8133-b751adcd9e88@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b9f2c58-e124-22d2-d91d-62a6e831c880@web.de>
 <alpine.DEB.2.22.394.2007180841520.2538@hadrien>
 <cf2bd604-3094-f90a-52a8-ff5a44cf3850@linux.com>
In-Reply-To: <cf2bd604-3094-f90a-52a8-ff5a44cf3850@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Efremov <efremov@linux.com>, Julia Lawall <julia.lawall@inria.fr>, Coccinelle <cocci@systeme.lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

>> you do indeed need to put - in front of the second and third lines as well.
>
> Thanks, Markus, Julia. I will send v3.

How do you think about to discuss any remaining open issues already
on the current software development version for your transformation approach?

Regards,
Markus
