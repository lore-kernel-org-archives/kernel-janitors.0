From: Cripps <acripps@gmail.com>
Date: Fri, 25 May 2007 20:06:55 +0000
Subject: Re: [KJ] looking for a project? (ARRAY_SIZE)
Message-Id: <c6711b6b0705251306y1bd40ae5u4604febb8ecbc477@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705250636220.11199@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705250636220.11199@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> OK. I think I can prepare my patches ("what I've got so far") tomorrow and
> send them directly to the mailing list. How do you propose the patches should
> be organized? One subdirectory of drivers per patch? One per module? Things
> might end up in too many patches or big patches that don't affect the same
> subsystem...
> OK.
>
>         Cheers,
>                 Andi

That would depend on filesize, I suppose. If a file has multiple
replacements/fixes then
you'll probably want to submit multiple patches per directory . If one
directory, say, has 100-200 lines for a patchfile, I'd say submit one
patch per directory, else submit per file. Just remember to follow the
conventions listed here:
http://kernelnewbies.org/UpstreamMerge/MergingStrategy

cheers,
-Aaron Cripps
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
