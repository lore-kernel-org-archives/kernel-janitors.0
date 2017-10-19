From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Date: Thu, 19 Oct 2017 11:37:18 +0000
Subject: Re: [PATCH 3/5] powerpc-pseries: Delete an unnecessary variable initialisation in iommu_pseries_allo
Message-Id: <20171019133718.5bdab33c@kitsune.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d221be4-1402-0499-d95e-afa4a30e1f33@users.sourceforge.net>
 <9c71e3e0-8998-fd02-e3a3-ef219d82ee32@users.sourceforge.net>
In-Reply-To: <9c71e3e0-8998-fd02-e3a3-ef219d82ee32@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Morton <akpm@linux-foundation.org>, Bart Van Assche <bart.vanassche@sandisk.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Gibson <david@gibson.dropbear.id.au>, Doug Ledford <dledford@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Sahil Mehta <sahilmehta17@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello,

On Wed, 18 Oct 2017 21:24:25 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Oct 2017 19:14:39 +0200
> 
> The variable "table_group" will be set to an appropriate pointer.
> Thus omit the explicit initialisation at the beginning.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c
> b/arch/powerpc/platforms/pseries/iommu.c index
> b37d4fb20d1c..b6c12b8e3ace 100644 ---
> a/arch/powerpc/platforms/pseries/iommu.c +++
> b/arch/powerpc/platforms/pseries/iommu.c @@ -55,7 +55,7 @@
>  
>  static struct iommu_table_group *iommu_pseries_alloc_group(int node)
>  {
> -	struct iommu_table_group *table_group = NULL;
> +	struct iommu_table_group *table_group;
>  	struct iommu_table *tbl = NULL;
>  	struct iommu_table_group_link *tgl = NULL;
>  

I think initializing pointers to NULL is generally a good idea.

If there is no use of the variable before it is reinitialized by
allocation gcc is free to optimize out the variable and its initial
value.

On the other hand, if the code is changed later and use of the variable
becomes possible you may crash (and get a gcc warning, too).

Removing these initializers adds no value, to the contrary.

Thanks

Michal
