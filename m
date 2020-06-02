From: Doug Anderson <dianders@chromium.org>
Date: Tue, 02 Jun 2020 20:40:53 +0000
Subject: Re: [PATCH] arm64: debug: mark a function as __init to save some memory
Message-Id: <CAD=FV=WOp9yVGt9hosO6fGTSqstjqO=nddTLr5tD04cfvHHL7A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531110015.598607-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200531110015.598607-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: paulmck@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

Hi,

On Sun, May 31, 2020 at 4:00 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'debug_monitors_init()' is only called via 'postcore_initcall'.
> It can be marked as __init to save a few bytes of memory.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  arch/arm64/kernel/debug-monitors.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Seems OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
