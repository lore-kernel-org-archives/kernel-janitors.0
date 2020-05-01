From: David Miller <davem@davemloft.net>
Date: Fri, 01 May 2020 00:49:19 +0000
Subject: Re: [PATCH] dp83640: reverse arguments to list_add_tail
Message-Id: <20200430.174919.939495831904691325.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1588276292-19166-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1588276292-19166-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@inria.fr
Cc: richardcochran@gmail.com, kernel-janitors@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, eugene.volanschi@inria.fr

From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Thu, 30 Apr 2020 21:51:32 +0200

> In this code, it appears that phyter_clocks is a list head, based on
> the previous list_for_each, and that clock->list is intended to be a
> list element, given that it has just been initialized in
> dp83640_clock_init.  Accordingly, switch the arguments to
> list_add_tail, which takes the list head as the second argument.
> 
> Fixes: cb646e2b02b27 ("ptp: Added a clock driver for the National Semiconductor PHYTER.")
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

This looks correct to me too.

Applied and queued up for -stable, thanks.
