From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Mon, 11 Jan 2016 19:25:30 +0000
Subject: Re: [PATCH] rtc: rtc-ds2404: constify ds2404_chip_ops structures
Message-Id: <20160111192530.GD3367@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451509174-6343-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451509174-6343-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Alessandro Zummo <a.zummo@towertech.it>, kernel-janitors@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

On 30/12/2015 at 21:59:34 +0100, Julia Lawall wrote :
> The ds2404_chip_ops structure is never modified, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/rtc/rtc-ds2404.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
