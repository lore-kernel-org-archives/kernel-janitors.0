From: David Miller <davem@davemloft.net>
Date: Mon, 08 May 2017 19:01:36 +0000
Subject: Re: [PATCH] net: dsa: loop: Check for memory allocation failure
Message-Id: <20170508.150136.1033006170371331565.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170506052945.2639-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170506052945.2639-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat,  6 May 2017 07:29:45 +0200

> If 'devm_kzalloc' fails, a NULL pointer will be dereferenced.
> Return -ENOMEM instead, as done for some other memory allocation just a
> few lines above.
> 
> Fixes: 98cd1552ea27 ("net: dsa: Mock-up driver")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Please do not separate "Fixes: " tags from signoffs and acks with
empty lines in the future, thank you.

Applied and queued up for -stable.
