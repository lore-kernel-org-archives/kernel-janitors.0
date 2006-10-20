From: "Chris Smith" <smitty1elkml@gmail.com>
Date: Fri, 20 Oct 2006 20:29:51 +0000
Subject: Re: [KJ] git fetch of latest -mm
Message-Id: <9b53a56d0610201329r2ad65426p5279844c9f27dbef@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b53a56d0610171855qc6e2df5y92e963c142bb4ef8@mail.gmail.com>
In-Reply-To: <9b53a56d0610171855qc6e2df5y92e963c142bb4ef8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/18/06, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On Wed, 18 Oct 2006 06:07:39 -0400 Chris Smith wrote:
>
> > On 10/18/06, Domen Puncer <domen@coderock.org> wrote:
> > > On 17/10/06 21:55 -0400, Chris Smith wrote:
> > > > Hello,
> > > >  Using the boilerplate command from the Andrew Morton announcement,
> > > > git fetch git://git.kernel.org/pub/scm/linux/kernel/git/smurf/linux-trees.git
> > > > v2.6.16-rc2-mm1
> > >
> > > s/16/19/ ?
> > >
> > >
> > >         Domen
> >
> > All that s/16/19/ (appears) to do is alter the name of the directory produced.
> > #cd checkout
> > #cat .kernelversion
> > #v2.6.16-rc2-mm1
> >
> > Tried the git-fsck, and it complained about HEAD not being kosher.
> > My thought is that there may have been git changes subseqent to that
> > 'smurf' tree creation that rendered it b0rk3n, but I dunno.
>
> Are you using a recent version of git?
>
> The tree appears ok via the web interface at
> http://www.kernel.org/git/?p=linux/kernel/git/smurf/linux-trees.git;a=summary
> (see under "heads" or "tags").
>
>
> ---
> ~Randy
>
Futher assistance from jdl on #git gave me a proper:
git checkout -b MyBranch v2.6.19-rc2-mm2
which gets past the stale 'master' in the repository cloning.

-- 
Christopher Smith
Pursuer of knowledge
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
