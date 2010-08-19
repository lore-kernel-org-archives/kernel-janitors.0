From: Ron Mercer <ron.mercer@qlogic.com>
Date: Thu, 19 Aug 2010 20:28:36 +0000
Subject: Re: [patch v2] qlge: pull NULL check ahead of dereference
Message-Id: <20100819202836.GD17233@linux-ox1b.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100819100214.GB6674@bicker> <20100819121942.GA14895@linux-ox1b.qlogic.org> <20100819125933.GB14895@linux-ox1b.qlogic.org> <20100819185244.GD6674@bicker>
In-Reply-To: <20100819185244.GD6674@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Linux Driver <Linux-Driver@qlogic.com>, "David S. Miller" <davem@davemloft.net>, Breno Leitao <leitao@linux.vnet.ibm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Aug 19, 2010 at 11:52:44AM -0700, Dan Carpenter wrote:
> There was a dereference before NULL check issue introduced in 1e213303d
> "qlge: Add tx multiqueue support."  I've pulled the NULL check of
> "net_rsp" forward a couple lines to avoid that.
> 
> Also Ron Mercer says that the early exit should be above the index
> write.  ql_write_cq_idx(rx_ring);
> 

Signed-off-by: Ron Mercer <ron.mercer@qlogic.com>
