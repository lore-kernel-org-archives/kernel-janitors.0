From: Luciano Coelho <coelho@ti.com>
Date: Sun, 08 Jul 2012 13:12:25 +0000
Subject: Re: [patch] wlcore: fix a couple small memory leaks
Message-Id: <1341753145.4354.41.camel@cumari.coelho.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120630120755.GC22767@elgon.mountain>
In-Reply-To: <20120630120755.GC22767@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Arik Nemtsov <arik@wizery.com>, Eliad Peller <eliad@wizery.com>, Ido Yariv <ido@wizery.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2012-06-30 at 15:07 +0300, Dan Carpenter wrote:
> We should free "chunk" here before returning the error code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and pushed, thanks a lot, Dan!

--
Luca.

