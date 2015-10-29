From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 29 Oct 2015 14:40:03 +0000
Subject: Re: [patch] drm: crtc: integer overflow in drm_property_create_blob()
Message-Id: <CAPj87rPTY3EJ15MtRdx_7edjJ4v-Bp-2EvfOd9tZJ0fjtHDO1w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151029133754.GA2862@mwanda>
In-Reply-To: <20151029133754.GA2862@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>

Hi Dan,

On 29 October 2015 at 13:37, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The size here comes from the user via the ioctl, it is a number between
> 1-u32max so the addition here could overflow on 32 bit systems.
>
> Fixes: f453ba046074 ('DRM: add mode setting support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for catching this. I did have a pass through looking for such
issues but couldn't see any. :\

Reviewed-by: Daniel Stone <daniels@collabora.com>
Cc: stable@kernel.org # v4.2

Cheers,
Daniel
