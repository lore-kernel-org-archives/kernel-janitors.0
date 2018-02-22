From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 14:15:27 +0000
Subject: Re: [PATCH 2/2] gpio: timberdale: Improve a size determination in timbgpio_probe()
Message-Id: <CACRpkdZNipm4spks8wdGRwG2UwxvQ87svtV9FjiCPYnwNw-62Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <da77f86c-a366-0a0f-10fd-9b7cfd879391@users.sourceforge.net> <df13123f-5c90-03e0-edb6-0ab9751b7aa2@users.sourceforge.net>
In-Reply-To: <df13123f-5c90-03e0-edb6-0ab9751b7aa2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Feb 10, 2018 at 9:33 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 10 Feb 2018 21:13:28 +0100
>
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
