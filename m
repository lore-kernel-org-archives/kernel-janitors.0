From: David Miller <davem@davemloft.net>
Date: Thu, 16 Jul 2015 00:20:46 +0000
Subject: Re: [PATCH] net: qlcnic: Deletion of unnecessary memset
Message-Id: <20150715.172046.1479959081115644674.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fad6a2ad1e78d8e2624903524548f8d806bf1ef0.1436816968.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <fad6a2ad1e78d8e2624903524548f8d806bf1ef0.1436816968.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: shahed.shaikh@qlogic.com, Dept-GELinuxNICDev@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Jul 2015 21:51:38 +0200

> There is no need to memset memory allocated with vzalloc.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied and queued up for -stable, thanks.
