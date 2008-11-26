From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 26 Nov 2008 07:49:38 +0000
Subject: Re: [PATCH] x86: microcode: fix sparse warnings
Message-Id: <20081126074938.GJ26036@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811231149qcb31d00r5b28d55f81b8e6d0@mail.gmail.com>
In-Reply-To: <154e089b0811231149qcb31d00r5b28d55f81b8e6d0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>


* Hannes Eder <hannes@hanneseder.net> wrote:

> Impact: make global variables and a function static
> 
> Fix following sparse warnings:
> 
> arch/x86/kernel/microcode_core.c:102:22: warning: symbol
> 'microcode_ops' was not declared. Should it be static?
> arch/x86/kernel/microcode_core.c:206:24: warning: symbol
> 'microcode_pdev' was not declared. Should it be static?
> arch/x86/kernel/microcode_core.c:322:6: warning: symbol
> 'microcode_update_cpu' was not declared. Should it be static?
> arch/x86/kernel/microcode_intel.c:468:22: warning: symbol
> 'microcode_intel_ops' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

applied to tip/x86/sparse-fixes, thanks Hannes!

	Ingo
