From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 29 Jun 2020 08:00:22 +0000
Subject: Re: [PATCH 2/2] usb: mtu3: fix NULL pointer dereference
Message-Id: <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Some pointers are dereferenced before successful checks.

I suggest to reconsider and improve the change description.

* Would a null pointer dereference be possible only with the variables “mep”
  and “mreq” in the implementation of the function “mtu3_gadget_dequeue”?

* How do you think about to adjust any more variable initialisations?

* Will it become helpful to add the tag “Fixes” to the commit message?

Regards,
Markus
