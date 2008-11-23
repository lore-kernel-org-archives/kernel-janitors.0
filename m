From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 23 Nov 2008 10:02:49 +0000
Subject: Re: [PATCH] x86: vmware - fix sparse warnings
Message-Id: <20081123100249.GV30453@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811211417l7c6c5cf8j7e248399fa7ebd20@mail.gmail.com>
In-Reply-To: <154e089b0811211417l7c6c5cf8j7e248399fa7ebd20@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Alok N Kataria <akataria@vmware.com>, Dan Hecht <dhecht@vmware.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>


* Hannes Eder <hannes@hanneseder.net> wrote:

> Fix the following sparse warnings:
> 
> arch/x86/kernel/cpu/vmware.c:69:5: warning: symbol 'vmware_platform'
> was not declared. Should it be static?
> arch/x86/kernel/cpu/vmware.c:89:15: warning: symbol
> 'vmware_get_tsc_khz' was not declared. Should it be static?
> arch/x86/kernel/cpu/vmware.c:107:16: warning: symbol
> 'vmware_set_feature_bits' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  arch/x86/kernel/cpu/vmware.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

applied to tip/x86/detect-hyper, thanks Hannes!

	Ingo
