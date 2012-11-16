From: Luciano Coelho <coelho@ti.com>
Date: Fri, 16 Nov 2012 18:18:14 +0000
Subject: Re: [PATCH 2/5] drivers/net/wireless/ti/wlcore/main.c: eliminate possible double power off
Message-Id: <1353089894.10872.77.camel@cumari.coelho.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1350816727-1381-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1350816727-1381-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1350816727-1381-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2012-10-21 at 12:52 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The function wl12xx_set_power_on is only called twice, once in
> wl12xx_chip_wakeup and once in wl12xx_get_hw_info.  On the failure of the
> call in wl12xx_chip_wakeup, the containing function just returns, but on
> the failure of the call in wl12xx_get_hw_info, the containing function
> calls wl1271_power_off.  This does not seem necessary, because if
> wl12xx_set_power_on has set the power on and then fails, it has already
> turned the power off.

[...]

Applied and pushed, thanks!

--
Luca.

