From: Boaz Harrosh <bharrosh@panasas.com>
Date: Tue, 15 May 2012 16:06:36 +0000
Subject: Re: [patch] NFS: kmalloc() doesn't return an ERR_PTR()
Message-Id: <4FB27F0C.30306@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120514194528.GA19613@elgon.mountain> <4FB25EA7.9050702@panasas.com> <20120515135733.GJ16984@mwanda> <4FB2659C.5090005@panasas.com> <20120515152735.GA11230@umich.edu>
In-Reply-To: <20120515152735.GA11230@umich.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Rees <rees@umich.edu>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Trond Myklebust <Trond.Myklebust@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/15/2012 06:27 PM, Jim Rees wrote:

> Boaz Harrosh wrote:
> 
>   > Normally we wouldn't put an unlikely() here.  It makes the code
>   > less readable and it's not going to affect benchmarks.  But I can
>   > add one if people prefer.
>   > 
> 
>   Personally It makes it more readable for me. It's like a statement:
>   "error, always slow-path case here". I have brain parsers set
>   for these.
> 
> Personally I don't like it.  It's a hint for the compiler.  Remember when
> code was liberally sprinkled with "register" modifiers on local variables?
> Turned out the compiler was smarter than we were, and those modifiers were
> hurting performance.  I'd rather let the compiler decide how to optimize.


Actually the compiler cannot. This is specifying: 
  "against all judgment I consider this path as the cold path, even if it is
   taken more times or generates less compact code. Remove this branch from
   branch prediction permanently, and never pre-fetch this path"

Again for me it's a programming style programmer-to-programmer hint. And is
very unlike "register".

The Kernel style does use unlikely() extensively in error paths, so it's not
only me. I'm not sure what the official stance is though.

I agree that it's all just shop talk ;-)

Thanks
Boaz
