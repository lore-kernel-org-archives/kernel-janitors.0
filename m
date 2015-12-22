From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 22 Dec 2015 18:58:33 +0000
Subject: Re: [PATCH] rtc: v3020: constify v3020_chip_ops structures
Message-Id: <20151222185833.GD8623@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449856250-24732-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1449856250-24732-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Alessandro Zummo <a.zummo@towertech.it>, kernel-janitors@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

On 11/12/2015 at 18:50:50 +0100, Julia Lawall wrote :
> The v3020_chip_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/rtc/rtc-v3020.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
