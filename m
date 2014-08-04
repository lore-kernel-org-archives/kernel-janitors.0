From: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 04 Aug 2014 21:15:54 +0000
Subject: Re: [patch] mtd: ndfc: silence an array underflow static checker warning
Message-Id: <20140804211554.GW3711@ld-irv-0074>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140731153620.GH31539@mwanda>
In-Reply-To: <20140731153620.GH31539@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@linaro.org>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Woodhouse <dwmw2@infradead.org>

On Thu, Jul 31, 2014 at 06:36:20PM +0300, Dan Carpenter wrote:
> We check "cs" for array overflows but we don't check for underflows and
> it upsets the static checkers.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued to l2-mtd.git/next.

Brian
