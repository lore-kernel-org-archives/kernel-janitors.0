From: Nathan Chancellor <natechancellor@gmail.com>
Date: Fri, 13 Nov 2020 18:40:55 +0000
Subject: Re: [PATCH] futex: remove unused empty compat_exit_robust_list()
Message-Id: <20201113184055.GA1436703@ubuntu-m3-large-x86>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113172012.27221-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201113172012.27221-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 13, 2020 at 06:20:12PM +0100, Lukas Bulwahn wrote:
> Commit ba31c1a48538 ("futex: Move futex exit handling into futex code")
> introduced compat_exit_robust_list() with a full-fledged implementation for
> CONFIG_COMPAT, and an empty-body function for !CONFIG_COMPAT.
> However, compat_exit_robust_list() is only used in futex_mm_release() under
> ifdef CONFIG_COMPAT.
> 
> Hence for !CONFIG_COMPAT, make CC=clang W=1 warns:
> 
>   kernel/futex.c:314:20:
>     warning: unused function 'compat_exit_robust_list' [-Wunused-function]
> 
> There is no need to declare the unused empty function for !CONFIG_COMPAT.
> Simply, remove it to address the -Wunused-function warning.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> applies cleanly on current master and next-20201113
> 
> Thomas, please pick this minor non-urgent clean-up patch.
> 
>  kernel/futex.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/kernel/futex.c b/kernel/futex.c
> index 00259c7e288e..c47d1015d759 100644
> --- a/kernel/futex.c
> +++ b/kernel/futex.c
> @@ -310,8 +310,6 @@ static inline bool should_fail_futex(bool fshared)
>  
>  #ifdef CONFIG_COMPAT
>  static void compat_exit_robust_list(struct task_struct *curr);
> -#else
> -static inline void compat_exit_robust_list(struct task_struct *curr) { }
>  #endif
>  
>  /*
> -- 
> 2.17.1
> 
