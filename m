From: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 08 Dec 2016 23:08:56 +0000
Subject: Re: [patch] x86/ldt: make a size variable unsigned
Message-Id: <alpine.DEB.2.20.1612090004030.3609@nanos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161208105602.GA11382@elgon.mountain>
In-Reply-To: <20161208105602.GA11382@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 8 Dec 2016, Dan Carpenter wrote:
> My static checker complains that we put an upper bound on the "size"
> variable but not a lower bound.  The checker is not smart enough to know
> the possible ranges of "old_mm->context.ldt->size" from
> init_new_context_ldt() so it thinks maybe it could be negative.
> 
> Let's make it unsigned to silence the warning and future proof the code
> a bit.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/kernel/ldt.c b/arch/x86/kernel/ldt.c
> index 4d12cdf2b453..d6320c63be45 100644
> --- a/arch/x86/kernel/ldt.c
> +++ b/arch/x86/kernel/ldt.c
> @@ -34,7 +34,7 @@ static void flush_ldt(void *current_mm)
>  }
>  
>  /* The caller must call finalize_ldt_struct on the result. LDT starts zeroed. */
> -static struct ldt_struct *alloc_ldt_struct(int size)
> +static struct ldt_struct *alloc_ldt_struct(unsigned int size)
>  {
>  	struct ldt_struct *new_ldt;
>  	int alloc_size;

So yes, this fixes the checker warning, but then it leaves the code in
inconsistent state:

	alloc_size = size * LDT_ENTRY_SIZE;

Why not doing the obvious

-	int alloc_size;
+	unsigned int alloc_size;

right away?

We have lots of places where we 'fixup' stuff and leave the rest untouched,
which then causes trouble a few month down the road. Probably not in this
case, but still.

I'm all for addressing such issues, but then please take the time aside of
mechanically fixing the checker fallout to make the overall usage
consistent.

Thanks,

	tglx
