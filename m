From: Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 14 Mar 2017 11:02:22 +0000
Subject: Re: [PATCH] drm: qxl: add missing return check
Message-Id: <1489489342.27633.3.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170314075410.GB5984@mwanda>
In-Reply-To: <20170314075410.GB5984@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Dave Airlie <airlied@redhat.com>, Gabriel Krisman Bertazi <krisman@collabora.co.uk>

On Di, 2017-03-14 at 10:54 +0300, Dan Carpenter wrote:
> My static checker complains that "release" is uninitialized if
> qxl_alloc_release_reserved() fails, so let's add a check for that.

applied to drm-misc-next.

thanks,
  Gerd

