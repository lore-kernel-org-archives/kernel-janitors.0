From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 01 Feb 2018 10:17:33 +0000
Subject: Re: Coccinelle: zalloc-simple: Delete function "kmem_cache_alloc" from SmPL rules
Message-Id: <22276745-4723-4391-4460-07f0820ae85b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <6bee0e11-59ef-b7b1-886e-7abaa30887f2@users.sourceforge.net>
 <alpine.DEB.2.20.1802011040110.3135@hadrien>
In-Reply-To: <alpine.DEB.2.20.1802011040110.3135@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> The function "kmem_cache_alloc" was specified despite of the technical
>> detail that this function does not get a parameter passed which would
>> correspond to such a size information.
>>
>> Thus remove it from the first two SmPL rules and omit the rule "r4".
> 
> Nack.

I find such a rejection surprising once more.


> It should be supported by the size determined in another way.

I am curious on how our different views could be clarified further
for this special software situation.

* Do we agree that a proper size determination is essential for every
  condition in the discussed SmPL rules together with forwarding
  this information?

* How can a name be ever relevant (within the published SmPL approach)
  for a function when it was designed in the way that it should generally
  work without a size parameter?

Regards,
Markus
