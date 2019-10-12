From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 17:03:09 +0000
Subject: net: tulip: de2104x: Checking a kmemdup() call in de21041_get_srom_info()
Message-Id: <eb1f904a-a2e4-fe9b-c50e-b8087d7e57c4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, linux-parisc@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Yang Wei <yang.wei9@zte.com.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “de21041_get_srom_info” contains still an unchecked call
of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/dec/tulip/de2104x.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n1940
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/net/ethernet/dec/tulip/de2104x.c#L1940

How do you think about to improve it?

Regards,
Markus
