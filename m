From: Walter Harms <wharms@bfs.de>
Date: Fri, 30 Nov 2018 08:18:48 +0000
Subject: Re: [PATCH] drm/mgag200: make array m_div_val static, shrinks object size
Message-Id: <862154684.73704.1543565929105@ox-groupware.bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129234051.5463-1-colin.king@canonical.com>
In-Reply-To: <20181129234051.5463-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


Am 30.11.2018 00:40, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array m_div_val on the stack but instead
> make it static. Makes the object code smaller by 60 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   32339	   1728	      0	  34067	   8513	mgag200/mgag200_mode.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   32215	   1792	      0	  34007	   84d7	mgag200/mgag200_mode.o
> 
> (gcc version 8.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c
> b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index acf7bfe68454..9939f0174bf7 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -629,7 +629,7 @@ static int mga_g200er_set_plls(struct mga_device *mdev,
> long clock)
>  	unsigned int p, m, n;
>  	unsigned int computed, vco;
>  	int tmp;
> -	const unsigned int m_div_val[] = { 1, 2, 4, 8 };
> +	static const unsigned int m_div_val[] = { 1, 2, 4, 8 };

hi,
is that array needed at all ? obvious it is 2^n
i found only one use:
 computed = vco / (m_div_val[testm] * (testo + 1));

just my 2 cents,

re,
 wh


>  
>  	m = n = p = 0;
>  	vcomax = 1488000;
