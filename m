From: Ron Mercer <ron.mercer@qlogic.com>
Date: Thu, 19 Aug 2010 12:59:33 +0000
Subject: Re: [patch] qlge: pull NULL check ahead of dereference
Message-Id: <20100819125933.GB14895@linux-ox1b.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100819100214.GB6674@bicker> <20100819121942.GA14895@linux-ox1b.qlogic.org>
In-Reply-To: <20100819121942.GA14895@linux-ox1b.qlogic.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Linux Driver <Linux-Driver@qlogic.com>, "David S. Miller" <davem@davemloft.net>, Breno Leitao <leitao@linux.vnet.ibm.com>, netdev@vger.kernel.org

On Thu, Aug 19, 2010 at 05:19:42AM -0700, Ron Mercer wrote:
> On Thu, Aug 19, 2010 at 03:02:15AM -0700, Dan Carpenter wrote:
> > There was a dereference before NULL check issue introduced in 1e213303d
> > "qlge: Add tx multiqueue support."  I've pulled the NULL check of
> > "net_rsp" forward a couple lines to restore the original semantics.
> >
> 
> net_rsp is initialized to NULL and will never be NULL if entries are
> processed.  It should be fine as it is currently coded.
>

On second thought you are right but the early exit should be above the index
write.

	ql_write_cq_idx(rx_ring);

