From: Gustavo Padovan <gustavo@padovan.org>
Date: Mon, 06 Feb 2017 11:48:18 +0000
Subject: Re: [PATCH] drm/vc4: simplify exit path of a failed allocation of dsi_connector
Message-Id: <20170206114818.GA28952@joana>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170203195624.7189-1-colin.king@canonical.com>
In-Reply-To: <20170203195624.7189-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Colin,

2017-02-03 Colin King <colin.king@canonical.com>:

> From: Colin Ian King <colin.king@canonical.com>
> 
> If dsi_connector fails to allocate, the exit path via label 'fail'
> checks if connector is null, which it always is, so the cleanup
> that destroys connector is never going to be called.  Hence the
> failure path can be more optimally performed by removing this
> and just returning ERR_PTR(-ENOMEM).  This also removes the need
> to initialize connector to NULL, and we can also remove ret too.
> 
> Detected by CoverityScan, CID#1399504 ("Logicall Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.com>

Gustavo

