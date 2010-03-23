From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Date: Tue, 23 Mar 2010 00:18:41 +0000
Subject: Re: [patch] kcore: fix test for end of list
Message-Id: <20100323091841.dd500a38.kamezawa.hiroyu@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322120509.GC21571@bicker>
In-Reply-To: <20100322120509.GC21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, WANG Cong <xiyou.wangcong@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 22 Mar 2010 15:05:09 +0300
Dan Carpenter <error27@gmail.com> wrote:

> "m" is never NULL here.  We need a different test for the end of list
> condition.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

yes, thank you.
Acked-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>


> ---
> Found with a static checker and compile tested only.  Please review
> carefully.
> 
> diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
> index a44a789..b442dac 100644
> --- a/fs/proc/kcore.c
> +++ b/fs/proc/kcore.c
> @@ -490,7 +490,7 @@ read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
>  		}
>  		read_unlock(&kclist_lock);
>  
> -		if (m = NULL) {
> +		if (&m->list = &kclist_head) {
>  			if (clear_user(buffer, tsz))
>  				return -EFAULT;
>  		} else if (is_vmalloc_or_module_addr((void *)start)) {
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 

