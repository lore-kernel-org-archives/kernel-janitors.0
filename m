From: David Miller <davem@davemloft.net>
Date: Sun, 11 Jul 2010 02:42:23 +0000
Subject: Re: [PATCH 1/2] 82596: do not panic on out of memory
Message-Id: <20100710.194223.15248752.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278678323-6848-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278678323-6848-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, jpirko@redhat.com, shemminger@vyatta.com, eric.dumazet@gmail.com, andre.goddard@gmail.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri,  9 Jul 2010 16:25:22 +0400

> If dev_alloc_skb() failed then free already allocated skbs.
> remove_rx_bufs() can be called multiple times, so set rbd->skb to NULL
> to avoid double free. remove_rx_bufs() was moved upwards to be seen by
> init_rx_bufs().
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied to net-next-2.6
