From: David Miller <davem@davemloft.net>
Date: Mon, 01 Jun 2020 18:33:51 +0000
Subject: Re: [PATCH net-next] cxgb4: cleanup error code in setup_sge_queues_uld()
Message-Id: <20200601.113351.412390872566987442.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528124957.GD1219412@mwanda>
In-Reply-To: <20200528124957.GD1219412@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: vishal@chelsio.com, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 May 2020 15:49:57 +0300

> The caller doesn't care about the error codes, they only check for zero
> vs non-zero.  Still, it's better to preserve the negative error codes
> from alloc_uld_rxqs() instead of changing it to 1.  We can also return
> directly if there is a failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
