From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 31 Oct 2016 06:06:58 +0000
Subject: Re: [PATCH 08/15] powerpc/iommu: use permission-specific DEVICE_ATTR variants
Message-Id: <87twbt127x.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
 <1477769829-22230-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 5f202a5..32f18b5 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -127,8 +127,7 @@ static ssize_t fail_iommu_store(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(fail_iommu, S_IRUGO|S_IWUSR, fail_iommu_show,
> -		   fail_iommu_store);
> +static DEVICE_ATTR_RW(fail_iommu);

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


cheers
