From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jul 2010 02:06:30 +0000
Subject: Re: [PATCH] cs89x0: Use the instance of net_device_stats from
Message-Id: <20100705.190630.179947727.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278331997-15826-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278331997-15826-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, joe@perches.com, shemminger@vyatta.com, julia@diku.dk, dongdong.deng@windriver.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon,  5 Jul 2010 16:13:15 +0400

> Since net_device has an instance of net_device_stats,
> we can remove the instance of this from the adapter structure.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
