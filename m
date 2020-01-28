From: Marcel Holtmann <marcel@holtmann.org>
Date: Tue, 28 Jan 2020 07:03:56 +0000
Subject: Re: [PATCH] Bluetooth: SMP: Fix SALT value in some comments
Message-Id: <03F1C6B2-0F04-4991-8912-7220F9F88F5C@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200127223609.15066-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200127223609.15066-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, kuba@kernel.org, "David S. Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

> Salts are 16 bytes long.
> Remove some extra and erroneous '0' in the human readable format used
> in comments.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> net/bluetooth/smp.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
