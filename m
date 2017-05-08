From: Gustavo Padovan <gustavo@padovan.org>
Date: Mon, 08 May 2017 14:31:15 +0000
Subject: Re: [PATCH 1/4] dma-buf: Combine two function calls into one in dma_buf_debug_show()
Message-Id: <20170508143115.GA28331@joana>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
 <b8a85220-039a-e4bb-c74b-d76baab234e8@users.sourceforge.net>
In-Reply-To: <b8a85220-039a-e4bb-c74b-d76baab234e8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org

2017-05-08 SF Markus Elfring <elfring@users.sourceforge.net>:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 May 2017 10:32:44 +0200
> 
> A bit of data was put into a sequence by two separate function calls.
> Print the same data by a single function call instead.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/dma-buf/dma-buf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.com>

Gustavo

