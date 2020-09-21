From: Edward Cree <ecree@solarflare.com>
Date: Mon, 21 Sep 2020 11:09:00 +0000
Subject: Re: [PATCH net] sfc: Fix error code in probe
Message-Id: <a65bcb6c-a0a0-eb9d-82f0-766cfb3fbc13@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918143311.GD909725@mwanda>
In-Reply-To: <20200918143311.GD909725@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Solarflare linux maintainers <linux-net-drivers@solarflare.com>
Cc: Martin Habets <mhabets@solarflare.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 18/09/2020 15:33, Dan Carpenter wrote:
> This failure path should return a negative error code but it currently
> returns success.
>
> Fixes: 51b35a454efd ("sfc: skeleton EF100 PF driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Edward Cree <ecree@solarflare.com>
Thanks for catching this.
