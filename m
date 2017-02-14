From: David Miller <davem@davemloft.net>
Date: Tue, 14 Feb 2017 03:21:22 +0000
Subject: Re: [patch net-next] net: qcom/emac: fix a sizeof() typo
Message-Id: <20170213.222122.338973843065896613.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170213110021.GA17205@mwanda>
In-Reply-To: <20170213110021.GA17205@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: timur@codeaurora.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Feb 2017 14:00:22 +0300

> We had intended to say "sizeof(u32)" but the "u" is missing.
> Fortunately, sizeof(32) is also 4, so the original code still works.
> 
> Fixes: c4e7beea2192 ("net: qcom/emac: add ethtool support for reading hardware registers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
