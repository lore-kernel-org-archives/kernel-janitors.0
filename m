From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Sun, 22 Sep 2019 21:17:56 +0000
Subject: Re: [PATCH net] ionic: Fix an error code in ionic_lif_alloc()
Message-Id: <20190922141756.2646371c@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190921055926.GA18726@mwanda>
In-Reply-To: <20190921055926.GA18726@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shannon Nelson <snelson@pensando.io>, Pensando Drivers <drivers@pensando.io>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 21 Sep 2019 08:59:26 +0300, Dan Carpenter wrote:
> We need to set the error code on this path.  Otherwise it probably
> results in a NULL dereference down the line.
> 
> Fixes: aa3198819bea ("ionic: Add RSS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you!
