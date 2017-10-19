From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Date: Thu, 19 Oct 2017 11:41:48 +0000
Subject: Re: [PATCH 4/5] powerpc-pseries: Return directly after a failed kzalloc_node() in iommu_pseries_allo
Message-Id: <20171019134148.52b890b4@kitsune.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d221be4-1402-0499-d95e-afa4a30e1f33@users.sourceforge.net>
 <a824fe65-1708-16ba-68d6-df0f73e0f49a@users.sourceforge.net>
In-Reply-To: <a824fe65-1708-16ba-68d6-df0f73e0f49a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Morton <akpm@linux-foundation.org>, Bart Van Assche <bart.vanassche@sandisk.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Gibson <david@gibson.dropbear.id.au>, Doug Ledford <dledford@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Sahil Mehta <sahilmehta17@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello,

On Wed, 18 Oct 2017 21:26:10 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Oct 2017 20:15:32 +0200
> 
> Return directly after a call of the function "kzalloc_node" failed
> at the beginning.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c
> b/arch/powerpc/platforms/pseries/iommu.c index
> b6c12b8e3ace..207ff8351af1 100644 ---
> a/arch/powerpc/platforms/pseries/iommu.c +++
> b/arch/powerpc/platforms/pseries/iommu.c @@ -61,7 +61,7 @@ static
> struct iommu_table_group *iommu_pseries_alloc_group(int node) 
>  	table_group = kzalloc_node(sizeof(*table_group), GFP_KERNEL,
> node); if (!table_group)
> -		goto fail_exit;
> +		return NULL;
>  
>  	tbl = kzalloc_node(sizeof(*tbl), GFP_KERNEL, node);
>  	if (!tbl)

I have seen quite a few fixes that do inverse of this patch after a
piece of code allocating some extra piece of memory was added before
code that just returns on fail because it is the first allocation in
the function.

This is not useful.

A final fail_exit that frees everything that could have been allocated
is much better. That applies to 5/5 as well.

Thanks

Michal
