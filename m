From: Julien Cristau <jcristau@debian.org>
Date: Fri, 25 Dec 2009 10:13:18 +0000
Subject: Re: drivers/gpu/drm/radeon: move a dereference below a NULL test
Message-Id: <20091225101318.GQ3003@radis.liafa.jussieu.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261658670.3546.7.camel@ICE-BOX>
In-Reply-To: <1261658670.3546.7.camel@ICE-BOX>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Dec 24, 2009 at 23:44:30 +1100, Darren Jenkins wrote:

> If a NULL value is possible, the dereference should only occur after the
> NULL test.
> 
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> diff --git a/drivers/gpu/drm/radeon/radeon_irq.c
> b/drivers/gpu/drm/radeon/radeon_irq.c
> index b79ecc4..2f349a3 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq.c
> @@ -289,16 +289,16 @@ int radeon_irq_emit(struct drm_device *dev, void
> *data, struct drm_file *file_pr

Looks like your patches are whitespace-damaged.  You'll need to fix your
MUA...

Cheers,
Julien
