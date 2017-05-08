From: Gustavo Padovan <gustavo@padovan.org>
Date: Mon, 08 May 2017 14:31:51 +0000
Subject: Re: [PATCH 2/4] dma-buf: Improve a size determination in dma_buf_attach()
Message-Id: <20170508143151.GB28331@joana>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
 <cff83dc6-4391-d9b1-6ac2-791d5a3e2eb4@users.sourceforge.net>
In-Reply-To: <cff83dc6-4391-d9b1-6ac2-791d5a3e2eb4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org

2017-05-08 SF Markus Elfring <elfring@users.sourceforge.net>:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 May 2017 10:50:09 +0200
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/dma-buf/dma-buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.com>                    

Gustavo
 
