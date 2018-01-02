From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 02 Jan 2018 08:52:20 +0000
Subject: Re: [PATCH] pinctrl: tz1090-pdc: Delete an error message for a failed memory allocation in two funct
Message-Id: <CACRpkdbVK8R-f9ot5ZKxx+zOHvx=GbfLcjgYKUwjbicLVLagvw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f52b8393-9e1f-bd65-1374-4e9db1a0e4c0@users.sourceforge.net>
In-Reply-To: <f52b8393-9e1f-bd65-1374-4e9db1a0e4c0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Landley <rob@landley.net>

On Mon, Dec 25, 2017 at 6:34 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 25 Dec 2017 18:28:02 +0100
>
> Omit an extra message for a memory allocation failure in these functions.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
