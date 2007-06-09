From: psr <pradeep.rautela@gmail.com>
Date: Sat, 09 Jun 2007 11:40:25 +0000
Subject: Re: [KJ] [HOWTO]using git to make a local clone?
Message-Id: <a901b49a0706090428m14b6272by8b8281921e120334@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
In-Reply-To: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi Andi,
On 6/9/07, Andi Drebes  wrote:
[snip]
>
> 1. Clone Linus' git repo (if not already done):
>     $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
>
> 2. cd to the directoy linux-2.6
>
> 3. Every release of the kernel is tagged in the git repo. If you run
>     $ git tag -l
>     v2.6.11
>     v2.6.11-tree
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
Oh... so its the tags we download first :-).Gee why didn't i find it
in all the tutorials ? :(

>
> And there you are. You have the 2.6.18 vanilla kernel in a repo.
> I hope I got you right.

Right i got you i guess.
I have a doubt now.
I have linux 2.6.18 vanilla kernel already downloaded days back.

What if i do just
$git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

Can i now use the already downloaded kernel src somehow instead of
pulling all the 100s of MBs of src from the kernel.org ?

Say i have it in /opt/linux-2.6.18
and i want to use this now after downloading the tags.

I hope i can do this?
I ll try something out.

Thanks
- --pradeep
>
> Cheers,
>         Andi
>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: http://firegpg.tuxfamily.org

iD8DBQFGao6uky6Gd9lpXlERAkCxAJ4mjRqnRR5zWYl66ZNfBv1wADFdewCdGenW
m8GVrLsQGXB3U5T/QHuVCp0=6Xxs
-----END PGP SIGNATURE-----
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
