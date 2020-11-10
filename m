From: Tom Rix <trix@redhat.com>
Date: Tue, 10 Nov 2020 01:26:37 +0000
Subject: Re: [PATCH] sysctl: move local variable in proc_do_large_bitmap() to proper scope
Message-Id: <e0cf83dc-2978-70ce-aeb2-37873cc81c03@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, linux-fsdevel@vger.kernel.org
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org


On 11/8/20 11:11 PM, Lukas Bulwahn wrote:
> make clang-analyzer caught my attention with:
>
>   kernel/sysctl.c:1511:4: warning: Value stored to 'first' is never read \
>   [clang-analyzer-deadcode.DeadStores]
>                           first = 0;
>                           ^
>
> Commit 9f977fb7ae9d ("sysctl: add proc_do_large_bitmap") introduced
> proc_do_large_bitmap(), where the variable first is only effectively used
> when write is false; when write is true, the variable first is only used in
> a dead assignment.
>
> So, simply remove this dead assignment and put the variable in local scope.
>
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting object code is identical before and after this change.
>
> No functional change. No change to object code.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on v5.10-rc3 and next-20201106
>
> Luis, Kees, Iurii, please pick this minor non-urgent clean-up patch.
>
>  kernel/sysctl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index ce75c67572b9..cc274a431d91 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -1423,7 +1423,6 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
>  			 void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	int err = 0;
> -	bool first = 1;
>  	size_t left = *lenp;
>  	unsigned long bitmap_len = table->maxlen;
>  	unsigned long *bitmap = *(unsigned long **) table->data;
> @@ -1508,12 +1507,12 @@ int proc_do_large_bitmap(struct ctl_table *table, int write,
>  			}
>  
>  			bitmap_set(tmp_bitmap, val_a, val_b - val_a + 1);
> -			first = 0;
>  			proc_skip_char(&p, &left, '\n');
>  		}
>  		left += skipped;
>  	} else {
>  		unsigned long bit_a, bit_b = 0;
> +		bool first = 1;

This looks fine, but while you are here how about setting, to match the type

first = true

And then only clearing first once

if (!first)                                                                            
  proc_put_char(&buffer, &left, ',');

else

  first = false

Instead of at every loop iteraction

Tom

>  
>  		while (left) {
>  			bit_a = find_next_bit(bitmap, bitmap_len, bit_b);
