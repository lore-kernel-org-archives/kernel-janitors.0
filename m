From: David Miller <davem@davemloft.net>
Date: Fri, 01 May 2020 03:24:22 +0000
Subject: Re: [PATCH] net: moxa: Fix a potential double 'free_irq()'
Message-Id: <20200430.202422.549223229334559883.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426205921.47714-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200426205921.47714-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jonas.jensen@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Apr 2020 22:59:21 +0200

> Should an irq requested with 'devm_request_irq' be released explicitly,
> it should be done by 'devm_free_irq()', not 'free_irq()'.
> 
> Fixes: 6c821bd9edc9 ("net: Add MOXA ART SoCs ethernet driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.
