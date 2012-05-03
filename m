From: Luciano Coelho <coelho@ti.com>
Date: Thu, 03 May 2012 12:54:55 +0000
Subject: Re: [patch] wlcore: fixup an allocation
Message-Id: <1336049695.12189.29.camel@cumari.coelho.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120417062847.GA26756@elgon.mountain>
In-Reply-To: <20120417062847.GA26756@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Eliad Peller <eliad@wizery.com>, Arik Nemtsov <arik@wizery.com>, Shahar Levi <shahar_levi@ti.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2012-04-17 at 09:28 +0300, Dan Carpenter wrote:
> GFP_DMA isn't supposed to be used by itself.  This allocation is allowed
> to sleep so it should be ORing it with GFP_KERNEL.
> Also we should check for allocations errors.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I don't have the hardware to test this.  Sorry.

Applied, thanks! I ran some very basic tests on it.

