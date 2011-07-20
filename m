From: Greg Dietsche <gregory.dietsche@cuw.edu>
Date: Wed, 20 Jul 2011 02:03:34 +0000
Subject: Re: [PATCH v2] x86: smpboot: mark array as const
Message-Id: <4E263776.6080402@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1309482653-23648-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1309482653-23648-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 06/30/2011 08:10 PM, Greg Dietsche wrote:
> This array is read-only. Make it explicit by marking as const.
>
> Signed-off-by: Greg Dietsche<Gregory.Dietsche@cuw.edu>
> ---
>   arch/x86/kernel/smpboot.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 9fd3137..9f548cb 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -438,7 +438,7 @@ static void impress_friends(void)
>   void __inquire_remote_apic(int apicid)
>   {
>   	unsigned i, regs[] = { APIC_ID>>  4, APIC_LVR>>  4, APIC_SPIV>>  4 };
> -	char *names[] = { "ID", "VERSION", "SPIV" };
> +	const char * const names[] = { "ID", "VERSION", "SPIV" };
>   	int timeout;
>   	u32 status;
>
>    
adding trivial@kernel.org to the cc list since this is trivial and no 
one has picked up this patch to date.

Greg

