From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Sep 2017 23:32:38 +0000
Subject: Re: [PATCH] drm/tve200: Check for IS_ERR instead of NULL in probe
Message-Id: <CACRpkdZMq_GbvDf4GvZ4K40vVdi7O4kT5tVDTJgaH_LVQOGeew@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170925102520.a7spymwqqbsczzz2@mwanda>
In-Reply-To: <20170925102520.a7spymwqqbsczzz2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>

On Mon, Sep 25, 2017 at 12:25 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> devm_ioremap_resource() returns error pointer, it never returns NULL on
> error.
>
> Fixes: 179c02fe90a4 ("drm/tve200: Add new driver for TVE200")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
