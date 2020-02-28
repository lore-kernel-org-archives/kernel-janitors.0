From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 28 Feb 2020 07:44:25 +0000
Subject: Re: [PATCH] Bluetooth: hci_h4: Remove a redundant assignment in 'h4_flush()'
Message-Id: <90F8751D-D5A0-4503-B15D-392CCF8A8AEB@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228050113.25041-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200228050113.25041-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

> 'hu->priv' is set twice to NULL in this function.
> Axe one of these assignments.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> drivers/bluetooth/hci_h4.c | 2 --
> 1 file changed, 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
