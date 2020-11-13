From: Sam Ravnborg <sam@ravnborg.org>
Date: Fri, 13 Nov 2020 14:55:57 +0000
Subject: Re: [PATCH][next] drm/kmb: fix array out-of-bounds writes to kmb->plane_status[]
Message-Id: <20201113145557.GB3647624@ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113120121.33212-1-colin.king@canonical.com>
In-Reply-To: <20201113120121.33212-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Anitha Chrisanthus <anitha.chrisanthus@intel.com>

Hi Colin.

On Fri, Nov 13, 2020 at 12:01:21PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Writes to elements in the kmb->plane_status array in function
> kmb_plane_atomic_disable are overrunning the array when plane_id is
> more than 1 because currently the array is KMB_MAX_PLANES elements
> in size and this is currently #defined as 1.  Fix this by defining
> KMB_MAX_PLANES to 4.

I fail to follow you here.
In kmb_plane_init() only one plane is allocated - with id set to 0.
So for now only one plane is allocated thus kmb_plane_atomic_disable()
is only called for this plane.

With your change we will start allocating four planes, something that is
not tested.

Do I miss something?

	Sam
