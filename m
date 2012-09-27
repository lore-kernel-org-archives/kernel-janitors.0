From: "Arend van Spriel" <arend@broadcom.com>
Date: Thu, 27 Sep 2012 10:49:44 +0000
Subject: Re: [patch] brcmfmac: use kcalloc() to prevent integer overflow
Message-Id: <50642F48.4060102@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926072148.GA3956@elgon.mountain>
In-Reply-To: <20120926072148.GA3956@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Hante Meuleman <meuleman@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

On 09/26/2012 09:21 AM, Dan Carpenter wrote:
> The multiplication here looks like it could overflow.  I've changed it
> to use kcalloc() to prevent that.
>
Acked-by: Arend van Spriel <arend@broadcom.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Only needed in linux-next.  This was added in e58060723c "brcmfmac:
> introduce scheduled scan support".

Better be safe than sorry. Thanks.

Gr. AvS

> diff --git a/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c b/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c


