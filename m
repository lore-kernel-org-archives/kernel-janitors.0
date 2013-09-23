From: Bing Zhao <bzhao@marvell.com>
Date: Mon, 23 Sep 2013 19:40:33 +0000
Subject: RE: [PATCH 11/19] wireless: Change variable type to bool
Message-Id: <477F20668A386D41ADCC57781B1F70430F44C59426@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
 <1379802471-30252-11-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-11-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: "linville@tuxdriver.com" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Peter,

Thanks for your patch.

> The variables cancel_scan_cmd, enable_data, hs_activate and valid are
> only assigned the values true and false. Change its type to bool.
> 
> The simplified semantic patch that find this problem is as
> follows (http://coccinelle.lip6.fr/):
> 
> @exists@
> type T;
> identifier b;
> @@
> - T
> + bool
>   b = ...;
>   ... when any
>   b = \(true\|false\)
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Acked-by: Bing Zhao <bzhao@marvell.com>

Thanks,
Bing

> ---
>  drivers/net/wireless/mwifiex/cmdevt.c  | 2 +-
>  drivers/net/wireless/mwifiex/join.c    | 2 +-
>  drivers/net/wireless/mwifiex/sta_cmd.c | 2 +-
>  drivers/net/wireless/mwifiex/wmm.c     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)


