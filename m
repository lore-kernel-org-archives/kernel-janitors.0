From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Thu, 27 Apr 2017 14:04:06 +0000
Subject: Re: [PATCH] usb: gadget: udc-xilinx: clean up a variable name
Message-Id: <20170427140406.zdv32vgmjppdaiyd@xsjsorenbubuntu.xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170427091118.tm53zsyq53hhbzws@mwanda>
In-Reply-To: <20170427091118.tm53zsyq53hhbzws@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@xilinx.com>, Wolfram Sang <wsa-dev@sang-engineering.com>, Michal Nazarewicz <mina86@mina86.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2017-04-27 at 12:11:18 +0300, Dan Carpenter wrote:
> "ep->udc->lock" and "udc->lock" are the same thing.  It confuses Smatch
> if we don't use the same name consistently.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Sören Brinkmann <soren.brinkmann@xilinx.com>

	Sören
