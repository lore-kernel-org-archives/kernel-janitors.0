From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 30 Jun 2020 10:47:03 +0000
Subject: Re: [PATCH v2] usb: mtu3: Fix NULL pointer dereferences
Message-Id: <83ce087e-9da9-a8e1-8872-8520ccfc4108@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Some pointers are dereferenced before successful checks.

I propose to reconsider and improve also this change description.

* Would a null pointer dereference be possible only with the variables “mep”
  and “mreq” in the implementation of the function “mtu3_gadget_dequeue”?
  (Can it make sense to split the patch according to this detail?)

* How do you think about to convert any more variable initialisations
  to later assignments?

* Will it become helpful to add the tag “Fixes” to the commit message?


…
> ---
> v2: nothing changed, but abandon another patch

Are there chances to take any previous patch review comments better into account
(besides the shown reduction of update steps)?


> ---
>  drivers/usb/mtu3/mtu3_gadget.c | 25 ++++++++++++++++++-------

I suggest to replace the triple dashes before this diffstat by a blank line.

Regards,
Markus
