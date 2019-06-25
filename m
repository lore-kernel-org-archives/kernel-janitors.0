From: Al Viro <viro@zeniv.linux.org.uk>
Date: Tue, 25 Jun 2019 23:17:29 +0000
Subject: Re: [PATCH] drm: return -EFAULT if copy_one_buf() fails
Message-Id: <20190625231729.GK17978@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618125623.GA24896@mwanda>
In-Reply-To: <20190618125623.GA24896@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>

On Tue, Jun 18, 2019 at 03:56:23PM +0300, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes remaining to be
> copied, but we want to return -EFAULT.  This function is called from
> __drm_legacy_infobufs() which expects negative error codes.
> 
> Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This goes through Al's tree and not through drm.  Presumably this patch
> will just get folded into the original.

Wha..?  The original has been in mainline since v4.13, so it's a bit too
late to fold anything into it...
