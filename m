From: Johan Hovold <johan@kernel.org>
Date: Fri, 01 Nov 2019 11:41:53 +0000
Subject: Re: [PATCH -next] serial: uartlite: Missing uart_unregister_driver() on error in ulite_probe()
Message-Id: <20191101114153.GC3657@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191101111950.47817-1-maowenan@huawei.com>
In-Reply-To: <20191101111950.47817-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: jacmet@sunsite.dk, gregkh@linuxfoundation.org, jslaby@suse.com, shubhrajyoti.datta@xilinx.com, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 01, 2019 at 07:19:50PM +0800, Mao Wenan wrote:
> If uart_register_driver(&ulite_uart_driver) is success,
> but followed function is failed in ulite_probe, it needs to call
> uart_unregister_driver to unregister.
> 
> Fixes: f33cf776617b ("serial-uartlite: Move the uart register")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

No, this is broken. The driver is deregistered at module unload.

That said, f33cf776617b ("serial-uartlite: Move the uart register")
should never have been merged as I have pointed out before:

	https://lkml.kernel.org/r/20190523091839.GC568@localhost

I'll see if I can find some time to revisit this and start yelling at
Xilinx people again.

Johan
