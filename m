From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Date: Tue, 06 Apr 2010 11:32:32 +0000
Subject: Re: [patch] proc: copy_to_user() returns unsigned
Message-Id: <20100406202339.7E6F.A69D9226@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100406104539.GC21229@bicker>
In-Reply-To: <20100406104539.GC21229@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Minchan Kim <minchan.kim@gmail.com>, Matt Mackall <mpm@selenic.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: kosaki.motohiro@jp.fujitsu.com

> copy_to_user() returns the number of bytes left to be copied.
> 
> This was a typo from: d82ef020cf31504c816803b1def94eb5ff173363
> "proc: pagemap: Hold mmap_sem during page walk".
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 0962739..bfb2773 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -799,7 +799,7 @@ static ssize_t pagemap_read(struct file *file, char __user *buf,
>  		start_vaddr = end;
>  
>  		len = min(count, PM_ENTRY_BYTES * pm.pos);
> -		if (copy_to_user(buf, pm.buffer, len) < 0) {
> +		if (copy_to_user(buf, pm.buffer, len)) {
>  			ret = -EFAULT;
>  			goto out_free;
>  		}

  Reviewed-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>


However I don't think this patch is kernel-janitors material. it should
be just merged mainline soon.



