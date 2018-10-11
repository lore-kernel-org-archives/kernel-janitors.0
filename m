From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2018 07:06:15 +0000
Subject: Re: [PATCH][drm-next] drm/vmwgfx: remove redundant return ret statement
Message-Id: <20181011070614.n2nwp36gbhket34z@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181004174953.28107-1-colin.king@canonical.com>
In-Reply-To: <20181004174953.28107-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, VMware Graphics <linux-graphics-maintainer@vmware.com>

On Thu, Oct 04, 2018 at 06:49:53PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The return statement is redundant as there is a return statement
> immediately before it so we have dead code that can be removed.
> Also remove the unused declaration of ret.
> 
> Detected by CoverityScan, CID#1473793 ("Structurally dead code")
> 

Introduced by commit b139d43dacef ("drm/vmwgfx: Make buffer object
lookups reference-free during validation").  The fix looks good.

regards,
dan carpenter
