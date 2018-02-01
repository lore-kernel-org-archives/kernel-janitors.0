From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 01 Feb 2018 11:00:09 +0000
Subject: Re: Coccinelle: zalloc-simple: Delete function "kmem_cache_alloc" from SmPL rules
Message-Id: <f2793c7f-af1b-edc0-d9ea-0937c7241733@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <6bee0e11-59ef-b7b1-886e-7abaa30887f2@users.sourceforge.net>
 <alpine.DEB.2.20.1802011040110.3135@hadrien>
 <22276745-4723-4391-4460-07f0820ae85b@users.sourceforge.net>
 <alpine.DEB.2.20.1802011125460.3135@hadrien>
In-Reply-To: <alpine.DEB.2.20.1802011125460.3135@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> * Do we agree that a proper size determination is essential for every
>>   condition in the discussed SmPL rules together with forwarding
>>   this information?
> 
> No.  I don't mind a few false positives.

I have got other source code analysis expectations there.

This SmPL script contains the tag “Confidence: High”.


> The user can look at the answer and see if it is a false positive or not.

The situation is questionable because of a specific software design detail.

Unsafe source code search patterns could be stored under other script names
(or even different directories).
How do you think about to move the SmPL code (which I proposed for deletion)
to another script if you would insist to preserve it?


> Furthermore, I told you how to address this function so that the size
> issue would be taken care of.

You offered another bit of information.

I find your interpretation of this aspect also unclear at the moment.


> That is the patch that I would accept.

Are there any better development solutions left over?


>> * How can a name be ever relevant (within the published SmPL approach)
>>   for a function when it was designed in the way that it should generally
>>   work without a size parameter?
> 
> No idea what this means.

I am trying again to resolve corresponding communication difficulties.
Thus I suggest to take another look at the following SmPL code fragment.

…
  kmalloc_node(E1, ...)\|kmem_cache_alloc(...)\|kmem_alloc(E1, ...)\|
…
* memset((T2)x,0,E1);
…


How many constraints should be considered for function parameters here?

Regards,
Markus
