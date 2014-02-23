From: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 23 Feb 2014 02:27:28 +0000
Subject: Re: [patch] mtd: remove some duplicative checks
Message-Id: <20140223022728.GE11836@norris-Latitude-E6410>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140213112144.GD15549@elgon.mountain>
In-Reply-To: <20140213112144.GD15549@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On Thu, Feb 13, 2014 at 02:21:44PM +0300, Dan Carpenter wrote:
> "rc" is an error code here, no need to check it a second time.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git. Thanks!

Brian
