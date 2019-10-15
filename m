From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 15 Oct 2019 05:28:04 +0000
Subject: Re: =?utf-8?q?=5BPATCH=5D_net/wireless=3A_Delete_unnecessary_checks_bef?==?utf-8?q?ore_the_macro_cal
Message-Id: <20191015052805.0C01F60BDD@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea6c6fef-9868-196b-d914-23faf12d7f5c@web.de>
In-Reply-To: <ea6c6fef-9868-196b-d914-23faf12d7f5c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Roy Luo <royluo@google.com>, Ryder Lee <ryder.lee@mediatek.com>, Solomon Peachy <pizza@shaftnet.org>, Stanislaw Gruszka <sgruszka@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 22 Aug 2019 10:20:10 +0200
> 
> The dev_kfree_skb() function performs also input parameter validation.
> Thus the test around the shown calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied to wireless-drivers-next.git, thanks.

868ad2149602 net/wireless: Delete unnecessary checks before the macro call “dev_kfree_skb”

-- 
https://patchwork.kernel.org/patch/11108741/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
