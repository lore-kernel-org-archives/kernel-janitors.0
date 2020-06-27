From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 27 Jun 2020 12:28:50 +0000
Subject: =?UTF-8?Q?usb=3a_mtu3=3a_Checking_initialisation_of_the_variable_?= =?UTF-8?B?4oCcbWVw4oCdIGluIHR3by
Message-Id: <8efdb7aa-1188-e94a-3075-ab1dd30768bb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello,

A source code analysis approach by the means of the semantic patch language
(Coccinelle software) pointed an implementation detail out for further
development considerations.

The functions “mtu3_gadget_ep_set_halt” and “mtu3_gadget_ep_set_wedge” check
at the beginning if the input parameter “ep” is a null pointer.
The error code “-EINVAL” will be returned then.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/mtu3/mtu3_gadget.c?id=1590a2e1c681b0991bd42c992cabfd380e0338f2#n371
https://elixir.bootlin.com/linux/v5.7.2/source/drivers/usb/mtu3/mtu3_gadget.c#L371

Can it be nicer to assign the variable “mep” only after a successful check
instead of an initialisation before?

Regards,
Markus
