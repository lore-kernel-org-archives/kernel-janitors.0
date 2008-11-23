From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 23 Nov 2008 19:23:55 +0000
Subject: Re: [PATCH] x86: HPET: fix sparse warning
Message-Id: <20081123192355.GA904@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811231119s2c91de2md3144ff9ed2d73f7@mail.gmail.com>
In-Reply-To: <154e089b0811231119s2c91de2md3144ff9ed2d73f7@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* Hannes Eder <hannes@hanneseder.net> wrote:

> Fix this sparse warning:
> 
> arch/x86/kernel/hpet.c:36:18: warning: symbol 'hpet_num_timers' was
> not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  arch/x86/kernel/hpet.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

applied to tip/x86/sparse-fixes, thanks!

	Ingo
