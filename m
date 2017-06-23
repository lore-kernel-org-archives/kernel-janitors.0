From: Dave Watson <davejwatson@fb.com>
Date: Fri, 23 Jun 2017 16:12:08 +0000
Subject: Re: [PATCH -net] tls: return -EFAULT if copy_to_user() fails
Message-Id: <20170623161208.GA68369@davejwatson-mba.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623101544.c5bvwe5cd6e46bd5@mwanda>
In-Reply-To: <20170623101544.c5bvwe5cd6e46bd5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Aviad Yehezkel <aviadye@mellanox.com>, Ilya Lesokhin <ilyal@mellanox.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/23/17 01:15 PM, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes remaining but we
> want to return -EFAULT here.
> 
> Fixes: 3c4d7559159b ("tls: kernel TLS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Dave Watson <davejwatson@fb.com>

Yes, -EFAULT seems like the correct choice here, the return from
copy_to_user isn't useful.  Thanks

> 
> diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
> index 2ebc328bda96..a03130a47b85 100644
> --- a/net/tls/tls_main.c
> +++ b/net/tls/tls_main.c
> @@ -273,7 +273,8 @@ static int do_tls_getsockopt_tx(struct sock *sk, char __user *optval,
>  	}
>  
>  	if (len = sizeof(crypto_info)) {
> -		rc = copy_to_user(optval, crypto_info, sizeof(*crypto_info));
> +		if (copy_to_user(optval, crypto_info, sizeof(*crypto_info)))
> +			rc = -EFAULT;
>  		goto out;
>  	}
>  
> @@ -293,9 +294,10 @@ static int do_tls_getsockopt_tx(struct sock *sk, char __user *optval,
>  		memcpy(crypto_info_aes_gcm_128->iv, ctx->iv,
>  		       TLS_CIPHER_AES_GCM_128_IV_SIZE);
>  		release_sock(sk);
> -		rc = copy_to_user(optval,
> -				  crypto_info_aes_gcm_128,
> -				  sizeof(*crypto_info_aes_gcm_128));
> +		if (copy_to_user(optval,
> +				 crypto_info_aes_gcm_128,
> +				 sizeof(*crypto_info_aes_gcm_128)))
> +			rc = -EFAULT;
>  		break;
>  	}
>  	default:
