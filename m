From: David Miller <davem@davemloft.net>
Date: Mon, 13 Sep 2010 19:45:01 +0000
Subject: Re: [patch] net/llc: make opt unsigned in llc_ui_setsockopt()
Message-Id: <20100913.124501.59676416.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100910115616.GD5959@bicker>
In-Reply-To: <20100910115616.GD5959@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: acme@ghostprotocols.net, opurdila@ixiacom.com, shemminger@vyatta.com, eric.dumazet@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Sep 2010 13:56:16 +0200

> The members of struct llc_sock are unsigned so if we pass a negative
> value for "opt" it can cause a sign bug.  Also it can cause an integer
> overflow when we multiply "opt * HZ".
> 
> CC: stable@kernel.org
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
