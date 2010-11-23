From: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 23 Nov 2010 20:46:00 +0000
Subject: Re: [PATCH v2] gpu: vga: limit kmalloc'ed memory size
Message-Id: <20101123124600.4401ea43.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290445864-13657-1-git-send-email-segoon@openwall.com>
	<20101122100915.5bf966fe.akpm@linux-foundation.org>
	<20101123190828.GA27159@albatros>
In-Reply-To: <20101123190828.GA27159@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, Dave Airlie <airlied@redhat.com>, Tiago Vignatti <tiago.vignatti@nokia.com>, Mike Travis <travis@sgi.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org

On Tue, 23 Nov 2010 22:08:28 +0300
Vasiliy Kulikov <segoon@openwall.com> wrote:

> > And perhaps
> > strndup_user() needs __GFP_NOWARN treatment.
> 
> strndup_user() silently return ERR_PTR(-EINVAL) if string is too long.
> 
> > The code should be using strndup_user() anyway.
> 
> Smth like this?
> 
> diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> index 09e3090..3afd249 100644
> --- a/drivers/gpu/vga/vgaarb.c
> +++ b/drivers/gpu/vga/vgaarb.c
> @@ -836,19 +836,10 @@ static ssize_t vga_arb_write(struct file *file, const char __user * buf,
>         int ret_val;
>         int i;
>  
> -       if (count > PAGE_SIZE)
> -               count = PAGE_SIZE;
> -
> -       kbuf = kmalloc(count + 1, GFP_KERNEL);
> -       if (!kbuf)
> -               return -ENOMEM;
> -
> -       if (copy_from_user(kbuf, buf, count)) {
> -               kfree(kbuf);
> -               return -EFAULT;
> -       }
> +       kbuf = strndup_user(buf, PAGE_SIZE);
> +       if (IS_ERR(kbuf))
> +               return PTR_ERR(kbuf);
>         curr_pos = kbuf;
> -       kbuf[count] = '\0';     /* Just to make sure... */
>  
>         if (strncmp(curr_pos, "lock ", 5) = 0) {
>                 curr_pos += 5;

What I'm suggesting is that we simply do

	kbuf = strndup_user(buf, count);

and make strndup_user() do the right thing if `count' turned out to be
crazy large.  THis way we don't have to sprinkle decisions about "crazy
largeness" all over the kernel.

And the way in which I suggest that strndup_user() decides whether the
length is too great is to try to kmalloc that amount of memory. 
If it succeeds then fine, proceed.  If it fails then return an error,
probably ENOMEM.  And that attempt to invoke kmalloc() shouldn't spew a
warning.


