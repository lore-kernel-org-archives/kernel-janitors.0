From: David Miller <davem@davemloft.net>
Date: Mon, 12 Aug 2019 03:57:19 +0000
Subject: Re: [PATCH] nfc: st-nci: Fix an incorrect skb_buff size in 'st_nci_i2c_read()'
Message-Id: <20190811.205719.198343441735959015.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190806141640.13197-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190806141640.13197-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: tglx@linutronix.de, gregkh@linuxfoundation.org, colin.king@canonical.com, allison@lohutok.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue,  6 Aug 2019 16:16:40 +0200

> In 'st_nci_i2c_read()', we allocate a sk_buff with a size of
> ST_NCI_I2C_MIN_SIZE + len.
> 
> However, later on, we first 'skb_reserve()' ST_NCI_I2C_MIN_SIZE bytes, then
> we 'skb_put()' ST_NCI_I2C_MIN_SIZE bytes.
> Finally, if 'len' is not 0, we 'skb_put()' 'len' bytes.
> 
> So we use ST_NCI_I2C_MIN_SIZE*2 + len bytes.
> 
> This is incorrect and should already panic. I guess that it does not occur
> because of extra memory allocated because of some rounding.
> 
> Fix it and allocate enough room for the 'skb_reserve()' and the 'skb_put()'
> calls.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is LIKELY INCORRECT. So think twice to what is the correct
> solution before applying it.
> Maybe the skb_reserve should be axed or some other sizes are incorrect.
> There seems to be an issue, that's all I can say.

The skb_reserve() should be removed, and the second memcpy() should remove
the " + ST_NCI_I2C_MIN_SIZE".

This SKB just get sent down to ndlc_recv() so the content returned from I2C
should places at skb->data to be processed.

Pretty clear this code was never tested.
