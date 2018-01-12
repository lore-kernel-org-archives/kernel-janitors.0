From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 12 Jan 2018 21:41:27 +0000
Subject: [PATCH 0/4] usb: gadget: fotg210-udc: Fixes and cleanup
Message-Id: <cover.1515791144.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org, bhumirks@gmail.com, leoyang.li@nxp.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This serie aims to fix 2 issues. (path 2 & 4)

The 2nd patch fixes a memory leak. It uses devm_ function a simplify the
handling of the memory.

The 4th patch fixes a potential invalid pointer dereference.

The 2 other ones, are just clean-ups to remove useless code and add other
uses of devm_ function to simplify code.

I've left the request_irq/free_irq because I'm unsure of potential side
effects if some other resources are freed while an IRQ can still be
triggered. So I've preferred to leave it as-is.

Christophe JAILLET (4):
  usb: gadget: fotg210-udc: Remove a useless
  usb: gadget: fotg210-udc: Fix a memory leak
  usb: gadget: fotg210-udc: Simplify code
  usb: gadget: fotg210-udc: Fix a potential invalid pointer dereference

 drivers/usb/gadget/udc/fotg210-udc.c | 41 ++++++++++++------------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

-- 
2.14.1

