From: Al Viro <viro@zeniv.linux.org.uk>
Date: Tue, 25 Jun 2019 23:18:54 +0000
Subject: Re: [PATCH v2] drm: return -EFAULT if copy_to_user() fails
Message-Id: <20190625231854.GL17978@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618125623.GA24896@mwanda>
 <20190618131843.GA29463@mwanda>
 <20190618171629.GB25413@art_vandelay>
In-Reply-To: <20190618171629.GB25413@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Paul <sean@poorly.run>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 18, 2019 at 01:16:29PM -0400, Sean Paul wrote:
> On Tue, Jun 18, 2019 at 04:18:43PM +0300, Dan Carpenter wrote:
> > The copy_from_user() function returns the number of bytes remaining
> > to be copied but we want to return a negative error code.  Otherwise
> > the callers treat it as a successful copy.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks Dan, I've applied this to drm-misc-fixes.

FWIW, Acked-by: Al Viro <viro@zeniv.linux.org.uk>
