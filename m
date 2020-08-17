From: Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 17 Aug 2020 09:16:24 +0000
Subject: Re: [PATCH] drm/virtgpu: remove redundant assignments to width and height
Message-Id: <20200817091624.wqnfo2vnhyj7q53t@sirius.home.kraxel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200701134154.549112-1-colin.king@canonical.com>
In-Reply-To: <20200701134154.549112-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

On Wed, Jul 01, 2020 at 02:41:54PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables width and height are being assigned values that are never
> read. The assignments are redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pused to drm-misc-next.

thanks,
  Gerd
