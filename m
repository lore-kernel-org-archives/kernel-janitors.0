From: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Date: Sat, 31 Aug 2019 08:19:00 +0000
Subject: Re: [PATCH] net: seeq: Fix the function used to release some memory in an error handling path
Message-Id: <20190831101900.c3f8881c1bbebf870eed9c68@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831071751.1479-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190831071751.1479-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, yuehaibing@huawei.com, tglx@linutronix.de, gregkh@linuxfoundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 31 Aug 2019 09:17:51 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> In commit 99cd149efe82 ("sgiseeq: replace use of dma_cache_wback_inv"),
> a call to 'get_zeroed_page()' has been turned into a call to
> 'dma_alloc_coherent()'. Only the remove function has been updated to turn
> the corresponding 'free_page()' into 'dma_free_attrs()'.
> The error hndling path of the probe function has not been updated.

Looks good.

Reviewed-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>

Thomas.

--=20
SUSE Software Solutions Germany GmbH
HRB 247165 (AG M=FCnchen)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
