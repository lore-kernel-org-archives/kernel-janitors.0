From: Ursula Braun <ubraun@linux.ibm.com>
Date: Fri, 01 Jun 2018 07:02:36 +0000
Subject: Re: [PATCH net-next] net/smc: fix error return code in smc_setsockopt()
Message-Id: <34306217-624d-2aa0-0e8a-64867711029b@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527733882-149144-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527733882-149144-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-s390@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 05/31/2018 04:31 AM, Wei Yongjun wrote:
> Fix to return error code -EINVAL instead of 0 if optlen is invalid.
> 
> Fixes: 01d2f7e2cdd3 ("net/smc: sockopts TCP_NODELAY and TCP_CORK")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  net/smc/af_smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
> index 2c369d4..973b447 100644
> --- a/net/smc/af_smc.c
> +++ b/net/smc/af_smc.c
> @@ -1420,7 +1420,7 @@ static int smc_setsockopt(struct socket *sock, int level, int optname,
>  		return rc;
>  
>  	if (optlen < sizeof(int))
> -		return rc;
> +		return -EINVAL;
>  	get_user(val, (int __user *)optval);
>  
>  	lock_sock(sk);
> 

Thanks for reporting this error. Your fix is fine, but I think we can get rid of
this check at all, since it is already checked in the tcp-code invoked before with

   smc->clcsock->ops->setsockopt(smc->clcsock, level, optname, optval, optlen)

