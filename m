From: walter harms <wharms@bfs.de>
Date: Wed, 28 May 2014 10:16:04 +0000
Subject: Re: [PATCH] perf/x86/uncore: Remove unnecessary assignment to "box" in uncore_pci_remove(...)
Message-Id: <5385B764.6090301@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401268294-28634-1-git-send-email-giedrius.rekasius@gmail.com>
In-Reply-To: <1401268294-28634-1-git-send-email-giedrius.rekasius@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giedrius Rekasius <giedrius.rekasius@gmail.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 28.05.2014 11:11, schrieb Giedrius Rekasius:
> Local variable "box" gets assigned correct value when it is initialized.
> There is no need to assign the same value again.
> 
> Signed-off-by: Giedrius Rekasius <giedrius.rekasius@gmail.com>
> ---
>  arch/x86/kernel/cpu/perf_event_intel_uncore.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/perf_event_intel_uncore.c b/arch/x86/kernel/cpu/perf_event_intel_uncore.c
> index 65bbbea..8cbbb1b 100644
> --- a/arch/x86/kernel/cpu/perf_event_intel_uncore.c
> +++ b/arch/x86/kernel/cpu/perf_event_intel_uncore.c
> @@ -3817,7 +3817,6 @@ static void uncore_pci_remove(struct pci_dev *pdev)
>  	struct intel_uncore_pmu *pmu;
>  	int i, cpu, phys_id = pcibus_to_physid[pdev->bus->number];
>  
> -	box = pci_get_drvdata(pdev);
>  	if (!box) {
>  		for (i = 0; i < UNCORE_EXTRA_PCI_DEV_MAX; i++) {
>  			if (extra_pci_dev[phys_id][i] = pdev) {

Just a remark,
for readability it is better to remove the other one.

re,
 wh
