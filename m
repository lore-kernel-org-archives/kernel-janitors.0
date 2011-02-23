From: Luciano Coelho <coelho@ti.com>
Date: Wed, 23 Feb 2011 13:52:50 +0000
Subject: Re: [patch] wl12xx: change type from u8 to int
Message-Id: <1298469170.2104.21.camel@pimenta>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110207164742.GE4384@bicker>
In-Reply-To: <20110207164742.GE4384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: shahar_levi@ti.com, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2011-02-07 at 19:47 +0300, Dan Carpenter wrote:
> ret is used to store int types.  Using an u8 will break the error
> handling.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan!

-- 
Cheers,
Luca.

