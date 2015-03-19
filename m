From: Alan Cox <alan@linux.intel.com>
Date: Thu, 19 Mar 2015 12:20:15 +0000
Subject: Re: [patch] drm/gma500: double free in psbfb_create()
Message-Id: <1426767615.3579.8.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150319101704.GA13330@mwanda>
In-Reply-To: <20150319101704.GA13330@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Fabian Frederick <fabf@skynet.be>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Thu, 2015-03-19 at 13:17 +0300, Dan Carpenter wrote:
> The psb_gtt_free_range() frees "backing" so calling it twice is a double
> free bug.  I have fixed this by removing the first call.
> 
> Fixes: 4d8d096e9ae8  ('gma500: introduce the framebuffer support code')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

#facepalm

Acked-by: Alan Cox <alan@linux.intel.com>


