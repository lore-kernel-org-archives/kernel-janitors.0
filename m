From: Francois Romieu <romieu@fr.zoreil.com>
Date: Sat, 19 May 2007 18:43:46 +0000
Subject: Re: [KJ] how to add a new file to a patch?
Message-Id: <20070519184346.GA11465@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705191332540.12829@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705191332540.12829@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day <rpjday@mindspring.com> :
> 
>   i'm embarrassed to admit i don't know how to do this, and i've tried
> a few things with no success.  how do i
> 
> 1) create a patch that incorporates a brand new file?  i've tried to
> "git add" the file but it doesn't show up in the subsequent "git diff"
> as part of the patch.

git diff --cached

> 2) once i've created and submitted that patch, how do i properly
> remove that file and any memory of it in my local git repo?

Don't :o)

Use an alternate repository, repack it every few thousand patches and
drop it in a few years. See git-clone (1) for some information regarding
alternate repository.

-- 
Ueimor
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
