From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 10:04:58 +0000
Subject: Re: [PATCH] ptp: fix an IS_ERR() vs NULL check
Message-Id: <20181203100458.GZ3073@unbuntlaptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181130125834.u42dhxgof66rhya2@kili.mountain>
 <20181130163252.e6z33t23j3qud57z@localhost>
In-Reply-To: <20181130163252.e6z33t23j3qud57z@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 30, 2018 at 08:32:52AM -0800, Richard Cochran wrote:
> On Fri, Nov 30, 2018 at 03:58:34PM +0300, Dan Carpenter wrote:
> > The pps_register_source() function doesn't return NULL, it returns
> > error pointers.
> 
> It keeps a local variable for errno, but then it returns NULL.
> But this is about to change with this recent patch:
> 
>    26.Nov'18 YueHaibing [PATCH -next] pps: using ERR_PTR instead of NULL while pps_register_source fails
> 
> It hasn't been merged yet AFAICT, but gregkh said he take it.

Oh, yeah.  That patch has actually been applied, but we didn't update
the caller.  I should have made the Fixes tag point to that YueHaibing's
patch.

regards,
dan carpenter
