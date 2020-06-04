From: Will Deacon <will@kernel.org>
Date: Thu, 04 Jun 2020 17:25:41 +0000
Subject: Re: [PATCH] arm64: debug: mark a function as __init to save some memory
Message-Id: <159128408989.162070.15969733421063303923.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531110015.598607-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200531110015.598607-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: catalin.marinas@arm.com, mhiramat@kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, gregkh@linuxfoundation.org, paulmck@kernel.org, tglx@linutronix.de, dianders@chromium.org
Cc: kernel-janitors@vger.kernel.org, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sun, 31 May 2020 13:00:15 +0200, Christophe JAILLET wrote:
> 'debug_monitors_init()' is only called via 'postcore_initcall'.
> It can be marked as __init to save a few bytes of memory.

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: debug: mark a function as __init to save some memory
      https://git.kernel.org/arm64/c/5311ebfb612f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
