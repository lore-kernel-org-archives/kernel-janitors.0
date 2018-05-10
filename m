From: Igor Russkikh <igor.russkikh@aquantia.com>
Date: Thu, 10 May 2018 15:25:39 +0000
Subject: Re: [PATCH] net: aquantia: Fix an error handling path in 'aq_pci_probe()'
Message-Id: <f3df0dab-ea28-f30d-f0d4-7e2b4aee9276@aquantia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180508063947.11317-1-christophe.jaillet@wanadoo.fr>
 <a784ae7f-cd9c-4141-f862-0c01f61d0200@aquantia.com>
 <2369a016-547d-65e1-9ba7-9a6d16cda41a@wanadoo.fr>
In-Reply-To: <2369a016-547d-65e1-9ba7-9a6d16cda41a@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, davem@davemloft.net, pavel.belous@aquantia.com, weiyongjun1@huawei.com, dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


> Patch timing is sometimes surprising!

Indeed it.

> 
> Not sure at all if it can be an issue, but I also noted that the order of 'pci_release_regions()' and 'free_netdev()' is in reverse
> order in the 'aq_pci_remove()' function.
> I don't know if done on purpose and/or needed, so I've left it as-is.

I think the order is not important here, so believe thats merely a cosmetics.

BR, Igor
