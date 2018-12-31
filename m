From: Felix Fietkau <nbd@nbd.name>
Date: Mon, 31 Dec 2018 14:41:21 +0000
Subject: Re: [PATCH] mt76: make const array 'data' static, shrinks object size
Message-Id: <453b64e0-220e-69a8-c855-51903707a88b@nbd.name>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181230132640.6916-1-colin.king@canonical.com>
In-Reply-To: <20181230132640.6916-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2018-12-30 14:26, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array 'data' on the stack but instead
> make it static. Makes the object code smaller by 78 bytes:
> 
> Before:
>    text    data     bss     dec     hex filename
>    5438    1080       0    6518    1976 mediatek/mt76/mt76x2/usb_mcu.o
> 
> After:
>    text    data     bss     dec     hex filename
>    5296    1144       0    6440    1928 mediatek/mt76/mt76x2/usb_mcu.o
> 
> (gcc version 8.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Applied, thanks.

- Felix
