From: Luciano Coelho <coelho@ti.com>
Date: Thu, 03 May 2012 12:53:54 +0000
Subject: Re: [patch] wlcore: release lock on error in wl1271_op_suspend()
Message-Id: <1336049634.12189.28.camel@cumari.coelho.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120416105702.GA25234@elgon.mountain>
In-Reply-To: <20120416105702.GA25234@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Eliad Peller <eliad@wizery.com>, Arik Nemtsov <arik@wizery.com>, Shahar Levi <shahar_levi@ti.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2012-04-16 at 13:57 +0300, Dan Carpenter wrote:
> We should release this lock before returning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan!

