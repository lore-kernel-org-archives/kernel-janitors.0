From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jul 2010 02:07:20 +0000
Subject: Re: [PATCH] lance: Use the instance of net_device_stats from
Message-Id: <20100705.190720.116357117.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278332046-17195-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278332046-17195-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, joe@perches.com, shemminger@vyatta.com, eric.dumazet@gmail.com, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon,  5 Jul 2010 16:14:03 +0400

> Since net_device has an instance of net_device_stats,
> we can remove the instance of this from the adapter structure.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
