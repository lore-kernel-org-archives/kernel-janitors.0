From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 23 Nov 2008 10:12:09 +0000
Subject: Re: [PATCH] x86: hypervisor - fix sparse warnings
Message-Id: <20081123101209.GA30453@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811211356y79981d6cke1ea8bf3eddf7e50@mail.gmail.com>
In-Reply-To: <154e089b0811211356y79981d6cke1ea8bf3eddf7e50@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Alok N Kataria <akataria@vmware.com>, Dan Hecht <dhecht@vmware.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>


* Hannes Eder <hannes@hanneseder.net> wrote:

> Fix the following sparse warnings:
> 
> arch/x86/kernel/cpu/hypervisor.c:37:15: warning: symbol
> 'get_hypervisor_tsc_freq' was not declared. Should it be static?
> arch/x86/kernel/cpu/hypervisor.c:53:16: warning: symbol
> 'init_hypervisor' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  arch/x86/kernel/cpu/hypervisor.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

applied to tip/x86/detect-hyper, thanks Hannes!

	Ingo
