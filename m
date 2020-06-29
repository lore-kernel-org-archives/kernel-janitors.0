From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 29 Jun 2020 07:30:58 +0000
Subject: Re: [PATCH 1/2] usb: mtu3: disable USB2 LPM
Message-Id: <af16d716-8bb3-ea1f-e410-b27443f74c31@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> A SuperSpeed device shall include the USB 2.0 extension descriptor
> and shall support LPM when operating in USB 2.0 HS mode(see usb3.2
> spec9.6.2.1). But we always don't support it, so disable it by
> default, otherwise device will enter LPM suspend mode when
> connected to Win10 system.

How do you think about a wording variant like the following?

   Change description:
   A SuperSpeed device shall include the USB 2.0 extension descriptor
   and shall support Link Power Management when operating in USB 2.0
   High Speed mode. (See also: USB 3.2 specification 9.6.2.1)
   But we do not support it generally. Thus disable this functionality
   by default.
   Otherwise, the device will enter LPM suspend mode when connected
   to Win10 system.


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
