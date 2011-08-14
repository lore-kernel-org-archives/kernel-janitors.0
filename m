From: David Miller <davem@davemloft.net>
Date: Sun, 14 Aug 2011 01:01:43 +0000
Subject: Re: [PATCH] drivers/net/can/sja1000/plx_pci.c: eliminate double
Message-Id: <20110813.180143.2121863777626096757.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312820931-28230-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312820931-28230-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: wg@grandegger.com, kernel-janitors@vger.kernel.org, joe@perches.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Mon,  8 Aug 2011 18:28:50 +0200

> From: Julia Lawall <julia@diku.dk>
> 
> In this code, the failure_cleanup label calls the function
> plx_pci_del_card, which frees everything in the card->net_dev array.  dev
> is placed in this array immediately after allocation, so the two subsequent
> jumps to failure_cleanup should not also call free_sja1000dev, but the
> second one does.
> 
> If plx_pci_check_sja1000 fails, then free_sja1000dev is also called on
> dev.  Because dev is already in the card->net_dev array, this implies that
> when plx_pci_del_card is later called, it may get freed again.  So that
> entry is reset to NULL after the free.
> 
> Finally, if there is a problem with one channel, there will be a hole in the
> array.  card->channels counts the number of channels that have succeeded,
> and does not keep track of the index of the largest element in the array
> that is valid.  So the loop in plx_pci_del_card is changed to go up to
> PLX_PCI_MAX_CHAN, which is only 2.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
