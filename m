From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Date: Fri, 10 Nov 2017 23:51:48 +0000
Subject: Re: [PATCH] umh: Optimize 'proc_cap_handler()'
Message-Id: <20171110235148.GW22894@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171020193331.7233-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20171020193331.7233-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, akpm@linux-foundation.org
Cc: mcgrof@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 20, 2017 at 09:33:31PM +0200, Christophe JAILLET wrote:
> If 'write' is 0, we can avoid a call to spin_lock/spin_unlock.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks for the patch!

Acked-by: Luis R. Rodriguez <mcgrof@kernel.org>

I'll bounce a copy to Andrew for integration next.

  Luis


> ---
>  kernel/umh.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/umh.c b/kernel/umh.c
> index 6ff9905250ff..18e5fa4b0e71 100644
> --- a/kernel/umh.c
> +++ b/kernel/umh.c
> @@ -537,14 +537,14 @@ static int proc_cap_handler(struct ctl_table *table, int write,
>  	/*
>  	 * Drop everything not in the new_cap (but don't add things)
>  	 */
> -	spin_lock(&umh_sysctl_lock);
>  	if (write) {
> +		spin_lock(&umh_sysctl_lock);
>  		if (table->data = CAP_BSET)
>  			usermodehelper_bset = cap_intersect(usermodehelper_bset, new_cap);
>  		if (table->data = CAP_PI)
>  			usermodehelper_inheritable = cap_intersect(usermodehelper_inheritable, new_cap);
> +		spin_unlock(&umh_sysctl_lock);
>  	}
> -	spin_unlock(&umh_sysctl_lock);
>  
>  	return 0;
>  }
> -- 
> 2.14.1
> 
> 

-- 
Luis Rodriguez, SUSE LINUX GmbH
Maxfeldstrasse 5; D-90409 Nuernberg
