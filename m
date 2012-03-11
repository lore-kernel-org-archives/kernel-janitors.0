From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 11 Mar 2012 23:06:26 +0000
Subject: Re: [PATCH 6/7] drivers/input/touchscreen/hp680_ts_input.c: ensure arguments to request_irq and free
Message-Id: <20120311230626.GA5584@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331494587-12196-1-git-send-email-Julia.Lawall@lip6.fr>
 <1331494587-12196-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331494587-12196-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Mar 11, 2012 at 08:36:26PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Change 0 to NULL in the last argument of request_irq, since the argument
> should have pointer type and so that the last argument of request_irq
> syntactically matches the second argument of the later call to free_irq.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks Julia.

-- 
Dmitry
