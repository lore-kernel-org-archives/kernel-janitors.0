From: Andrew Banman <abanman@hpe.com>
Date: Thu, 10 Aug 2017 17:46:22 +0000
Subject: Re: [PATCH] x86/platform/uv: make timeout_base_ns const and process_uv2_message static
Message-Id: <20170810174621.GA130421@stormcage.americas.sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170810163006.13926-1-colin.king@canonical.com>
In-Reply-To: <20170810163006.13926-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andrew Banman <abanman@hpe.com>, Mike Travis <mike.travis@hpe.com>, Dimitri Sivanich <sivanich@sgi.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Acked-by: Andrew Banman <abanman@hpe.com>

On Thu, Aug 10, 2017 at 05:30:06PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Make array timeout_base_ns const. Also the function process_uv2_message
> is local to the source and do not need to be in global scope, so make it
> static.
> 
> Cleans up sparse warning:
> symbol 'process_uv2_message' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/platform/uv/tlb_uv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
> index 3e4bdb442fbc..f44c0bc95aa2 100644
> --- a/arch/x86/platform/uv/tlb_uv.c
> +++ b/arch/x86/platform/uv/tlb_uv.c
> @@ -26,7 +26,7 @@
>  static struct bau_operations ops __ro_after_init;
>  
>  /* timeouts in nanoseconds (indexed by UVH_AGING_PRESCALE_SEL urgency7 30:28) */
> -static int timeout_base_ns[] = {
> +static const int timeout_base_ns[] = {
>  		20,
>  		160,
>  		1280,
> @@ -1216,7 +1216,7 @@ static struct bau_pq_entry *find_another_by_swack(struct bau_pq_entry *msg,
>   * set a bit in the UVH_LB_BAU_INTD_SOFTWARE_ACKNOWLEDGE register.
>   * Such a message must be ignored.
>   */
> -void process_uv2_message(struct msg_desc *mdp, struct bau_control *bcp)
> +static void process_uv2_message(struct msg_desc *mdp, struct bau_control *bcp)
>  {
>  	unsigned long mmr_image;
>  	unsigned char swack_vec;
> -- 
> 2.11.0
> 
