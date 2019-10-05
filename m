From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sat, 05 Oct 2019 19:00:24 +0000
Subject: Re: [PATCH] rtlwifi: fix memory leak in rtl_usb_probe
Message-Id: <CAEkB2ERipLQRV3CsZ6L3EV0jXtS0HMc8yM6g5sNqJG0NThBsmw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004195315.21168-1-navid.emamdoost@gmail.com> <037d04e8-4651-a657-6be6-b1eca072bb81@web.de>
In-Reply-To: <037d04e8-4651-a657-6be6-b1eca072bb81@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Oh! It's duplicate, thanks for catching that.

On Sat, Oct 5, 2019 at 11:08 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > In rtl_usb_probe, a new hw is allocated via ieee80211_alloc_hw(). This
> > allocation should be released in case of allocation failure for
> > rtlpriv->usb_data.
> >
> > Fixes: a7959c1394d4 ("rtlwifi: Preallocate USB read buffers and eliminate kalloc in read routine")
>
> Which event did trigger the sending of this patch variant
> after a similar change was integrated already?
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id?93616951138a598d930dcaec40f2bfd9ce43bb
> https://lore.kernel.org/lkml/20191001092047.71E8460A30@smtp.codeaurora.org/
> https://lore.kernel.org/patchwork/comment/1331936/
>
> Regards,
> Markus



-- 
Navid.
