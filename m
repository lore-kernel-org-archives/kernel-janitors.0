From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Aug 2014 06:57:47 +0000
Subject: Re: [patch 2/2] pinctrl: tegra-xusb: testing wrong variable in probe()
Message-Id: <CACRpkdb97mP2G+1uwyn3k6ShOVkRwyUzWY471emX_fv4wnE6cg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140731152308.GE31539@mwanda>
In-Reply-To: <20140731152308.GE31539@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Jul 31, 2014 at 5:23 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a cut and paste bug so we test the wrong variable.  "err" is
> never less than zero at this point.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Stephen's and Thierry's ACKs.

Yours,
Linus Walleij
