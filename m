From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 08 Jul 2010 14:24:20 +0000
Subject: Re: [PATCH 3/4] ll_temac: free everything on error path
Message-Id: <20100708142418.GA30052@shinshilla>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278591012-3213-1-git-send-email-segooon@gmail.com>
 <AANLkTilm1b61ikLi28We3aLrF3Ld4c05oFZlh3K1pORe@mail.gmail.com>
 <20100708134651.GA27196@shinshilla>
 <AANLkTilMaITOMsn_9MmZ7-zHwpvTd2ZYjj4UUWOloYsn@mail.gmail.com>
In-Reply-To: <AANLkTilMaITOMsn_9MmZ7-zHwpvTd2ZYjj4UUWOloYsn@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dkirjanov@kernel.org
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, John Linn <john.linn@xilinx.com>, Grant Likely <grant.likely@secretlab.ca>, Jiri Pirko <jpirko@redhat.com>, Brian Hill <brian.hill@xilinx.com>, netdev@vger.kernel.org

> I just sent a patch that fixes this.
Hey, you forgot to CC me/kernel-janitors in your patch.

Anyway,
> /**
>+ *  * temac_dma_bd_release - Release buffer descriptor rings
>+ */
>+static void temac_dma_bd_release(struct net_device *ndev)
>+{
>+   struct temac_local *lp = netdev_priv(ndev);
>+   int i;
>+
>+   for (i = 0; i < RX_BD_NUM; i++) {
>+       if (lp->rx_skb[i]) {
            ^^^^^^^^^^
This can be NULL if kzalloc() failed.
>+           dma_unmap_single(ndev->dev.parent, lp->rx_bd_v[i].phys,
>+                   XTE_MAX_JUMBO_FRAME_SIZE, DMA_FROM_DEVICE);
>+           dev_kfree_skb(lp->rx_skb[i]);
>+       }
>+   }
>+   dma_free_coherent(ndev->dev.parent, sizeof(*lp->rx_bd_v) * RX_BD_NUM,
>+           lp->rx_bd_v, lp->rx_bd_p);
>+   dma_free_coherent(ndev->dev.parent, sizeof(*lp->tx_bd_v) * TX_BD_NUM,
>+           lp->tx_bd_v, lp->tx_bd_p);

These two DMA's can be unallocated if dma_alloc_coherent() failed.

I wanted to introduce many labels to divide these error cases because of it.

>+   kfree(lp->rx_skb);
>+}
