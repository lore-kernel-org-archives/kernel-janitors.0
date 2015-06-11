From: Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 11 Jun 2015 06:16:59 +0000
Subject: Re: [patch] drm/virtio: checking for NULL instead of IS_ERR
Message-Id: <1434003419.27114.0.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150610192710.GA10145@mwanda>
In-Reply-To: <20150610192710.GA10145@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org

On Mi, 2015-06-10 at 22:27 +0300, Dan Carpenter wrote:
> virtio_gpu_alloc_object() returns an error pointer, it never returns
> NULL.
> 
> Fixes: dc5698e80cf7 ('Add virtio gpu driver.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


