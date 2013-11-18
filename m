From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2013 10:45:27 +0000
Subject: Re: [patch] gpio: rcar: NULL dereference on error in probe()
Message-Id: <CACRpkdai2WdEC-eRiBJ1jDMcMOVcvnN78_yO-VtmyxM4SwWwLw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107075651.GN21844@elgon.mountain>
In-Reply-To: <20131107075651.GN21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Magnus Damm <damm@opensource.se>, Grant Likely <grant.likely@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Nov 7, 2013 at 8:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> It's not obvious from the label name but "err1" tries to release
> "p->irq_domain" which leads to a NULL dereference.
>
> Fixes: 119f5e448d32 ('gpio: Renesas R-Car GPIO driver V3')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for fixes with Magnus' ACK and tagged for stable.

Yours,
Linus Walleij
