From: Ed Cashin <ecashin@coraid.com>
Date: Sun, 09 Sep 2012 01:25:53 +0000
Subject: Re: [patch] aoe: cleanup an allocation a bit
Message-Id: <F3A3DC24-1380-447B-AA94-A5FADB8D6E43@coraid.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908095921.GD608@elgon.mountain>
In-Reply-To: <20120908095921.GD608@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Looks OK to me, thanks.

On Sep 7, 2012, at 11:59 PM, "Dan Carpenter" <dan.carpenter@oracle.com> wrote:

> We changed this recently so we can just use kzalloc() here instead of
> kcalloc(1, ...).  Kernel style prefers sizeof(*t) over sizeof *t.  The
> kfree(t) is a no-op now as well so that can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Only applies to linux-next.
> 
> diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
> index 5461faa..c0adbbd 100644
> --- a/drivers/block/aoe/aoecmd.c
> +++ b/drivers/block/aoe/aoecmd.c
> @@ -1255,9 +1255,8 @@ addtgt(struct aoedev *d, char *addr, ulong nframes)
>            "aoe: device addtgt failure; too many targets\n");
>        return NULL;
>    }
> -    t = kcalloc(1, sizeof *t, GFP_ATOMIC);
> +    t = kzalloc(sizeof(*t), GFP_ATOMIC);
>    if (!t) {
> -        kfree(t);
>        printk(KERN_INFO "aoe: cannot allocate memory to add target\n");
>        return NULL;
>    }
