From: Gustavo Padovan <gustavo@padovan.org>
Date: Mon, 08 May 2017 14:32:26 +0000
Subject: Re: [PATCH 3/4] dma-buf: Adjust a null pointer check in dma_buf_attach()
Message-Id: <20170508143226.GC28331@joana>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
 <1deb58e7-7eac-55d6-235a-baf72f392371@users.sourceforge.net>
In-Reply-To: <1deb58e7-7eac-55d6-235a-baf72f392371@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org

2017-05-08 SF Markus Elfring <elfring@users.sourceforge.net>:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 May 2017 10:54:17 +0200
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> Comparison to NULL could be written "!attach"
> 
> Thus adjust this expression.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/dma-buf/dma-buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.com>

Gustavo

