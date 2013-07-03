From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jul 2013 07:28:48 +0000
Subject: Re: Tips for a Newcomer
Message-Id: <20130703072848.GB22937@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51D0A0D7.4070408@gmail.com>
In-Reply-To: <51D0A0D7.4070408@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jun 30, 2013 at 05:19:19PM -0400, Logan Blyth wrote:
> Hello list,
> 
> I am looking for some tips on starting as a kernel janitor, and I
> was hoping to find out the general work flow that people use. From
> what I can tell, we search through the kernel-next git repo, then
> either by grep, ctags, or some other method?

I use cscope with vim.  There is a "make cscope" build target.

> We are looking for
> things in the KernelJanitors/Todo, possibly stuff turned up by
> sparse? Maybe a different static analyser like from clang?

Yeah.  That's a lot of it.  I don't think anyone is doing clang so
you could find some unique bugs that way.  Do you know how to get
clang working for the kernel?

> 
> From there we make sure the patch applys cleanly and mail the
> maintainer, copying the LKML and Kernel-Janitors?

Yep.  Use scripts/get_maintainer.pl.  Send your first patch to
kernel janitors without CC'd the maintainer so we can check it for
you.

regards,
dan carpenter

