From: Luciano Coelho <luciano.coelho@nokia.com>
Date: Tue, 21 Dec 2010 09:44:25 +0000
Subject: Re: [patch -next] wl12xx: use after free in debug code
Message-Id: <1292924665.19436.12.camel@chilepepper>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101221040012.GD1936@bicker>
In-Reply-To: <20101221040012.GD1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ext Dan Carpenter <error27@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Shahar Levi <shahar_levi@ti.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2010-12-21 at 07:00 +0300, ext Dan Carpenter wrote:
> If debugging is turned on, then wl1271_dump() dereferences a freed
> variable.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thank you!


-- 
Cheers,
Luca.

