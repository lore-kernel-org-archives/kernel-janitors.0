From: psr <pradeep.rautela@gmail.com>
Date: Sat, 09 Jun 2007 12:07:19 +0000
Subject: Re: [KJ] [HOWTO]using git to make a local clone?
Message-Id: <a901b49a0706090455g547381d2gb6d8353078e98203@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
In-Reply-To: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andi,
[snip]
>
> 3. Every release of the kernel is tagged in the git repo. If you run
>     $ git tag -l
>     v2.6.11
>     v2.6.11-tree
I 'll keep this short and sweet.Since i was unable to download the
tags.I created one for mine downloaded tree using git-tag.
I was able to make one and git-tag -l showed the tag i just made.
I did a git branch kernel-src-2.6.18 v2.6.18 [my tag name is v2.6.18]
And then a git checkout kernel-src-tree

All fine and good.
Now what?
I am still standing in the vanilla tree :-(

I want to make a new dir kernel-src-tree and work there.

What did i miss here now?

thanks
--pradeep
>     ....
>     v2.6.21
>     v2.6.21-rc1
>     v2.6.21-rc2
>     v2.6.21-rc3
>     v2.6.21-rc4
>     v2.6.21-rc5
>     v2.6.21-rc6
>     v2.6.21-rc7
>     v2.6.22-rc1
>     v2.6.22-rc2
>     v2.6.22-rc3
>     v2.6.22-rc4
>     Then you se all the tags in the current branch. As you've just
>     cloned Linus' repo, you will see all the kernel releases. The releases'
>     tags are prefix with the character 'v'.
>
> 4. Now you want to get the 2.6.18 stable release. You also want to have
>     a new branch for you. To do both in a single step, run
>     $ git branch mybranch v2.6.18
>
> 5. Finally, you want to checkout your new branch to work in it.
>     $ git checkout mybranch
>
> And there you are. You have the 2.6.18 vanilla kernel in a repo.
> I hope I got you right.
>
> Cheers,
>         Andi
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
