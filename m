From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Sep 2012 15:10:15 +0000
Subject: Re: [digsig:working 47/64] security/integrity/digsig.c:74:1: warning: 'shash_digest' uses dynamic st
Message-Id: <20120913151015.GO19396@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120913144807.GA2562@localhost>
In-Reply-To: <20120913144807.GA2562@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 13, 2012 at 10:48:07PM +0800, Fengguang Wu wrote:
> Hi Dmitry,
> 
> I'm not sure if the warned 'dynamic stack allocation' is relevant, but
> as an FYI:
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/kasatkin/linux-digsig.git working
> head:   ca88a6aa648a167b6f8e5666518249635510b0b0
> commit: c6a28f9ee92fe96c5a7c4e5989eb7ae06b545469 [47/64] integrity: added digest calculation function
> config: s390-allyesconfig
> 
> All error/warnings:
> 
> security/integrity/digsig.c: In function 'shash_digest':
> security/integrity/digsig.c:74:1: warning: 'shash_digest' uses dynamic stack allocation [enabled by default]
> 
> vim +74 security/integrity/digsig.c
>     64			char ctx[crypto_shash_descsize(tfm)];
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
Where it wouldn't be relavent is if the size of the can be made to
overflow the 8k kernel's stack.  We've seen places where this could
be controlled by the user before.

Also it's not ok inside a for loop.  On some arches the dynamic
allocations aren't freed at the end of the loop, only at the end
of the function.  So inside a for loop the stack keeps getting
bigger and bigger until it overflows the 8k stack.  (Doesn't happen
on x86).

regards,
dan carpenter

