From: Matt Mackall <mpm@selenic.com>
Date: Tue, 06 Apr 2010 15:17:56 +0000
Subject: Re: [patch] proc: copy_to_user() returns unsigned
Message-Id: <1270567076.3552.2016.camel@calx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100406104539.GC21229@bicker>
In-Reply-To: <20100406104539.GC21229@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Minchan Kim <minchan.kim@gmail.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2010-04-06 at 13:45 +0300, Dan Carpenter wrote:
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

Acked-by: Matt Mackall <mpm@selenic.com>

Linus, please take this one too.

-- 
http://selenic.com : development and support for Mercurial and Linux


