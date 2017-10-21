From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Oct 2017 20:00:23 +0000
Subject: Re: crypto-testmgr: Use common error handling code in drbg_cavs_test()
Message-Id: <b270d9f1-a508-b5c1-8f53-260f4deb6fde@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7c2b4df8-a04b-cacd-13ba-4d9afb346263@users.sourceforge.net>
 <7aa0ec0b-c00e-44c0-1c07-6bd87e2b6c47@users.sourceforge.net>
 <6795494.nv2bFMflat@tauon.chronox.de>
In-Reply-To: <6795494.nv2bFMflat@tauon.chronox.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?Stephan_M=c3=bcller?= <smueller@chronox.de>, linux-crypto@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Though, jumping back and forth like this with goto directives is something 
> that looks a bit strange. At least to my taste, may I suggest to have gotos 
> pointing only downwards and not up again? (Note, the same applies to the 
> ansi_cprng patch set).
> 
> What about something like following:
> 
> ...
>     memcmp
>     goto free_rng;

Do you find an additional jump really acceptable at such a source code place?


> report_failure:
>     <failure report>
> 
> free_rng:
>     <the deallocation code>

I am curious on how feedback will evolve also for the other design approach.

Regards,
Markus
