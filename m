From: Jim Rees <rees@umich.edu>
Date: Tue, 15 May 2012 15:27:35 +0000
Subject: Re: [patch] NFS: kmalloc() doesn't return an ERR_PTR()
Message-Id: <20120515152735.GA11230@umich.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120514194528.GA19613@elgon.mountain>
 <4FB25EA7.9050702@panasas.com>
 <20120515135733.GJ16984@mwanda>
 <4FB2659C.5090005@panasas.com>
In-Reply-To: <4FB2659C.5090005@panasas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Trond Myklebust <Trond.Myklebust@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Boaz Harrosh wrote:

  > Normally we wouldn't put an unlikely() here.  It makes the code
  > less readable and it's not going to affect benchmarks.  But I can
  > add one if people prefer.
  > 

  Personally It makes it more readable for me. It's like a statement:
  "error, always slow-path case here". I have brain parsers set
  for these.

Personally I don't like it.  It's a hint for the compiler.  Remember when
code was liberally sprinkled with "register" modifiers on local variables?
Turned out the compiler was smarter than we were, and those modifiers were
hurting performance.  I'd rather let the compiler decide how to optimize.
