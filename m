From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 15 Aug 2006 23:22:02 +0000
Subject: Re: [KJ] New to Kernel Work - Need Direction
Message-Id: <20060815232202.GD27227@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200608151531.40914.lordsauronthegreat@gmail.com>
In-Reply-To: <200608151531.40914.lordsauronthegreat@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 15.08.2006 [15:31:17 -0700], Lord Sauron wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hello,
> 
> I'm really new to kernel work.  I've spent some time looking at the
> kernel sources and things, and decided that it'd be a good idea to try
> and do some work with Kernel Janitors rather than try and jump in and
> code up something new.

Welcome.

> First I need something to do.  I looked at the current to-do list and
> decided that convincing the XFS folks to use negative error codes
> couldn't be terribly difficult.  I'm thinking of making the
> modifications to the code myself (assuming I'm correct in thinking
> that the XFS code is in fs/xfs in the source directory).

The XFS folks can be hard to work with :) Sometimes. It may be worth
trying to update their code again, but check the archives to see if
anyone has tried before and been summarily rejected (there may be a
legitimate reason I don't know of).

The XFS code is in fs/xfs, you are correct.

> My second question is about development environments.  I like
> KDevelop, and wish to use it to work on the kernel.  Does anyone have
> any tips or suggestions for a good graphical way to work with the
> Kernel?

Don't? :) I mostly use $text_editor (vim, emacs, etc.) and that's it.
cscope and lxr are good code reference tools, as is grep (or cgvg, if
you prefer a bit more organized grep experienced).

I'm not sure you *need* a graphical way to work with the kernel, even if
that's what you're used to.

> I'd rather not try and bludgeon my way through it with KATE and
> writing makefiles and caveman debugging and the likes of that,
> however, the kernel is a gigantic code base, and I'm not sure how to
> approach organizing it in a manner which is good for the total and
> complete newbie (me).

Uhh, if you end up needing to write a Makefile for janitorial work,
you're probably doing something wrong :) Not sure what "caveman
debugging" exactly is, but most janitor stuff is cleanup, not bugfixing,
although sometimes they are closely related. If you want to fix bugs,
get an account at bugzilla.kernel.org and help out :) In that case,
though, expertise is useful, more often than not.

I'm not sure what you need to be organizing in the code base. It's
already *highly* organized...

> Thanks for your time, and please tell me if this isn't the appropriate
> place to start with getting to know and work on the kernel.

While it may not be explicitly be the former, it certainly covers the
latter. I also recommend sitting on #kernelnewbies and/or #kerneljanitor
on OFTC.

Thanks,
Nish

> - -- Lord Sauron

P.S. A *big* part of kernel development is trust. Trust starts with
using your real name :)

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
