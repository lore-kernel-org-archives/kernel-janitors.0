From: David Miller <davem@davemloft.net>
Date: Sun, 09 Jun 2019 20:38:07 +0000
Subject: Re: [PATCH v2 next] nexthop: off by one in nexthop_mpath_select()
Message-Id: <20190609.133807.1807112771773489916.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0e02a744-f28e-e206-032b-a0ffac9f7311@gmail.com>
        <20190607153107.GS31203@kadam>
In-Reply-To: <20190607153107.GS31203@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: dsahern@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 7 Jun 2019 18:31:07 +0300

> The nhg->nh_entries[] array is allocated in nexthop_grp_alloc() and it
> has nhg->num_nh elements so this check should be >= instead of >.
> 
> Fixes: 430a049190de ("nexthop: Add support for nexthop groups")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: David Ahern <dsahern@gmail.com>
> ---
> v2: Use the correct Fixes tag

Applied, thanks Dan.
