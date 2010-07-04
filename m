From: Borislav Petkov <bp@amd64.org>
Date: Sun, 04 Jul 2010 07:51:10 +0000
Subject: Re: [PATCH 07/19] arch/x86/kernel: use for_each_pci_dev()
Message-Id: <20100704075110.GA5356@aftab>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278173040-11643-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278173040-11643-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, Tejun Heo <tj@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, Jul 03, 2010 at 12:03:59PM -0400

> Use for_each_pci_dev() to simplify the code.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Acked-by: Borislav Petkov <borislav.petkov@amd.com>

> ---
>  arch/x86/kernel/k8.c |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kernel/k8.c b/arch/x86/kernel/k8.c
> index 0f7bc20..0ea4b35 100644
> --- a/arch/x86/kernel/k8.c
> +++ b/arch/x86/kernel/k8.c
> @@ -27,11 +27,10 @@ EXPORT_SYMBOL(k8_northbridges);
>  
>  static struct pci_dev *next_k8_northbridge(struct pci_dev *dev)
>  {
> -	do {
> -		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
> -		if (!dev)
> +	for_each_pci_dev(dev) {
> +		if (pci_match_id(&k8_nb_ids[0], dev))
>  			break;
> -	} while (!pci_match_id(&k8_nb_ids[0], dev));
> +	}
>  	return dev;
>  }
>  
> -- 
> 1.7.0.4
> 
> 

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632
