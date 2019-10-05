From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 16:08:36 +0000
Subject: Re: [PATCH] rtlwifi: fix memory leak in rtl_usb_probe
Message-Id: <037d04e8-4651-a657-6be6-b1eca072bb81@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004195315.21168-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004195315.21168-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In rtl_usb_probe, a new hw is allocated via ieee80211_alloc_hw(). This
> allocation should be released in case of allocation failure for
> rtlpriv->usb_data.
>
> Fixes: a7959c1394d4 ("rtlwifi: Preallocate USB read buffers and eliminate kalloc in read routine")

Which event did trigger the sending of this patch variant
after a similar change was integrated already?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id?93616951138a598d930dcaec40f2bfd9ce43bb
https://lore.kernel.org/lkml/20191001092047.71E8460A30@smtp.codeaurora.org/
https://lore.kernel.org/patchwork/comment/1331936/

Regards,
Markus
