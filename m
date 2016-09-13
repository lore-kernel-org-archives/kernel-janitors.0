From: David Miller <davem@davemloft.net>
Date: Tue, 13 Sep 2016 16:06:36 +0000
Subject: Re: [PATCH] drivers: net: phy: xgene: Fix 'remove' function
Message-Id: <20160913.120636.145288761809547250.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473623014-7801-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1473623014-7801-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: isubramanian@apm.com, kchudgar@apm.com, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 11 Sep 2016 21:43:34 +0200

> If 'IS_ERR(pdata->clk)' is true, then 'clk_disable_unprepare(pdata->clk)'
> will do nothing.
> 
> It is likely that 'if (!IS_ERR(pdata->clk))' was expected here.
> In fact, the test can even be removed because 'clk_disable_unprepare'
> already handles such cases.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
