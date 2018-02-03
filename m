From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Feb 2018 07:22:54 +0000
Subject: Re: Coccinelle: zalloc-simple: Checking consistency for SmPL rules
Message-Id: <c7a59e25-a77f-a0ba-8635-5910dbba5d81@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <6bee0e11-59ef-b7b1-886e-7abaa30887f2@users.sourceforge.net>
 <alpine.DEB.2.20.1802011040110.3135@hadrien>
 <22276745-4723-4391-4460-07f0820ae85b@users.sourceforge.net>
 <alpine.DEB.2.20.1802011125460.3135@hadrien>
In-Reply-To: <alpine.DEB.2.20.1802011125460.3135@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: cocci@systeme.lip6.fr, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> * Do we agree that a proper size determination is essential for every
>>   condition in the discussed SmPL rules together with forwarding
>>   this information?
> 
> No.  I don't mind a few false positives.

Do you care to split SmPL rules by their confidence category in such an use case?

Regards,
Markus
