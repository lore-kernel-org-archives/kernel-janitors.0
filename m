From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 May 2017 19:26:43 +0000
Subject: Re: [PATCH] tinydrm: mipi-dbi: Adjust buffer output in mipi_dbi_debugfs_command_show()
Message-Id: <20170510192643.2v5fhkapqzwf4eat@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2795b611-dfb9-eaf6-e04d-10e27ce96772@users.sourceforge.net>
 <7a6e57ed-7d71-78bc-706e-3a6a1eea3a23@tronnes.org>
 <1494354199.20782.5.camel@perches.com>
 <f385d46e-cd60-ce57-d9c5-da23ad69e262@users.sourceforge.net>
In-Reply-To: <f385d46e-cd60-ce57-d9c5-da23ad69e262@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>, Fengguang Wu <fengguang.wu@intel.com>

On Wed, May 10, 2017 at 05:15:33PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 10 May 2017 17:03:20 +0200
> 
> * Use a special format string specification for the desired output of the
>   array "val" into a sequence.
> 
> * Adjust two local variables accordingly.
> 
> This refactoring supersedes the update suggestion "tinydrm: mipi-dbi:
> Use seq_putc() in mipi_dbi_debugfs_command_show()" from 2017-05-08.
> https://patchwork.kernel.org/patch/9716119/

This is not how to send v2 patches.

> 
> Fixes: 02dd95fe316936269a52d6ccb971bb956412b40a ("drm/tinydrm: Add MIPI DBI support")

This is not a bug fix so do not use the fixes tag.

regards,
dan carpenter

