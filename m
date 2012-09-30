From: Johannes Berg <johannes@sipsolutions.net>
Date: Sun, 30 Sep 2012 19:34:43 +0000
Subject: Re: [PATCH] ath/ath9k/ar9003_eeprom.c: Remove unnecessary semicolon
Message-Id: <1349033683.23838.6.camel@jlt4.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349032870-4780-1-git-send-email-peter.senna@gmail.com>
	 (sfid-20120930_212132_608267_30BA39AB)
In-Reply-To: <1349032870-4780-1-git-send-email-peter.senna@gmail.com> (sfid-20120930_212132_608267_30BA39AB)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: mcgrof@qca.qualcomm.com, jouni@qca.qualcomm.com, vthiagar@qca.qualcomm.com, senthilb@qca.qualcomm.com, linville@tuxdriver.com, linux-wireless@vger.kernel.org, ath9k-devel@lists.ath9k.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2012-09-30 at 21:21 +0200, Peter Senna Tschudin wrote:

> -		if (!ah->config.enable_paprd);
> +		if (!ah->config.enable_paprd)
>  			return false;

That's not an "unnecessary semicolon", it's a pretty strange bug :)

johannes

