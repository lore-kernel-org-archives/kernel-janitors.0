From: David Miller <davem@davemloft.net>
Date: Sun, 11 Jul 2010 02:42:30 +0000
Subject: Re: [PATCH 2/2] 82596: free resources on error
Message-Id: <20100710.194230.242142024.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278678340-6889-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278678340-6889-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, jpirko@redhat.com, shemminger@vyatta.com, eric.dumazet@gmail.com, andre.goddard@gmail.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri,  9 Jul 2010 16:25:40 +0400

> IRQ 56 was not freed anywhere (neither in i596_open() on error nor in
> i596_close()), rx_bufs were not freed if init_i596_mem() fails,
> netif_stop_queue() was not called.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied to net-next-2.6
