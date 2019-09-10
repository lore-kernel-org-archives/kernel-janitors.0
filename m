From: David Miller <davem@davemloft.net>
Date: Tue, 10 Sep 2019 08:29:36 +0000
Subject: Re: [PATCH] net/mlx4_en: ethtool: make array modes static const, makes object smaller
Message-Id: <20190910.102936.1648930911852673896.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906115348.16621-1-colin.king@canonical.com>
In-Reply-To: <20190906115348.16621-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: tariqt@mellanox.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  6 Sep 2019 12:53:48 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array modes on the stack but instead make it
> static const. Makes the object code smaller by 303 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   51240	   5008	   1312	  57560	   e0d8 mellanox/mlx4/en_ethtool.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   50937	   5008	   1312	  57257	   dfa9	mellanox/mlx4/en_ethtool.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
