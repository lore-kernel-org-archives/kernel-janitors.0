From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 11 Oct 2019 15:33:17 +0000
Subject: staging: wlan-ng: Checking a kmemdup() call in prism2sta_inf_hostscanresults()
Message-Id: <cd77c9fd-47dd-28ae-33b3-c9b36bea078b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "J. Bruce Fields" <bfields@redhat.com>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen McCamant <smccaman@umn.edu>

Hello,

I have tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “prism2sta_inf_hostscanresults” contains still
an unchecked call of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/wlan-ng/prism2sta.c?id=26a7ae2949a86e1b74e2485d725efb528e2a81bb#n1086
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/staging/wlan-ng/prism2sta.c#L1086

How do you think about to improve it?

Regards,
Markus
