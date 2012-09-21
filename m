From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Sep 2012 08:44:58 +0000
Subject: Re: [userns:userns-always-map-user-v58 86/150] fs/ncpfs/inode.c:335 ncp_show_options() warn: if();
Message-Id: <20120921084458.GF4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120921082232.GA5132@localhost>
In-Reply-To: <20120921082232.GA5132@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 21, 2012 at 04:40:05PM +0800, Fengguang Wu wrote:
> On Fri, Sep 21, 2012 at 01:31:25AM -0700, Eric W. Biederman wrote:
> > Fengguang Wu <fengguang.wu@intel.com> writes:
> > 
> > > Hi Eric,
> > >
> > > FYI, there are new smatch warnings show up in
> > >
> > > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git userns-always-map-user-v58
> > > head:   cf7198a6b74906aa363a8507d6f9cbdf56e42dc1
> > > commit: 84ec77ea8a96e568f20bec4465c1fbde2c066cf8 [86/150] userns: Convert ncpfs to use kuid and kgid where appropriate
> > >
> > > All smatch warnings:
> > >
> > > + fs/ncpfs/inode.c:335 ncp_show_options() warn: if();
> > >   fs/ncpfs/inode.c:654 ncp_fill_super() Error invalid range 4096 to -1
> > 
> > Good catch.  Thanks.
> > 
> > Did you just start running smatch tests?  I haven't looked at ncpfs for
> > a long time.
> 
> Yes. :)  I don't quite get the old "invalid range 4096 to -1" warning,
> perhaps it's fine to just ignore it.
> 

Yes, yes.  This shouldn't be there in the latest Smatch.  (I thought
you were on that thread).  Let me know if it's still an issue.

regards,
dan carpenter

