From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Dec 2020 14:04:59 +0000
Subject: Re: [PATCH] drm/panel: khadas: Fix error code in khadas_ts050_panel_add()
Message-Id: <20201211140459.GR2767@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NEfmgGilaXJs2R@mwanda>
 <20201211110157.GA527186@ravnborg.org>
In-Reply-To: <20201211110157.GA527186@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>

On Fri, Dec 11, 2020 at 12:01:57PM +0100, Sam Ravnborg wrote:
> Hi Dan,
> 
> I assume your nice tooling found this buggy.

Yeah.  Passing a valid pointer to PTR_ERR().

regards,
dan carpenter
