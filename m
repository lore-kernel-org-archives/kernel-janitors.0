From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Nov 2017 21:48:18 +0000
Subject: Re: [PATCH] staging: pi433: fix missing break in switch statement.
Message-Id: <20171109214818.r4mcizwmnmhyvo26@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171109171955.10911-1-colin.king@canonical.com>
In-Reply-To: <20171109171955.10911-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, Al Viro <viro@zeniv.linux.org.uk>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 09, 2017 at 05:19:55PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The PI433_IOC_WR_RX_CFG case is missing a break and will fall through
> to the default case and errorenously return -EINVAL. Fix this by
> adding in missing break.
> 

Could you fix PI433_IOC_RD_RX_CFG as well?  There is a missing return
statement if the copy_to_user() fails we fall through to here and error
out.

regards,
dan carpenter


