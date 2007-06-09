From: Andi Drebes <lists-receive@programmierforen.de>
Date: Sat, 09 Jun 2007 10:19:33 +0000
Subject: Re: [KJ] [HOWTO]using git to make a local clone?
Message-Id: <200706091219.34352.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
In-Reply-To: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> How can i use git to make a clone of a local kernel src tree?
> e.g i want base repo to be my downloaded vanilla kernel 2.6.18.
> How can i use git to make this as master, i clone the 2.6.18 src from
> my disk to my working directory , modify the kernel ,ass files etc and
> then merge with the 2.6.18 src base master which i downloaded.
> 
> I am facing trouble fixing this.
> All tutorials ask to pull from Linus's latest src tree which i dont
> need right now.
If you don't need the latest version of the kernel, it doesn't mean that
you don't need Linus' git repo. If you want a specific version of the kernel,
do the following:

1. Clone Linus' git repo (if not already done):
    $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

2. cd to the directoy linux-2.6

3. Every release of the kernel is tagged in the git repo. If you run
    $ git tag -l
    v2.6.11
    v2.6.11-tree
    ....
    v2.6.21
    v2.6.21-rc1
    v2.6.21-rc2
    v2.6.21-rc3
    v2.6.21-rc4
    v2.6.21-rc5
    v2.6.21-rc6
    v2.6.21-rc7
    v2.6.22-rc1
    v2.6.22-rc2
    v2.6.22-rc3
    v2.6.22-rc4
    Then you se all the tags in the current branch. As you've just
    cloned Linus' repo, you will see all the kernel releases. The releases'
    tags are prefix with the character 'v'.

4. Now you want to get the 2.6.18 stable release. You also want to have
    a new branch for you. To do both in a single step, run
    $ git branch mybranch v2.6.18

5. Finally, you want to checkout your new branch to work in it.
    $ git checkout mybranch

And there you are. You have the 2.6.18 vanilla kernel in a repo.
I hope I got you right.

Cheers,
	Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
