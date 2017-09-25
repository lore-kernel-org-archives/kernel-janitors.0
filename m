From: David Miller <davem@davemloft.net>
Date: Mon, 25 Sep 2017 23:25:37 +0000
Subject: Re: [PATCH] hv_netvsc: make const array ver_list static, reduces object code size
Message-Id: <20170925.162537.46489269812058623.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170922155023.15821-1-colin.king@canonical.com>
In-Reply-To: <20170922155023.15821-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com, devel@linuxdriverproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Sep 2017 16:50:23 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const array ver_list on the stack, instead make it
> static. Makes the object code smaller by over 400 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   18444	   3168	    320	  21932	   55ac	drivers/net/hyperv/netvsc.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   17950	   3224	    320	  21494	   53f6	drivers/net/hyperv/netvsc.o
> 
> (gcc 6.3.0, x86-64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
