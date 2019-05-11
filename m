From: Felix Fietkau <nbd@nbd.name>
Date: Sat, 11 May 2019 13:28:59 +0000
Subject: Re: [PATCH] mt76: Fix a signedness bug in mt7615_add_interface()
Message-Id: <c554f3b8-e46d-9137-ad06-c31f7961a958@nbd.name>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190502212341.GA31847@mwanda>
In-Reply-To: <20190502212341.GA31847@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 2019-05-03 14:54, Dan Carpenter wrote:
> The problem is that "mvif->omac_idx" is a u8 so it can't be negative
> and the error handling won't work.  The get_omac_idx() function returns
> -1 on error.
> 
> Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Applied, thanks.

- Felix
