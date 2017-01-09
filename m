From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 09 Jan 2017 18:35:52 +0000
Subject: Re: [PATCH 6/8] mmc/core/mmc_test: Improve a size determination in five functions
Message-Id: <CACRpkdbo7K0e27WO80H9r7HuKK7oyZ+=eu1wBXE4nrgPwfjZ=w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8e2accf5-90b3-6bd0-2abd-699927bc459b@users.sourceforge.net> <b8461289-1930-08ed-55ef-e2d7dd09a312@users.sourceforge.net>
In-Reply-To: <b8461289-1930-08ed-55ef-e2d7dd09a312@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Harjani Ritesh <riteshh@codeaurora.org>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Jan 8, 2017 at 10:49 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 8 Jan 2017 21:25:44 +0100
>
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
