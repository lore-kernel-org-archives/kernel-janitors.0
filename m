From: Jia-Ju Bai <baijiaju1990@gmail.com>
Date: Fri, 30 Mar 2018 03:15:03 +0000
Subject: Re: [PATCH v3] staging: vt6655: check for memory allocation failures
Message-Id: <be23acda-38c0-dce3-9c79-8672113f6960@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180330024416epcas2p2f566f43a8f5af8b4ebc17659e3cf0ecf@epcas2p2.samsung.com>
 <1522377844-23591-1-git-send-email-ji_hun.kim@samsung.com>
In-Reply-To: <1522377844-23591-1-git-send-email-ji_hun.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ji-Hun Kim <ji_hun.kim@samsung.com>, gregkh@linuxfoundation.org, forest@alittletooquiet.net
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, santhameena13@gmail.com



On 2018/3/30 10:44, Ji-Hun Kim wrote:
> @@ -1165,10 +1205,18 @@ static int vnt_start(struct ieee80211_hw *hw)
>   	}
>   
>   	dev_dbg(&priv->pcid->dev, "call device init rd0 ring\n");
> -	device_init_rd0_ring(priv);
> -	device_init_rd1_ring(priv);
> -	device_init_td0_ring(priv);
> -	device_init_td1_ring(priv);
> +	ret = device_init_rd0_ring(priv);
> +	if (ret)
> +		goto error;
> +	ret = device_init_rd1_ring(priv);
> +	if (ret)
> +		goto error;
> +	ret = device_init_td0_ring(priv);
> +	if (ret)
> +		goto error;
> +	ret = device_init_td1_ring(priv);
> +	if (ret)
> +		goto error;
>   
>   	device_init_registers(priv);
>   
> @@ -1178,6 +1226,8 @@ static int vnt_start(struct ieee80211_hw *hw)
>   	ieee80211_wake_queues(hw);
>   
>   	return 0;
> +error:
> +	return ret;
>   }

This code will lead to memory leaks when device_init_rd1_ring() fails, 
because the memory allocated by device_init_rd0_ring() is not freed.

I think this one will be better:
     ret = device_init_rd0_ring(priv);
     if (ret)
         goto error_init_rd0_ring;
     ret = device_init_rd1_ring(priv);
     if (ret)
         goto error_init_rd1_ring;
     ret = device_init_td0_ring(priv);
     if (ret)
         goto error_init_td0_ring;
     ret = device_init_td1_ring(priv);
     if (ret)
         goto error_init_td1_ring;
     ......
error_init_td1_ring:
     device_free_td0_ring(priv);
error_init_td0_ring:
     device_free_rd1_ring(priv);
error_init_rd1_ring:
     device_free_rd0_ring(priv);
error_init_rd0_ring:
     return ret;


Best wishes,
Jia-Ju Bai
