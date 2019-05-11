From: Felix Fietkau <nbd@nbd.name>
Date: Sat, 11 May 2019 13:31:34 +0000
Subject: Re: [PATCH][next] mt76: fix less than zero check on a u8 variable
Message-Id: <a0d21c98-9421-547f-6dd9-5153812107e5@nbd.name>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190505213135.3895-1-colin.king@canonical.com>
In-Reply-To: <20190505213135.3895-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Roy Luo <royluo@google.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2019-05-05 23:31, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The signed return from the call to get_omac_idx is being assigned to the
> u8 variable mac_idx and then checked for a negative error condition
> which is always going to be false. Fix this by assigning the return to
> the int variable ret and checking this instead.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Already fixed by a similar patch by Dan Carpenter.

- Felix
