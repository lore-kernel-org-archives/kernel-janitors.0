From: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 18 Oct 2006 14:38:23 +0000
Subject: Re: [KJ] git fetch of latest -mm
Message-Id: <20061018073823.ee25eaeb.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b53a56d0610171855qc6e2df5y92e963c142bb4ef8@mail.gmail.com>
In-Reply-To: <9b53a56d0610171855qc6e2df5y92e963c142bb4ef8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 18 Oct 2006 06:07:39 -0400 Chris Smith wrote:

> On 10/18/06, Domen Puncer <domen@coderock.org> wrote:
> > On 17/10/06 21:55 -0400, Chris Smith wrote:
> > > Hello,
> > >  Using the boilerplate command from the Andrew Morton announcement,
> > > git fetch git://git.kernel.org/pub/scm/linux/kernel/git/smurf/linux-trees.git
> > > v2.6.16-rc2-mm1
> >
> > s/16/19/ ?
> >
> >
> >         Domen
> 
> All that s/16/19/ (appears) to do is alter the name of the directory produced.
> #cd checkout
> #cat .kernelversion
> #v2.6.16-rc2-mm1
> 
> Tried the git-fsck, and it complained about HEAD not being kosher.
> My thought is that there may have been git changes subseqent to that
> 'smurf' tree creation that rendered it b0rk3n, but I dunno.

Are you using a recent version of git?

The tree appears ok via the web interface at
http://www.kernel.org/git/?p=linux/kernel/git/smurf/linux-trees.git;a=summary
(see under "heads" or "tags").


---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
