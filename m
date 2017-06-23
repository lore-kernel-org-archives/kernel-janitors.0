From: Borislav Petkov <bp@alien8.de>
Date: Fri, 23 Jun 2017 08:27:07 +0000
Subject: Re: [PATCH][V2] x86/microcode: make a couple of symbols static
Message-Id: <20170623082707.lti7wqqsx273fnrv@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170622095736.11937-1-colin.king@canonical.com>
In-Reply-To: <20170622095736.11937-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 22, 2017 at 10:57:36AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The helper function __load_ucode_amd and pointer intel_ucode_patch
> do not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings:
> "symbol '__load_ucode_amd' was not declared. Should it be static?"
> "symbol 'intel_ucode_patch' was not declared. Should it be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/kernel/cpu/microcode/amd.c   | 2 +-
>  arch/x86/kernel/cpu/microcode/intel.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
