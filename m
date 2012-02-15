From: Luciano Coelho <coelho@ti.com>
Date: Wed, 15 Feb 2012 10:29:42 +0000
Subject: Re: [patch] wl12xx: remove some dead code in wl1271_plt_init()
Message-Id: <1329301782.19569.49.camel@cumari>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120208092004.GB6554@elgon.mountain>
In-Reply-To: <20120208092004.GB6554@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Shahar Levi <shahar_levi@ti.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2012-02-08 at 12:20 +0300, Dan Carpenter wrote: 
> "ret" has already been checked at this point, and we don't need to check
> it again.  This was left around from a previous patch 49d750ca14
> "wl12xx: 1281/1283 support - New radio structs and functions".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks, Dan!

-- 
Cheers,
Luca.

