From: Arend van Spriel <aspriel@gmail.com>
Date: Sat, 30 Jan 2016 19:58:37 +0000
Subject: Re: [patch] mac80211: free sinfo on error path
Message-Id: <56AD15ED.9030908@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160130143906.GD3462@mwanda>
In-Reply-To: <20160130143906.GD3462@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org



On 30-01-16 15:39, Dan Carpenter wrote:
> There is a missing kfree(sinfo) on error in sta_info_insert_finish().
> 
> Fixes: 5fe74014172d ('mac80211: avoid excessive stack usage in sta_info')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hi Dan,

A fix for this has already been posted [1]. Although your 'Fixes:' tag
is useful to have, I guess.

Regards,
Arend

[1]
http://mid.gmane.org/1454060944-11320-1-git-send-email-sudipm.mukherjee@gmail.com

> diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
> index 6c198e6..1502efb 100644
> --- a/net/mac80211/sta_info.c
> +++ b/net/mac80211/sta_info.c
> @@ -562,6 +562,7 @@ static int sta_info_insert_finish(struct sta_info *sta) __acquires(RCU)
>   out_err:
>  	mutex_unlock(&local->sta_mtx);
>  	rcu_read_lock();
> +	kfree(sinfo);
>  	return err;
>  }
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
