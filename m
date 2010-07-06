From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jul 2010 02:07:14 +0000
Subject: Re: [PATCH] ksz884x: Use the instance of net_device_stats from
Message-Id: <20100705.190714.242154921.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278332040-17160-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278332040-17160-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, eric.dumazet@gmail.com, jpirko@redhat.com, dkirjanov@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon,  5 Jul 2010 16:13:58 +0400

> Since net_device has an instance of net_device_stats,
> we can remove the instance of this from the adapter structure.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
