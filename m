From: Petr Mladek <pmladek@suse.com>
Date: Fri, 06 Nov 2020 12:57:49 +0000
Subject: Re: [PATCH] printk: remove unneeded dead-store assignment
Message-Id: <20201106125749.GU20201@alley>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On Fri 2020-11-06 04:40:05, Lukas Bulwahn wrote:
> make clang-analyzer on x86_64 defconfig caught my attention with:
> 
>   kernel/printk/printk_ringbuffer.c:885:3: warning:
>   Value stored to 'desc' is never read [clang-analyzer-deadcode.DeadStores]
>                 desc = to_desc(desc_ring, head_id);
>                 ^
> 
> Commit b6cf8b3f3312 ("printk: add lockless ringbuffer") introduced
> desc_reserve() with this unneeded dead-store assignment.
> 
> As discussed with John Ogness privately, this is probably just some minor
> left-over from previous iterations of the ringbuffer implementation. So,
> simply remove this unneeded dead assignment to make clang-analyzer happy.
> 
> As compilers will detect this unneeded assignment and optimize this anyway,
> the resulting object code is identical before and after this change.
> 
> No functional change. No change to object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

The patch is committed in printk/linux.git, branch for-5.10-trivial.

It might still go into 5.10 when there is another important fix.
Otherwise, it would need to wait for 5.11 merge window.

Best Regards,
Petr
