From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jan 2020 15:17:16 +0000
Subject: Re: [bug report] netdevsim: fib: Add dummy implementation for FIB offload
Message-Id: <20200120151716.GL19765@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200120143712.wzgjjpwuvrtbioef@kili.mountain>
In-Reply-To: <20200120143712.wzgjjpwuvrtbioef@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 20, 2020 at 02:43:45PM +0000, Ido Schimmel wrote:
> On Mon, Jan 20, 2020 at 05:37:12PM +0300, Dan Carpenter wrote:
> > Hello Ido Schimmel,
> > 
> > The patch 48bb9eb47b27: "netdevsim: fib: Add dummy implementation for
> > FIB offload" from Jan 14, 2020, leads to the following static checker
> > warning:
> > 
> > 	drivers/net/netdevsim/fib.c:663 nsim_fib6_rt_insert()
> > 	error: 'fib6_rt' dereferencing possible ERR_PTR()
> > 
> > drivers/net/netdevsim/fib.c
> >    460  nsim_fib6_rt_create(struct nsim_fib_data *data,
> >    461                      struct fib6_entry_notifier_info *fen6_info)
> >    462  {
> >    463          struct fib6_info *iter, *rt = fen6_info->rt;
> >    464          struct nsim_fib6_rt *fib6_rt;
> >    465          int i = 0;
> >    466          int err;
> >    467  
> >    468          fib6_rt = kzalloc(sizeof(*fib6_rt), GFP_ATOMIC);
> >    469          if (!fib6_rt)
> >    470                  return NULL;
> >                         ^^^^^^^^^^^
> 
> Dan, thank you very much for the report. It is already fixed in net-next
> thanks to Eric Dumazet:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?idAcdc741048b0d04604c02aad9ec19f7d9130b70
> 
> Can you share the static checker you used so I can avoid these mistakes
> in the future? Alternatively, is it possible to register development
> trees for this service like with the kbuild robot?
> 
> Thanks in advance.

It's a Smatch warning but you need to rebuild the kernel data.

~/path/to/smatch/smatch_scripts/build_kernel_data.sh

It takes a few hours (maybe four) to rebuild.

regards,
dan carpenter
