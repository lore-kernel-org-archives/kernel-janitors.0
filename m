From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jun 2020 08:57:55 +0000
Subject: Re: [PATCH] usb: gadget: function: printer: Fix use-after-free in __lock_acquire()
Message-Id: <5207d179-0a7d-b5ff-af34-102fb21028b5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhang Qiang <qiang.zhang@windriver.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kyungtae Kim <kt0755@gmail.com>

> Fix this by increase object reference count.

I find this description incomplete according to the proposed changes.

Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
