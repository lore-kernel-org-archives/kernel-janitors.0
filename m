From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 28 Jun 2020 13:43:10 +0000
Subject: Re: [PATCH] usb: gadget: function: printer: The device interface is reset and should return error co
Message-Id: <37bf94a0-92a0-ca4e-a4e4-5dd44aef2b88@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5207d179-0a7d-b5ff-af34-102fb21028b5@web.de>
In-Reply-To: <5207d179-0a7d-b5ff-af34-102fb21028b5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Qiang <qiang.zhang@windriver.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>

I suggest to choose a more succinct patch subject.


> After the device is disconnected from the host side, the interface of
> the device is reset. If the userspace operates the device again,
> an error code should be returned.

Please use an imperative wording for the commit message.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=719fdd32921fb7e3208db8832d32ae1c2d68900f#n151


> Signed-off-by: Zqiang <qiang.zhang@windriver.com>

Did you really specify your real name here?

Regards,
Markus
