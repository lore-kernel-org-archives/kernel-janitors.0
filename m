From: David Miller <davem@davemloft.net>
Date: Mon, 20 Feb 2017 15:33:59 +0000
Subject: Re: [PATCH] net: mvpp2: Fix a memory leak in error handling path
Message-Id: <20170220.103359.1862376843340449706.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219091957.8035-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170219091957.8035-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jszhang@marvell.com, tremyfr@gmail.com, f.fainelli@gmail.com, edumazet@google.com, thomas.petazzoni@free-electrons.com, arnd@arndb.de, jarod@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Feb 2017 10:19:57 +0100

> if 'devm_kzalloc()' fails, we should release resources allocated so far,
> just as done a few lines below.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
