From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 01 Aug 2012 00:33:23 +0000
Subject: Re: [nfsd:for-3.6 18/29] fs/lockd/host.c:603:21: warning: unused variable 'ln'
Message-Id: <20120801003323.GA7442@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120730230955.GB5838@localhost>
In-Reply-To: <20120730230955.GB5838@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 30, 2012 at 07:33:54PM -0400, J. Bruce Fields wrote:
> On Tue, Jul 31, 2012 at 07:09:55AM +0800, Fengguang Wu wrote:
> > Hi Stanislav,
> > 
> > There are new compile warnings show up in
> > 
> > tree:   git://git.linux-nfs.org/~bfields/linux.git for-3.6
> > head:   2c142baa7b237584bae7dc28630851701497e1ef
> > commit: caa4e76b6f284bab535a98fd37b9c46856158bcb [18/29] LockD: manage used host count per networks namespace
> > config: x86_64-randconfig-s012 (attached as .config)
> > 
> > All error/warnings:
> > 
> > fs/lockd/host.c: In function 'nlm_shutdown_hosts_net':
> > fs/lockd/host.c:603:21: warning: unused variable 'ln' [-Wunused-variable]
> > 
> > vim +603 fs/lockd/host.c
> >    600	
> >    601		/* complain if any hosts are left */
> >    602		if (net) {
> >  > 603			struct lockd_net *ln = net_generic(net, lockd_net_id);
> >    604	
> >    605			printk(KERN_WARNING "lockd: couldn't shutdown host module for net %p!\n", net);
> >    606			dprintk("lockd: %lu hosts left in net %p:\n", ln->nrhosts, net);
> 
> Probably ln is unused in the !RPC_DEBUG case.  Do we care?
> 
> The declaration could also go under #ifdef RPC_DEBUG, but that's ugly.
> 
> Is there some way to tell gcc to just ignore this?

Bruce, we may follow this example:

mm/memcontrol.c:                bool do_numainfo __maybe_unused;

Thanks,
Fengguang
