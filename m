From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 10 May 2018 14:38:27 +0000
Subject: Re: [PATCH] net: aquantia: Fix an error handling path in 'aq_pci_probe()'
Message-Id: <2369a016-547d-65e1-9ba7-9a6d16cda41a@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180508063947.11317-1-christophe.jaillet@wanadoo.fr>
 <a784ae7f-cd9c-4141-f862-0c01f61d0200@aquantia.com>
In-Reply-To: <a784ae7f-cd9c-4141-f862-0c01f61d0200@aquantia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Igor Russkikh <igor.russkikh@aquantia.com>, davem@davemloft.net, pavel.belous@aquantia.com, weiyongjun1@huawei.com, dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 08/05/2018 à 09:19, Igor Russkikh a écrit :
>
> This was just submitted yesterday and is already accepted in netdev by David:
>
> http://patchwork.ozlabs.org/patch/909746/
>
> Thanks!
>
> BR, Igor
>
Patch timing is sometimes surprising!

Not sure at all if it can be an issue, but I also noted that the order 
of 'pci_release_regions()' and 'free_netdev()' is in reverse
order in the 'aq_pci_remove()' function.
I don't know if done on purpose and/or needed, so I've left it as-is.

CJ

