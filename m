From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Date: Fri, 06 Jul 2012 11:58:14 +0000
Subject: RE: [infiniband:for-next 13/14] drivers/infiniband/hw/qib/qib_keys.c:64:23: sparse: incompatible typ
Message-Id: <32E1700B9017364D9B60AED9960492BC0D4715F8@FMSMSX108.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120706080229.GB28650@localhost>
In-Reply-To: <20120706080229.GB28650@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I'm not seeing this on either of my build test systems.

Can you provide your .config file and gcc version?

Mike

> -----Original Message-----
> From: wfg@linux.intel.com [mailto:wfg@linux.intel.com]
> Sent: Friday, July 06, 2012 4:02 AM
> To: Marciniszyn, Mike
> Cc: kernel-janitors@vger.kernel.org
> Subject: [infiniband:for-next 13/14]
> drivers/infiniband/hw/qib/qib_keys.c:64:23: sparse: incompatible types in
> comparison expression (different address spaces)
> 
> Hi Mike,
> 
> There are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/roland/infiniband.git for-
> next
> head:   04c83d3ce5bbb85f81744b51104522f657fd4ecf
> commit: e12deda1747e1cc479ea219c5907fd92d0158566 [13/14] IB/qib: RCU
> locking for MR validation
> 
> All sparse warnings:
> 
> + drivers/infiniband/hw/qib/qib_keys.c:64:23: sparse: incompatible types in
> comparison expression (different address spaces)
>   drivers/infiniband/hw/qib/qib_keys.c:168:22: sparse: incompatible types in
> comparison expression (different address spaces)
>   drivers/infiniband/hw/qib/qib_keys.c:183:14: sparse: incompatible types in
> comparison expression (different address spaces)
>   drivers/infiniband/hw/qib/qib_keys.c:266:22: sparse: incompatible types in
> comparison expression (different address spaces)
>   drivers/infiniband/hw/qib/qib_keys.c:282:14: sparse: incompatible types in
> comparison expression (different address spaces)
>   drivers/infiniband/hw/qib/qib_verbs.c:2010:9: sparse: incorrect type in
> assignment (different address spaces)
>   drivers/infiniband/hw/qib/qib_verbs.c:2010:9:    expected struct qib_qp
> *qp0
>   drivers/infiniband/hw/qib/qib_verbs.c:2010:9:    got void [noderef]
> <asn:4>*<noident>
>   drivers/infiniband/hw/qib/qib_verbs.c:2011:9: sparse: incorrect type in
> assignment (different address spaces)
>   drivers/infiniband/hw/qib/qib_verbs.c:2011:9:    expected struct qib_qp
> *qp1
>   drivers/infiniband/hw/qib/qib_verbs.c:2011:9:    got void [noderef]
> <asn:4>*<noident>
>   drivers/infiniband/hw/qib/qib_verbs.c:2036:17: sparse: incorrect type in
> assignment (different address spaces)
>   drivers/infiniband/hw/qib/qib_verbs.c:2036:17:    expected struct qib_qp
> *<noident>
>   drivers/infiniband/hw/qib/qib_verbs.c:2036:17:    got void [noderef]
> <asn:4>*<noident>
>   drivers/infiniband/hw/qib/qib_verbs.c:2069:9: sparse: incorrect type in
> assignment (different address spaces)
>   drivers/infiniband/hw/qib/qib_verbs.c:2069:9:    expected struct
> qib_mregion *dma_mr
>   drivers/infiniband/hw/qib/qib_verbs.c:2069:9:    got void [noderef]
> <asn:4>*<noident>
>   drivers/infiniband/hw/qib/qib_verbs.c:2071:17: sparse: incorrect type in
> assignment (different address spaces)
>   drivers/infiniband/hw/qib/qib_verbs.c:2071:17:    expected struct
> qib_mregion *<noident>
>   drivers/infiniband/hw/qib/qib_verbs.c:2071:17:    got void [noderef]
> <asn:4>*<noident>
> 
> vim +64 drivers/infiniband/hw/qib/qib_keys.c
>     61		if (dma_region) {
>     62			struct qib_mregion *tmr;
>     63
>   > 64			tmr = rcu_dereference(dev->dma_mr);
>     65			if (!tmr) {
>     66				qib_get_mr(mr);
>     67				rcu_assign_pointer(dev->dma_mr, mr);
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
