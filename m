From: David Miller <davem@davemloft.net>
Date: Mon, 07 Oct 2019 14:00:57 +0000
Subject: Re: [PATCH] net: hns: make arrays static, makes object smaller
Message-Id: <20191007.160057.2276197375290462580.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007105510.31858-1-colin.king@canonical.com>
In-Reply-To: <20191007105510.31858-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  7 Oct 2019 11:55:10 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the arrays port_map and sl_map on the stack but
> instead make them static. Makes the object code smaller by 64 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   49575	   6872	     64	  56511	   dcbf	hisilicon/hns/hns_dsaf_main.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   49350	   7032	     64	  56446	   dc7e	hisilicon/hns/hns_dsaf_main.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
