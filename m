From: Nathan Chancellor <natechancellor@gmail.com>
Date: Thu, 29 Oct 2020 02:36:30 +0000
Subject: Re: [PATCH] x86/unwind: remove unneeded initialization
Message-Id: <20201029023630.GA2316@Ryzen-9-3900X.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201028122102.24202-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201028122102.24202-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On Wed, Oct 28, 2020 at 01:21:02PM +0100, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
> 
>   arch/x86/kernel/unwind_orc.c:38:7: warning: Value stored to 'mid' during
>   its initialization is never read [clang-analyzer-deadcode.DeadStores]
>           int *mid = first, *found = first;
>                ^
> 
> Commit ee9f8fce9964 ("x86/unwind: Add the ORC unwinder") introduced
> __orc_find() with this unneeded dead-store initialization.
> 
> Put the variable in local scope and initialize only once the value is
> needed to make clang-analyzer happy.
> 
> As compilers will detect this unneeded assignment and optimize this
> anyway, the resulting object code is effectively identical before and
> after this change.
> 
> No functional change. Effectively, no change to object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Seems fine to me.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> applies cleanly on current master and next-20201028
> 
> Josh, please ack.
> Ingo, Borislav, please pick this minor non-urgent clean-up patch.
> 
>  arch/x86/kernel/unwind_orc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
> index 6a339ce328e0..5c64eed08257 100644
> --- a/arch/x86/kernel/unwind_orc.c
> +++ b/arch/x86/kernel/unwind_orc.c
> @@ -35,7 +35,7 @@ static struct orc_entry *__orc_find(int *ip_table, struct orc_entry *u_table,
>  {
>  	int *first = ip_table;
>  	int *last = ip_table + num_entries - 1;
> -	int *mid = first, *found = first;
> +	int *found = first;
>  
>  	if (!num_entries)
>  		return NULL;
> @@ -47,7 +47,7 @@ static struct orc_entry *__orc_find(int *ip_table, struct orc_entry *u_table,
>  	 * ignored when they conflict with a real entry.
>  	 */
>  	while (first <= last) {
> -		mid = first + ((last - first) / 2);
> +		int *mid = first + ((last - first) / 2);
>  
>  		if (orc_ip(mid) <= ip) {
>  			found = mid;
> -- 
> 2.17.1
> 
