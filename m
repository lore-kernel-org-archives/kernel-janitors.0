From: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 27 Sep 2010 23:12:03 +0000
Subject: Re: [patch] tlb_uv: handle large snprintf() returns
Message-Id: <20100927161203.732833b0.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100816105502.GC645@bicker>
In-Reply-To: <20100816105502.GC645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Cliff Wickman <cpw@sgi.com>, Jack Steiner <steiner@sgi.com>, Robin Holt <holt@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 16 Aug 2010 12:55:02 +0200
Dan Carpenter <error27@gmail.com> wrote:

> snprintf() returns the number of bytes that *would* have been copied if
> the buffer was large enough, so it can be larger than the size of the
> buffer.  In this case it's ok, but let's put a cap on it anyway so it's
> easier to audit.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/arch/x86/kernel/tlb_uv.c b/arch/x86/kernel/tlb_uv.c
> index 312ef02..5e88b3a 100644
> --- a/arch/x86/kernel/tlb_uv.c
> +++ b/arch/x86/kernel/tlb_uv.c
> @@ -1012,6 +1012,9 @@ static ssize_t tunables_read(struct file *file, char __user *userbuf,
>  		timeoutsb4reset, ipi_reset_limit, complete_threshold,
>  		congested_response_us, congested_reps, congested_period);
>  
> +	if (ret > 300)
> +		ret = 300;
> +
>  	return simple_read_from_buffer(userbuf, count, ppos, buf, ret);
>  }

That 300-byte local array is yuk.

Duplicating the "300" later in the function (instead of using sizeof)
is also yuk.

The code can be deyukked by using sprintf_to_user(), only we don't have
one.  But we do have kasprintf().

