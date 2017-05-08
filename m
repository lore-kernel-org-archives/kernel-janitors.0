From: Gustavo Padovan <gustavo@padovan.org>
Date: Mon, 08 May 2017 14:33:33 +0000
Subject: Re: [PATCH 4/4] dma-buf: Use seq_putc() in two functions
Message-Id: <20170508143333.GD28331@joana>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
 <609254ac-000d-c87c-eabc-7ca8814daf5c@users.sourceforge.net>
In-Reply-To: <609254ac-000d-c87c-eabc-7ca8814daf5c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org

Hi Markus,

Thank for your patches.

2017-05-08 SF Markus Elfring <elfring@users.sourceforge.net>:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 May 2017 10:55:42 +0200
> 
> Three single characters (line breaks) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/dma-buf/sync_debug.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.com>

Gustavo
