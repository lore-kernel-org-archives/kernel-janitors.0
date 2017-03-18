From: Borislav Petkov <bp@alien8.de>
Date: Sat, 18 Mar 2017 09:27:48 +0000
Subject: Re: [PATCH] x86/microcode/AMD: remove redundant null check on mc
Message-Id: <20170318092748.sjbagvbzzucycggl@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170315171010.17536-1-colin.king@canonical.com>
In-Reply-To: <20170315171010.17536-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 15, 2017 at 05:10:10PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> mc is a pointer to the static u8 array amd_ucode_patch and
> therefore can never be null, so the check is redundant. Remove it.
> 
> Detected by CoverityScan, CID#1372871 ("Logically Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/kernel/cpu/microcode/amd.c | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
