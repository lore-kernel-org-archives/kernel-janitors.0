From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 02 Jan 2018 08:47:20 +0000
Subject: Re: [PATCH 2/3] pinctrl: rockchip: Improve a size determination in rockchip_pinctrl_probe()
Message-Id: <CACRpkdYEe_OTTeiUqzt2gJB+-_j7=3Z15y_e+fzB3ZM9BspKXA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <323697d0-e1e8-8d3b-1070-f481cfa30b9a@users.sourceforge.net>
 <e0bceb4a-bd46-5032-2ac9-d51aa46440a5@users.sourceforge.net>
In-Reply-To: <e0bceb4a-bd46-5032-2ac9-d51aa46440a5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sat, Dec 23, 2017 at 10:40 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 23 Dec 2017 22:07:30 +0100
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
