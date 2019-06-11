From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Tue, 11 Jun 2019 08:02:34 +0000
Subject: Re: [PATCH] usb/hcd: Fix a NULL vs IS_ERR() bug in usb_hcd_setup_local_mem()
Message-Id: <20190611080233.goirgth76ftqpfyf@linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190607135709.GC16718@mwanda>
In-Reply-To: <20190607135709.GC16718@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Dmitry Torokhov <dtor@chromium.org>, Suwan Kim <suwan.kim027@gmail.com>, Raul E Rangel <rrangel@chromium.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2019-06-07 16:57:09 [+0300], Dan Carpenter wrote:
> The devm_memremap() function doesn't return NULL, it returns error
> pointers.
> 
> Fixes: b0310c2f09bb ("USB: use genalloc for USB HCs with local memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
