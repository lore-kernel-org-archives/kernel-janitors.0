From: David Miller <davem@davemloft.net>
Date: Mon, 24 May 2010 06:50:16 +0000
Subject: Re: [patch] pppoe: uninitialized variable in pppoe_flush_dev()
Message-Id: <20100523.235016.15711522.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100522202534.GO22515@bicker>
In-Reply-To: <20100522202534.GO22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: mostrows@earthlink.net, eric.dumazet@gmail.com, jpirko@redhat.com, denys@visp.net.lb, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 22:27:48 +0200

> This assignment got deleted along with the checks by mistake.  This
> comes from:  8753d29fd "pppoe: remove unnecessary checks in
> pppoe_flush_dev"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.
