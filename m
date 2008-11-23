From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 23 Nov 2008 12:39:07 +0000
Subject: Re: [PATCH] x86: Remove duplicate #define from 'cpufeature.h'
Message-Id: <20081123123907.GJ29663@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811230435m5d3182feyff0babb8c55cec72@mail.gmail.com>
In-Reply-To: <154e089b0811230435m5d3182feyff0babb8c55cec72@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* Hannes Eder <hannes@hanneseder.net> wrote:

> Remove duplicate #define from 'cpufeature.h'.
> 
> This also fixes the following sparse warning:
> 
> arch/x86/kernel/cpu/capflags.c:54:3: warning: Initializer entry defined twice
> arch/x86/kernel/cpu/capflags.c:58:3:   also defined here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  arch/x86/include/asm/cpufeature.h |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

applied to tip/x86/cpufeature, thanks Hannes!

	Ingo
