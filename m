From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Mar 2019 12:19:18 +0000
Subject: Re: [PATCH serial v3] sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
Message-Id: <20190311121918.GD2412@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190311093959.86344-1-maowenan@huawei.com>
In-Reply-To: <20190311093959.86344-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: gregkh@linuxfoundation.org, jslaby@suse.com, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, vz@mleia.com

On Mon, Mar 11, 2019 at 05:39:59PM +0800, Mao Wenan wrote:
> Add the missing uart_unregister_driver() and i2c_del_driver() before
> return from sc16is7xx_init() in the error handling case.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

This looks nice.  Thanks!

Reviewed-by: Dan Carpeter <dan.carpenter@oracle.com>

regards,
dan carpenter
