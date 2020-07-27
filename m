From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2020 12:40:23 +0000
Subject: Re: [bug report] qed: sanitize PBL chains allocation
Message-Id: <20200727124022.GZ2571@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727103210.GA375660@mwanda>
In-Reply-To: <20200727103210.GA375660@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 27, 2020 at 02:21:17PM +0300, Alexander Lobakin wrote:
> Data: Mon, 27 Jul 2020 13:32:00 +0300
> From: Dan Carpenter <dan.carpenter@oracle.com>
> 
> > Hello Alexander Lobakin,
> 
> Hi Dan!
> 
> > The patch 9b6ee3cf95d3: "qed: sanitize PBL chains allocation" from Jul 23, 2020, leads to the following 
> > static checker warning:
> > 
> > 	drivers/net/ethernet/qlogic/qed/qed_chain.c:299 qed_chain_alloc_pbl()
> > 	error: uninitialized symbol 'pbl_virt'.
> 
> Oh Gosh, how could I miss that with W=1 C=1.

It's a bug in GCC.  It initializes it to zero instead of complaining.
It seems to have gotten worse in recent months...

regards,
dan carpenter
