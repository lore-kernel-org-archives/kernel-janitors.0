From: Krzysztof Halasa <khc@pm.waw.pl>
Date: Tue, 31 Jul 2007 19:47:21 +0000
Subject: Re: [PATCH 28] drivers/net/wan/hdlc_fr.c: kmalloc + memset conversion to kzalloc
Message-Id: <m34pjkqrsm.fsf@maximus.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
	<200707311949.52337.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311949.52337.m.kozlowski@tuxland.pl> (Mariusz Kozlowski's message of "Tue, 31 Jul 2007 19:49:52 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Mariusz Kozlowski <m.kozlowski@tuxland.pl> writes:

> +++ linux-2.6.23-rc1-mm1-b/drivers/net/wan/hdlc_fr.c	2007-07-30 00:25:40.000000000 +0200
> @@ -212,14 +212,13 @@ static pvc_device* add_pvc(struct net_de
>  		pvc_p = &(*pvc_p)->next;
>  	}
>
> -	pvc = kmalloc(sizeof(pvc_device), GFP_ATOMIC);
> +	pvc = kzalloc(sizeof(pvc_device), GFP_ATOMIC);
>  #ifdef DEBUG_PVC
>  	printk(KERN_DEBUG "add_pvc: allocated pvc %p, frad %p\n", pvc, dev);
>  #endif
>  	if (!pvc)
>  		return NULL;
>
> -	memset(pvc, 0, sizeof(pvc_device));

Looks good, thanks.
-- 
Krzysztof Halasa
