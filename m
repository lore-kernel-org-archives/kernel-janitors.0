From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Jan 2017 14:54:17 +0000
Subject: Re: [PATCH 1/5] pinctrl: mvebu: Use kmalloc_array() in mvebu_pinctrl_dt_node_to_map()
Message-Id: <CACRpkdZomMeQ4miW9nC=oUVGkHsKEgZCoWQM9Bzce7PVq5Pjwg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net> <c4b535ba-be93-5b61-43e0-dcf5018609ee@users.sourceforge.net>
In-Reply-To: <c4b535ba-be93-5b61-43e0-dcf5018609ee@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jan 12, 2017 at 5:31 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 12 Jan 2017 16:00:15 +0100
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

Patch applied.

Yours,
Linus Walleij
