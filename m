From: Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 14 Nov 2018 12:14:39 +0000
Subject: Re: [PATCH][drm-next] drm/virtio: fix memory leak of vfpriv on error return path
Message-Id: <20181114121438.3s4ehqahnqibrn2e@sirius.home.kraxel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181107203122.6861-1-colin.king@canonical.com>
In-Reply-To: <20181107203122.6861-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 07, 2018 at 08:31:22PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The allocation for vfpriv is being leaked on an error return path,
> fix this by kfree'ing it before returning.
> 
> Detected by CoverityScan, CID#1475380 ("Resource Leak")

Patches added to qemu queue, should land in drm-misc-next soon.

thanks,
  Gerd
