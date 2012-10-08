From: David Miller <davem@davemloft.net>
Date: Mon, 08 Oct 2012 07:13:48 +0000
Subject: Re: [patch] cxgb4: allocate enough data in t4_memory_rw()
Message-Id: <20121008.031348.53161105562769133.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121008071210.GA17400@elgon.mountain>
In-Reply-To: <20121008071210.GA17400@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: dm@chelsio.com, vipul@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 8 Oct 2012 10:12:11 +0300

> MEMWIN0_APERTURE is the size in bytes.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.

> ---
> This was introduced in 8c357ebd569 "cxgb4: Dynamically allocate memory
> in t4_memory_rw() and get_vpd_params()" from Oct 3.

Sigh, putting bad on top of bad...
