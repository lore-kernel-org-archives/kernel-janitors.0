From: Sam Ravnborg <sam@ravnborg.org>
Date: Fri, 11 Dec 2020 11:01:57 +0000
Subject: Re: [PATCH] drm/panel: khadas: Fix error code in khadas_ts050_panel_add()
Message-Id: <20201211110157.GA527186@ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NEfmgGilaXJs2R@mwanda>
In-Reply-To: <X9NEfmgGilaXJs2R@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>

Hi Dan,

I assume your nice tooling found this buggy.
Nice!

On Fri, Dec 11, 2020 at 01:05:50PM +0300, Dan Carpenter wrote:
> There is a copy and paste bug so it didn't return the correct error
> code.
> 
> Fixes: b215212117f7 ("drm: panel: add Khadas TS050 panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Neil, I assume you will take this via next-fixes, which I think is the
right tree at the moment.

	Sam
