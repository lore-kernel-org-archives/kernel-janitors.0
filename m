From: David Miller <davem@davemloft.net>
Date: Wed, 25 Aug 2010 23:37:11 +0000
Subject: Re: [patch] plip: remove superflous return
Message-Id: <20100825.163711.229731651.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100824120105.GF29330@bicker>
In-Reply-To: <20100824120105.GF29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, joe@perches.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 14:01:05 +0200

> This return isn't reachable and it obscures the goto on the line before.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
