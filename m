From: Bjorn Helgaas <helgaas@kernel.org>
Date: Fri, 09 Nov 2018 00:02:58 +0000
Subject: Re: [PATCH] x86/PCI: Fix Broadcom CNB20LE unintended sign extension (redux)
Message-Id: <20181109000258.GJ41183@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181025135231.27817-1-colin.king@canonical.com>
In-Reply-To: <20181025135231.27817-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 25, 2018 at 02:52:31PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the expression "word1 << 16", word1 starts as u16, but is promoted to
> a signed int, then sign-extended to resource_size_t, which is probably
> not what was intended.  Cast to resource_size_t to avoid the sign
> extension.
> 
> This fixes an identical issue as fixed by commit 0b2d70764bb3
> ("x86/PCI: Fix Broadcom CNB20LE unintended sign extension") back in 2014.
> 
> Detected by CoverityScan, CID#138749, 138750 ("Unintended sign extension")
> 
> Fixes: 3f6ea84a3035 ("PCI: read memory ranges out of Broadcom CNB20LE host bridge")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

How lame that I fixed one but not both with 0b2d70764bb3, sorry about
that!

Applied to pci/enumeration for v4.21, thanks!

> ---
>  arch/x86/pci/broadcom_bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/pci/broadcom_bus.c b/arch/x86/pci/broadcom_bus.c
> index 526536c81ddc..d09c401a300d 100644
> --- a/arch/x86/pci/broadcom_bus.c
> +++ b/arch/x86/pci/broadcom_bus.c
> @@ -50,8 +50,8 @@ static void __init cnb20le_res(u8 bus, u8 slot, u8 func)
>  	word1 = read_pci_config_16(bus, slot, func, 0xc0);
>  	word2 = read_pci_config_16(bus, slot, func, 0xc2);
>  	if (word1 != word2) {
> -		res.start = (word1 << 16) | 0x0000;
> -		res.end   = (word2 << 16) | 0xffff;
> +		res.start = ((resource_size_t) word1 << 16) | 0x0000;
> +		res.end   = ((resource_size_t) word2 << 16) | 0xffff;
>  		res.flags = IORESOURCE_MEM;
>  		update_res(info, res.start, res.end, res.flags, 0);
>  	}
> -- 
> 2.19.1
> 
