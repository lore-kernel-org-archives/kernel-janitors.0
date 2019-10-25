From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Oct 2019 11:58:20 +0000
Subject: Re: [PATCH][next] drm/v3d: fix double free of bin
Message-Id: <20191025115819.GA7244@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024104801.3122-1-colin.king@canonical.com>
 <20191024123853.GH11828@phenom.ffwll.local>
In-Reply-To: <20191024123853.GH11828@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, Navid Emamdoost <navid.emamdoost@gmail.com>, Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 24, 2019 at 02:38:53PM +0200, Daniel Vetter wrote:
> On Thu, Oct 24, 2019 at 11:48:01AM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Two different fixes have addressed the same memory leak of bin and
> > this now causes a double free of bin.  While the individual memory
> > leak fixes are fine, both fixes together are problematic.
> > 
> > Addresses-Coverity: ("Double free")
> > Fixes: 29cd13cfd762 ("drm/v3d: Fix memory leak in v3d_submit_cl_ioctl")
> > Fixes: 0d352a3a8a1f (" rm/v3d: don't leak bin job if v3d_job_init fails.")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> That sounds like wrong merge resolution somewhere, and we don't have those
> patches merged together in any final tree yet anywhere. What's this based
> on?
> -Daniel

linux-next.

I sent this fix to you and Stephen Rothwell yesterday so this one is
sorted already.  Stephen will apply my patch until you guys merge your
drm trees.

regards,
dan carpenter
