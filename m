From: Aaron Tomlin <atomlin@redhat.com>
Date: Wed, 20 May 2015 11:19:13 +0000
Subject: Re: [patch] watchdog: double lock typo in watchdog_nmi_enable_all()
Message-Id: <20150520111913.GF31237@atomlin.usersys.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150520074408.GC18278@mwanda>
In-Reply-To: <20150520074408.GC18278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed 2015-05-20 10:44 +0300, Dan Carpenter wrote:
> The mutex_lock() should obviously be mutex_unlock().
> 
> Fixes: ab992dc38f9a ('watchdog: Fix merge 'conflict'')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This bug is already in mainline.
> 
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index c57e67d..a6ffa43 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -628,7 +628,7 @@ void watchdog_nmi_enable_all(void)
>  	put_online_cpus();
>  
>  unlock:
> -	mutex_lock(&watchdog_proc_mutex);
> +	mutex_unlock(&watchdog_proc_mutex);
>  }
>  
>  void watchdog_nmi_disable_all(void)

Acked-by: Aaron Tomlin <atomlin@redhat.com>

-- 
Aaron Tomlin
