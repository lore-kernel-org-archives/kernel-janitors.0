From: "Michael Kelley (EOSG)" <Michael.H.Kelley@microsoft.com>
Date: Sun, 23 Sep 2018 14:59:08 +0000
Subject: RE: [PATCH -next] x86/hyper-v: Remove unused including <linux/version.h>
Message-Id: <CY4PR21MB0773E37E25D664DB57D079E4DC100@CY4PR21MB0773.namprd21.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537690822-97455-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537690822-97455-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

From: YueHaibing <yuehaibing@huawei.com>  Sent: Sunday, September 23, 2018 1:20 AM

> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  arch/x86/hyperv/hv_apic.c | 1 -
>  1 file changed, 1 deletion(-)
> 
Reviewed-by:  Michael Kelley <mikelley@microsoft.com>
