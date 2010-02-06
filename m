From: Ludovic FERRE <ludovic.ferre@gmail.com>
Date: Sat, 06 Feb 2010 22:07:00 +0000
Subject: Re: [PATCH 3/11] arch/x86/kernel: Correct NULL test
Message-Id: <4e0ef1451002061407i6262b927l1eacfe2e5a3618c7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1002060942170.8092@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1002060942170.8092@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: Joerg Roedel <joerg.roedel@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Julia,

May be it would be worthy to take your changes one step further and to
report if the function is called with a null device pointer (which
indicates a problem in the calling code, right?).

Here's a patch moving the null pointer check to its own if block and
reporting the null pointer function call using printk based on
2.6.33-rc6 code.

diff --git a/arch/x86/kernel/amd_iommu.c b/arch/x86/kernel/amd_iommu.c
index 23824fe..1a1d87c 100644
--- a/arch/x86/kernel/amd_iommu.c
+++ b/arch/x86/kernel/amd_iommu.c
@@ -114,11 +114,17 @@ static bool check_device(struct device *dev)
 {
       u16 devid;

-       if (!dev || !dev->dma_mask)
+       /* Function is called with a null pointer. Flag this and return false */
+       if (!dev){
+               printk(KERN_INFO "amd_iommu check_device called with a
null pointer device\n");
+               return false;
+       }
+
+       if (!dev->dma_mask)
               return false;

       /* No device or no PCI device */
-       if (!dev || dev->bus != &pci_bus_type)
+       if (dev->bus != &pci_bus_type)
               return false;

       devid = get_device_id(dev);

On Sat, Feb 6, 2010 at 9:42 AM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> dev was tested just above, so drop the second test.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @r@
> expression *x;
> expression e;
> identifier l;
> @@
>
> if (x = NULL || ...) {
>    ... when forall
>    return ...; }
> ... when != goto l;
>    when != x = e
>    when != &x
> *x = NULL
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
>  arch/x86/kernel/amd_iommu.c         |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/x86/kernel/amd_iommu.c b/arch/x86/kernel/amd_iommu.c
> index adb0ba0..2c4a501 100644
> --- a/arch/x86/kernel/amd_iommu.c
> +++ b/arch/x86/kernel/amd_iommu.c
> @@ -118,7 +118,7 @@ static bool check_device(struct device *dev)
>                return false;
>
>        /* No device or no PCI device */
> -       if (!dev || dev->bus != &pci_bus_type)
> +       if (dev->bus != &pci_bus_type)
>                return false;
>
>        devid = get_device_id(dev);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>



-- 
Ludovic
