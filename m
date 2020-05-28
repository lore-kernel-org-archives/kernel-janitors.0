From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 28 May 2020 17:09:17 +0000
Subject: Re: [PATCH] Bluetooth: btmtkuart: Improve exception handling in btmtuart_probe()
Message-Id: <dd458e1d-26cf-2cc6-4fdb-fb464f9c3ac6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chuhong Yuan <hslester96@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>

> btmtuart_probe() misses several function calls in its error paths,
> including hci_free_dev() and clk_disable_unprepare().
> Refactor the code and call correct undo functions to fix the error
> paths.

How do you think about a wording variant like the following?

   Change description:
   Calls of the functions “clk_disable_unprepare” and “hci_free_dev”
   were missing for the exception handling.
   Thus add the missed function calls together with corresponding
   jump targets.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
