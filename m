From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 17:16:44 +0000
Subject: Re: [PATCH 4/5] drivers/char/agp: Eliminate memory leak
Message-Id: <20100824171644.GL29330@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008241639130.15172@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008241639130.15172@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 24, 2010 at 04:39:29PM +0200, Julia Lawall wrote:
>  
> -	error = agp_add_bridge(bridge);
> +	return agp_add_bridge(bridge);
>  

	error = agp_add_bridge(bridge);
	if (error)
		goto fail;
	return 0;

>  fail:
> +	kfree(fake_bridge_dev);
>  	return error;
>  }
>  

regards,
dan carpenter
