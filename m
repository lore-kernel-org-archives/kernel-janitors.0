From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 09 Aug 2014 09:13:58 +0000
Subject: Re: [patch 119/197] scripts/coccinelle/free: Delete NULL test before freeing functions?
Message-Id: <53E5E656.1000606@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53e53fd1.zO3IbUqJ421c7VXf%akpm@linux-foundation.org>
 <53E5DA60.90902@users.sourceforge.net>
 <alpine.DEB.2.02.1408091028520.2016@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1408091028520.2016@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> I still don't think this should be done for any random function that 
> performs a null test on its argument.  The corrections involved here are 
> not as trivial as they would seem.

I would prefer to make the list of corresponding function names more complete.


> Often it is not the case that the null test at the call site should be
> just deleted, instead the code should be reorganized.

Which source code places do you know where a different approach might look better?


> (Personally, I don't like the whole null test removal idea. [...]

Would you like to clarify involved software concerns a bit more?

Regards,
Markus
