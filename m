From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 30 May 2020 09:24:23 +0000
Subject: Re: [PATCH] usb: cdns3: fix possible buffer overflow caused by bad DMA value
Message-Id: <b489646a-a4f7-adf0-b996-ab92039c8487@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jia-Ju Bai <baijiaju1990@gmail.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Laszczak <pawell@cadence.com>, Peter Chen <peter.chen@nxp.com>, Roger Quadros <rogerq@ti.com>, YueHaibing <yuehaibing@huawei.com>

> To fix these possible bugs, index is checked before being used.

How do you think about a wording variant like the following?

  Thus check the index before using it further.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
