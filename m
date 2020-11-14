From: Thomas Gleixner <tglx@linutronix.de>
Date: Sat, 14 Nov 2020 00:15:20 +0000
Subject: Re: [PATCH] futex: remove unused empty compat_exit_robust_list()
Message-Id: <87ima8bxpj.fsf@nanos.tec.linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113172012.27221-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201113172012.27221-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Lukas,

On Fri, Nov 13 2020 at 18:20, Lukas Bulwahn wrote:
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

While I agree with the removal, I disagree with the reasoning.

The real argument is that the stub function is useless. Addressing the
warning is a side effect of the removal, nothing else.

Thanks,

        tglx
