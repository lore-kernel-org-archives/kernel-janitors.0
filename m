From: Marcel Holtmann <marcel@holtmann.org>
Date: Mon, 22 May 2017 08:28:02 +0000
Subject: Re: [PATCH 0/2] ieee802154: ca8210: Adjustments for two function implementations
Message-Id: <9247C8F0-7FA1-4D02-96D5-DFB9753D7C05@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55fddbc7-28c4-8866-67d3-ff1ff1a4eeb7@users.sourceforge.net>
In-Reply-To: <55fddbc7-28c4-8866-67d3-ff1ff1a4eeb7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linuxdev@cascoda.com, linux-wpan@vger.kernel.org, Network Development <netdev@vger.kernel.org>, Alexander Aring <aar@pengutronix.de>, Harry Morris <h.morris@cascoda.com>, Stefan Schmidt <stefan@osg.samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus,

> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>  Delete an error message for a failed memory allocation in ca8210_probe()
>  Delete an error message for a failed memory allocation in ca8210_skb_rx()
> 
> drivers/net/ieee802154/ca8210.c | 9 ++-------
> 1 file changed, 2 insertions(+), 7 deletions(-)

both patches have been applied to bluetooth-next tree.

Regards

Marcel

