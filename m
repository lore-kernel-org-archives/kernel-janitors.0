From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 15 Dec 2016 21:13:50 +0000
Subject: Re: [bug report] ppdev: fix memory leak
Message-Id: <5853078E.90001@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161215210843.GA28981@elgon.mountain>
In-Reply-To: <20161215210843.GA28981@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 15 December 2016 09:08 PM, Dan Carpenter wrote:
> Hello Sudip Mukherjee,
>
> The patch 2bd362d5f45c: "ppdev: fix memory leak" from Nov 10, 2016,
> leads to the following static checker warning:
>
> 	drivers/char/ppdev.c:314 register_device()
> 	warn: passing freed memory 'name'

It is already done.
https://lkml.org/lkml/2016/12/2/400


--
Regards
Sudip
