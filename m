From: psr <pradeep.rautela@gmail.com>
Date: Sat, 09 Jun 2007 13:58:16 +0000
Subject: Re: [KJ] [HOWTO]using git to make a local clone?
Message-Id: <a901b49a0706090646l32a97aa4i6583f713c43c0e49@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
In-Reply-To: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Rene and Andy,

Thanks a lot.
I figured it out while expermenting around with git:-).

Now i since i have done this i have posted the results on my blog.

These are the steps i followed.
generate the tag locally if you cannot download one. In fact its not
compulsion to downlaod tags to start with i guess.They are important
if you want to keep up with latest linux tree though.

I did :-

$ git add .
$ git commit
$ git tag -f v2.6.xyz-mine
$ git tag -l
$ git branch devel-branch v2.6.xyz-mine
$ git checkout devel-branch
$ git branch

and i am done. No need to donwload any tags or 300MB of src. Just
generate tag locally and yay...

Thanks Rene, Thanks Andy.

Cheers
- --pradeep

[ http://psrautela.blogspot.com ]

On 6/9/07, Rene Herman  wrote:
> On 06/09/2007 02:51 PM, Rene Herman wrote:
>
> > Specifically, you're really best of ignoring all the stuff above about
> > setting up that local repo and just clone the master linux repo. You
> > need to do that only once and afterwards, you can just merrily update
> > through simple "git pull" commands. So, I'd suggest:
> >
> > $ cd ~/src
> > $ git clone -n
> > git://git2.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git linus
>
> Just saw you posting proxy information -- the only thing that should change
> is replacing this GIT url with:
>
> http://www.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
>
> Rene.
>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: http://firegpg.tuxfamily.org

iD8DBQFGaq79ky6Gd9lpXlERApS3AJ0RhbjNTdxRm2dc99YyTRBD/1+RFgCfUix0
et4MJV8z5LoUhBY/gUy8OGM=R9/e
-----END PGP SIGNATURE-----
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
