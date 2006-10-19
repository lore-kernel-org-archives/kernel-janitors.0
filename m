From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 19 Oct 2006 03:03:26 +0000
Subject: Re: [KJ] git fetch of latest -mm
Message-Id: <20061018200326.a7d49956.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b53a56d0610171855qc6e2df5y92e963c142bb4ef8@mail.gmail.com>
In-Reply-To: <9b53a56d0610171855qc6e2df5y92e963c142bb4ef8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 18 Oct 2006 21:48:14 -0400 Chris Smith wrote:

> On 10/18/06, Randy Dunlap <rdunlap@xenotime.net> wrote:
> > On Wed, 18 Oct 2006 06:07:39 -0400 Chris Smith wrote:
> >
> > > On 10/18/06, Domen Puncer <domen@coderock.org> wrote:
> > > > On 17/10/06 21:55 -0400, Chris Smith wrote:
> > > > > Hello,
> > > > >  Using the boilerplate command from the Andrew Morton announcement,
> > > > > git fetch git://git.kernel.org/pub/scm/linux/kernel/git/smurf/linux-trees.git
> > > > > v2.6.16-rc2-mm1
> > > >
> > > > s/16/19/ ?
> > > >
> > > >
> > > >         Domen
> > >
> > > All that s/16/19/ (appears) to do is alter the name of the directory produced.
> > > #cd checkout
> > > #cat .kernelversion
> > > #v2.6.16-rc2-mm1
> > >
> > > Tried the git-fsck, and it complained about HEAD not being kosher.
> > > My thought is that there may have been git changes subseqent to that
> > > 'smurf' tree creation that rendered it b0rk3n, but I dunno.
> >
> > Are you using a recent version of git?
> >
> > The tree appears ok via the web interface at
> > http://www.kernel.org/git/?p=linux/kernel/git/smurf/linux-trees.git;a=summary
> > (see under "heads" or "tags").
> >
> >
> A transcript:
> 
> cd /smitty1e/kernel
> #git --version
> git version 1.4.2.4
> #git init-db
> #git fetch git://git.kernel.org/pub/scm/linux/kernel/git/smurf/linux-trees.git
> v2.6.19-rc2-mm1
> warning: no common commits
> remote: Generating pack...
> remote: Done counting 357392 objects.
> remote: Deltifying 357392 objects.
> remote:  100% (357392/357392) done
> Unpacking 357392 objects
> remote: Total 357392, written 357392 (delta 281610), reused 353856
> (delta 279864)
>  100% (357392/357392) done
> #git checkout master
> fatal: ambiguous argument 'HEAD': unknown revision or path not in the
> working tree.
> Use '--' to separate paths from revisions
> git-checkout-index: master is not in the cache
> # cat .git/HEAD
> ref: refs/heads/master
> 
> I guess I'm not understanding how exactly to check this thing out. :/
> Doing a clone instead of a fetch seems to give me
> http://www.kernel.org/git/?p=linux/kernel/git/smurf/linux-trees.git;a=tree
> Given a decent recipe, I'm thinking this would be helpful on  kernelnewbies.org.

Hm, I try to use git as little as possible.  Anyway, I cloned
the linux-trees.git and mucked around with it a bit (and it was
frustrating).  I finally got v2.6.19-rc2-mm1 by doing this:

git checkout -f v2.6.19-rc2-mm1

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
