From: David Miller <davem@davemloft.net>
Date: Mon, 22 Sep 2014 19:19:50 +0000
Subject: Re: [patch -next] r8169: fix an if condition
Message-Id: <20140922.151950.1466634293164677043.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140919104025.GA26391@mwanda>
In-Reply-To: <20140919104025.GA26391@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: nic_swsd@realtek.com, hayeswang@realtek.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Sep 2014 13:40:25 +0300

> There is an extra semi-colon so __rtl8169_set_features() is called every
> time.
> 
> Fixes: 929a031dfd62 ('r8169: adjust __rtl8169_set_features')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Dan, this bug exists in 'net' so that is what you should have
targetted this tree at.

Applied, thanks.
