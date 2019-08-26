From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Date: Mon, 26 Aug 2019 13:01:46 +0000
Subject: Re: [PATCH] drm/tinydrm: fix a loop in debugfs code
Message-Id: <9718fea0-49f0-34d4-b1fc-f69e99b7a690@tronnes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821072456.GJ26957@mwanda>
In-Reply-To: <20190821072456.GJ26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>



Den 21.08.2019 09.24, skrev Dan Carpenter:
> This code will likely crash if we try to do a zero byte write.  The code
> looks like this:
> 
>         /* strip trailing whitespace */
>         for (i = count - 1; i > 0; i--)
>                 if (isspace(buf[i]))
> 			...
> 
> We're writing zero bytes so count = 0.  You would think that "count - 1"
> would be negative one, but because "i" is unsigned it is a large
> positive numer instead.  The "i > 0" condition is true and the "buf[i]"
> access will be out of bounds.
> 
> The fix is to make "i" signed and now everything works as expected.  The
> upper bound of "count" is capped in __kernel_write() at MAX_RW_COUNT so
> we don't have to worry about it being higher than INT_MAX.
> 
> Fixes: 02dd95fe3169 ("drm/tinydrm: Add MIPI DBI support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks Dan, applied to drm-misc-next with adjusted title:
-drm/tinydrm: fix a loop in debugfs code
+drm/mipi-dbi: fix a loop in debugfs code

Noralf.
