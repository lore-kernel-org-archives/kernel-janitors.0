From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 09 Jan 2017 18:37:58 +0000
Subject: Re: [PATCH 8/8] mmc-core: Use kmalloc_array() in mmc_alloc_sg()
Message-Id: <CACRpkdbiqLxQx6ytzEd_4d8Suc1od4F+eHy3+H7-th-FWKXdVg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8e2accf5-90b3-6bd0-2abd-699927bc459b@users.sourceforge.net> <a2c80b39-6f7e-81ad-01d2-fce831e6cd8c@users.sourceforge.net>
In-Reply-To: <a2c80b39-6f7e-81ad-01d2-fce831e6cd8c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Harjani Ritesh <riteshh@codeaurora.org>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Jan 8, 2017 at 10:55 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 8 Jan 2017 22:10:40 +0100
>
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "kmalloc_array".
>
>   This issue was detected by using the Coccinelle software.
>
> * Replace the specification of a data structure by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
