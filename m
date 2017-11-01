From: walter harms <wharms@bfs.de>
Date: Wed, 01 Nov 2017 10:50:21 +0000
Subject: Re: [PATCH] wan: wanxl: remove redundant assignment to stat
Message-Id: <59F9A6ED.7060301@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171101084945.14653-1-colin.king@canonical.com>
In-Reply-To: <20171101084945.14653-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Krzysztof Halasa <khc@pm.waw.pl>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 01.11.2017 09:49, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> stat set to zero and the value is never read, instead stat is
> set again in the do-loop. Hence the setting to zero is redundant
> and can be removed. Cleans up clang warning:
> 
> drivers/net/wan/wanxl.c:737:2: warning: Value stored to 'stat'
> is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wan/wanxl.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wan/wanxl.c b/drivers/net/wan/wanxl.c
> index 0c7317520ed3..d573a57bc301 100644
> --- a/drivers/net/wan/wanxl.c
> +++ b/drivers/net/wan/wanxl.c
> @@ -734,7 +734,6 @@ static int wanxl_pci_init_one(struct pci_dev *pdev,
>  		return -ENODEV;
>  	}
>  
> -	stat = 0;
>  	timeout = jiffies + 5 * HZ;
>  	do {
>  		if ((stat = readl(card->plx + PLX_MAILBOX_5)) != 0)

it is std. practice to have the pattern:
 a=b;
 if (a = c) ...
maybe that can be done also here.
 stat = readl(card->plx + PLX_MAILBOX_5);
 if ( stat != 0)

just a hint.

 re,
  wh






