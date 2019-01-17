From: Joe Perches <joe@perches.com>
Date: Thu, 17 Jan 2019 00:20:59 +0000
Subject: Re: [PATCH] sb1000: fix a couple of indentation issues
Message-Id: <e9c1698dcf0ef40eb15035cfb32d9b3456f197d6.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190117001301.29948-1-colin.king@canonical.com>
In-Reply-To: <20190117001301.29948-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2019-01-17 at 00:13 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an if statement and a return statement that are incorrectly
> indented. Fix these.
[]
> diff --git a/drivers/net/sb1000.c b/drivers/net/sb1000.c
[]
> @@ -540,12 +540,12 @@ sb1000_activate(const int ioaddr[], const char* name)
>  	if ((status = card_send_command(ioaddr, name, Command1, st)))
>  		return status;
>  	if (st[3] != 0xf1) {
> -    	if ((status = sb1000_start_get_set_command(ioaddr, name)))
> +		if ((status = sb1000_start_get_set_command(ioaddr, name)))

Probably better to remove the assignment in the if at the same time.

		status = sb1000_start_get_set_command(ioaddr, name);
		if (status)

>  			return status;
>  		return -EIO;
>  	}
>  	udelay(1000);
> -    return sb1000_start_get_set_command(ioaddr, name);
> +	return sb1000_start_get_set_command(ioaddr, name);
>  }
>  
>  /* get SB1000 firmware version */
