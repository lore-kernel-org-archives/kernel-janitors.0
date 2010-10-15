From: Samuel Ortiz <samuel@sortiz.org>
Date: Fri, 15 Oct 2010 13:48:44 +0000
Subject: Re: [PATCH 1/7] drivers/net/irda/irtty-sir.c: Return -ENOMEM on
Message-Id: <1287150524.2608.0.camel@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287147610-8041-1-git-send-email-julia@diku.dk>
In-Reply-To: <1287147610-8041-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Fri, 2010-10-15 at 15:00 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> In this code, 0 is returned on memory allocation failure, even though other
> failures return -ENOMEM or other similar values.
> 
> The initial value of ret as 0 is never used, so drop the initialization.
Thanks, patch applied to my irda-2.6 tree.

Cheers,
Samuel.


