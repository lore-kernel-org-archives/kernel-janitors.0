From: Kalle Valo <kvalo@adurom.com>
Date: Mon, 16 May 2011 16:37:46 +0000
Subject: Re: [PATCH] drivers/staging/ath6kl/os/linux/cfg80211.c: Add missing call to cfg80211_put_bss
Message-Id: <87wrhqd2jp.fsf@purkki.adurom.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1305537629-29876-1-git-send-email-julia@diku.dk>
In-Reply-To: <1305537629-29876-1-git-send-email-julia@diku.dk> (Julia Lawall's message of "Mon\, 16 May 2011 11\:20\:29 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, Vipin Mehta <vmehta@atheros.com>, Joe Perches <joe@perches.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, Naveen Singh <nsingh@atheros.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org

Hi Julia,

Julia Lawall <julia@diku.dk> writes:

> From: Julia Lawall <julia@diku.dk>
>
> A call to cfg80211_get_bss hould be accompanied by a call to
> cfg80211_put_bss in error-handling code.

[...]

> ---
> I don't really understand the use of the bss variable later.  Afterwards,
> along the normal execution path, there is also a call to cfg80211_put_bss,
> but at this point bss has been redefined, and I don't have the impression
> that it still points to the same value.

The original code looks buggy to me:

    /* Before informing the join/connect event, make sure that
     * bss entry is present in scan list, if it not present
     * construct and insert into scan list, otherwise that
     * event will be dropped on the way by cfg80211, due to
     * this keys will not be plumbed in case of WEP and
     * application will not be aware of join/connect status. */
    bss = cfg80211_get_bss(ar->wdev->wiphy, NULL, bssid,
                           ar->wdev->ssid, ar->wdev->ssid_len,
                           ((ADHOC_NETWORK & networkType) ?
    WLAN_CAPABILITY_IBSS : WLAN_CAPABILITY_ESS),
                           ((ADHOC_NETWORK & networkType) ?
    WLAN_CAPABILITY_IBSS : WLAN_CAPABILITY_ESS));

But, as you point out, the bss is not used for anything. I think the
call and the comment should be just removed.

-- 
Kalle Valo
