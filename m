From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 26 Mar 2014 21:56:55 +0000
Subject: Re: [PATCH 2/7] atm: replace del_timer by del_timer_sync
Message-Id: <1395871015.12610.254.camel@edumazet-glaptop2.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1395869625-15209-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1395869625-15209-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1395869625-15209-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org, tglx@linutronix.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2014-03-26 at 22:33 +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>

> 
> diff --git a/net/atm/mpc.c b/net/atm/mpc.c
> index b71ff6b..91dc58f 100644
> --- a/net/atm/mpc.c
> +++ b/net/atm/mpc.c
> @@ -1492,7 +1492,7 @@ static void __exit atm_mpoa_cleanup(void)
>  
>  	mpc_proc_clean();
>  
> -	del_timer(&mpc_timer);
> +	del_timer_sync(&mpc_timer);
>  	unregister_netdevice_notifier(&mpoa_notifier);
>  	deregister_atm_ioctl(&atm_ioctl_ops);
>  

It seems this timer rearms itself, so this patch wont be enough I fear.




