From: David Miller <davem@davemloft.net>
Date: Tue, 13 Jul 2010 03:33:27 +0000
Subject: Re: [PATCH] tc35815: fix iomap leak
Message-Id: <20100712.203327.135522958.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278756199-4636-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278756199-4636-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, anemo@mba.ocn.ne.jp, jpirko@redhat.com, eric.dumazet@gmail.com, adobriyan@gmail.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 10 Jul 2010 14:03:18 +0400

> If tc35815_init_one() fails we must unmap mapped regions.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
