From: David Miller <davem@davemloft.net>
Date: Mon, 24 Apr 2017 17:59:05 +0000
Subject: Re: [PATCH net] ravb: Double free on error in ravb_start_xmit()
Message-Id: <20170424.135905.515581977383181185.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170422104656.jjnooh3or4x3lbw3@mwanda>
In-Reply-To: <20170422104656.jjnooh3or4x3lbw3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sergei.shtylyov@cogentembedded.com, kazuya.mizuguchi.ks@renesas.com, horms+renesas@verge.net.au, ykaneko0929@gmail.com, masaru.nagai.vx@renesas.com, geert+renesas@glider.be, niklas.soderlund+renesas@ragnatech.se, tremyfr@gmail.com, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Apr 2017 13:46:56 +0300

> If skb_put_padto() fails then it frees the skb.  I shifted that code
> up a bit to make my error handling a little simpler.
> 
> Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
