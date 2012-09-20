From: Anton Vorontsov <cbouatmailru@gmail.com>
Date: Thu, 20 Sep 2012 22:02:04 +0000
Subject: Re: [patch] da9052-battery: don't free IRQ that wasn't requested
Message-Id: <20120920220204.GE18223@lizard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123440.GF6128@elgon.mountain>
 <50475D75.2040908@bfs.de>
 <20120906150758.GL19410@mwanda>
In-Reply-To: <20120906150758.GL19410@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: walter harms <wharms@bfs.de>, Ashish Jangam <ashish.jangam@kpitcummins.com>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 06, 2012 at 08:07:58AM -0700, Dan Carpenter wrote:
[...]
> >    for (j=0; j <= i ;j++ ) {
>                ^^^^^^
> The count up loops are prone to the exact same off by one bugs.  ;)
> You've got one in your sample code.  Plus I'd have to declare
> another variable and send a v2 patch and I am very lazy...  So in
> this case I think should just take my original patch.

Applied, thank you!
