From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 26 Sep 2019 18:11:43 +0000
Subject: Re: rtlwifi: Remove excessive check in _rtl_ps_inactive_ps()
Message-Id: <f99ca489-723c-0c2f-4241-e03c785a4a8d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925205858.30216-1-efremov@linux.com>
In-Reply-To: <20190925205858.30216-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Efremov <efremov@linux.com>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

> +++ b/drivers/net/wireless/realtek/rtlwifi/ps.c
> @@ -161,8 +161,7 @@  static void _rtl_ps_inactive_ps(struct ieee80211_hw *hw)
>  	if (ppsc->inactive_pwrstate = ERFON &&
>  	    rtlhal->interface = INTF_PCI) {
>  		if ((ppsc->reg_rfps_level & RT_RF_OFF_LEVL_ASPM) &&

Can it make sense to reduce the nesting level for these condition checks
besides the suggested deletion of duplicate source code?

Regards,
Markus
