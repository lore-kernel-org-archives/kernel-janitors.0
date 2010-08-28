From: David Miller <davem@davemloft.net>
Date: Sat, 28 Aug 2010 22:37:21 +0000
Subject: Re: [PATCH] econet: kill unnecessary spin_lock_init()
Message-Id: <20100828.153721.59667226.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282963316-29938-1-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1282963316-29938-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akinobu.mita@gmail.com
Cc: kernel-janitors@vger.kernel.org, julia@diku.dk, netdev@vger.kernel.org

From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Sat, 28 Aug 2010 11:41:56 +0900

> The spinlock aun_queue_lock is initialized statically. It is unnecessary
> to initialize by spin_lock_init() at module load time.
> 
> This is detected by the semantic patch.
 ...
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Julia Lawall <julia@diku.dk>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: netdev@vger.kernel.org

Applied.
