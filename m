From: David Miller <davem@davemloft.net>
Date: Mon, 21 Sep 2020 20:55:44 +0000
Subject: Re: [PATCH net] sfc: Fix error code in probe
Message-Id: <20200921.135544.1339982326191078648.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918143311.GD909725@mwanda>
In-Reply-To: <20200918143311.GD909725@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, mhabets@solarflare.com, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Sep 2020 17:33:11 +0300

> This failure path should return a negative error code but it currently
> returns success.
> 
> Fixes: 51b35a454efd ("sfc: skeleton EF100 PF driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
