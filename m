From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Aug 2014 06:55:42 +0000
Subject: Re: [patch 1/2] pinctrl: tegra-xusb: fix an off by one test
Message-Id: <CACRpkdYrJOBLDcZPoVxY855HDT=VuMjBWrzYOixRs7jLB0SYpQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140731152217.GD31539@mwanda>
In-Reply-To: <20140731152217.GD31539@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Jul 31, 2014 at 5:22 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This shoudld be ">= ARRAY_SIZE()" instead of "> ARRAY_SIZE()".
>
> Fixes: dc0a39386687 ('pinctrl: Add NVIDIA Tegra XUSB pad controller support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Stephen's and Thierry's ACKs.

Yours,
Linus Walleij
