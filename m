From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 02 Jul 2010 13:52:50 +0000
Subject: Re: [PATCH 1/7] Add a target to use the Coccinelle checker
Message-Id: <20100702135247.GA18690@shinshilla>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275837307-4283-1-git-send-email-npalix@diku.dk>
 <1275837307-4283-2-git-send-email-npalix@diku.dk>
 <20100630185851.GA17502@shinshilla>
 <201006302352.34594.npalix@diku.dk>
In-Reply-To: <201006302352.34594.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>, =?iso-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>, Andy Isaacson <adi@hexapodia.org>, Linus Torvalds <torvalds@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, walter harms <wharms@bfs.de>, Joerg Roedel <joro@8bytes.org>, Jan Engelhardt <jengelh@medozas.de>

On Wed, Jun 30, 2010 at 23:52 +0200, Nicolas Palix wrote:
> On Wednesday 30 June 2010 20:58:54 Kulikov Vasiliy wrote:
> > > +if [ "$COCCI" = "" ] ; then
> > > +    for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
> > > +	coccinelle $f $srctree;
> > > +    done
> > > +else
> > > +    coccinelle $COCCI $srctree
> > > +fi
> > 
> > I think it is more usefull to use $M instead of $srctree to run simple
> > 'make coccicheck'.
> 
> What is the purpose of $M ?
> 
> I submitted an incremental patch to add support for $C.

From root Makefile:
# Use make M=dir to specify directory of external module to build
# Old syntax make ... SUBDIRS=$PWD is still supported
# Setting the environment variable KBUILD_EXTMOD take precedence

So, I compile all local modules as smth like
make -C ../../.. M=$PWD CONFIG_SMTH=m modules

If coccinelle is started as 'coccinelle $COCCI $M' then it checks only in
directory tree with $M root.
