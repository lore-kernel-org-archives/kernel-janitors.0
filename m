From: David Miller <davem@davemloft.net>
Date: Tue, 18 Sep 2018 01:50:58 +0000
Subject: Re: [PATCH] net: caif: remove redundant null check on frontpkt
Message-Id: <20180917.185058.178327866298767220.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180914171916.21298-1-colin.king@canonical.com>
In-Reply-To: <20180914171916.21298-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dmitry.tarnyagin@lockless.no, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Sep 2018 18:19:16 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> It is impossible for frontpkt to be null at the point of the null
> check because it has been assigned from rearpkt and there is no
> way realpkt can be null at the point of the assignment because
> of the sanity checking and exit paths taken previously. Remove
> the redundant null check.
> 
> Detected by CoverityScan, CID#114434 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Appied to net-next with typo fixed.

Thanks.
