From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 18:34:37 +0000
Subject: mac80211: Checking a kmemdup() call in ieee80211_send_assoc()
Message-Id: <1b2c589c-46d4-2bad-ed54-176b7c2f66bf@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Johannes Berg <johannes@sipsolutions.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “ieee80211_send_assoc” contains still an unchecked call
of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/mac80211/mlme.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n980
https://elixir.bootlin.com/linux/v5.4-rc2/source/net/mac80211/mlme.c#L980

How do you think about to improve it?

Regards,
Markus
