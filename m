From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 26 Sep 2019 06:34:28 +0000
Subject: Re: [PATCH] bluetooth: hci_nokia: Save a few cycles in 'nokia_enqueue()'
Message-Id: <BC4B9659-D8B7-4583-9D1E-F412ED989948@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190919195208.2254-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190919195208.2254-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

> 'skb_pad()' a few lines above already initializes the "padded" byte to 0.
> So there is no need to do it twice.
> 
> All what is needed is to increase the len of the skb. So 'skb_put(..., 1)'
> is enough here.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> drivers/bluetooth/hci_nokia.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
