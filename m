From: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 06 May 2017 14:45:19 +0000
Subject: Re: [PATCH] net: dsa: loop: Check for memory allocation failure
Message-Id: <20170506144519.GA23180@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170506052945.2639-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170506052945.2639-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 06, 2017 at 07:29:45AM +0200, Christophe JAILLET wrote:
> If 'devm_kzalloc' fails, a NULL pointer will be dereferenced.
> Return -ENOMEM instead, as done for some other memory allocation just a
> few lines above.
> 
> Fixes: 98cd1552ea27 ("net: dsa: Mock-up driver")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
