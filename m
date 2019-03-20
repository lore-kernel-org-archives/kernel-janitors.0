From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 20 Mar 2019 05:15:22 +0000
Subject: Re: [PATCH serial v4] sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
Message-Id: <20190320051522.GC16864@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190320022531.189437-1-maowenan@huawei.com>
In-Reply-To: <20190320022531.189437-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Mar 20, 2019 at 10:25:31AM +0800, Mao Wenan wrote:
> Add the missing uart_unregister_driver() and i2c_del_driver() before
> return from sc16is7xx_init() in the error handling case.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Reviewed-by: Dan Carpeter <dan.carpenter@oracle.com>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  v1->v2: fix compile warning if CONFIG_SERIAL_SC16IS7XX_SPI is not exist.
>  v2->v3: create functions for i2c and spi to do error handling as dan carpenter suggestion.
>  v3->v4: As Greg suggestion, v4 is based on v1 and v3. 
>  drivers/tty/serial/sc16is7xx.c | 46 ++++++++++++++++++++++------------

Please use scripts/get_maintainers.pl for who to send patches to, and
what mailing list to cc: in the future.

thanks,

greg k-h
