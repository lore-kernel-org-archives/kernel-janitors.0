From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jan 2021 10:07:06 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Add missing BOOTUP_DEFAULT to profile_name[]
Message-Id: <20210112100706.GF5083@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111114638.16530-1-colin.king@canonical.com>
In-Reply-To: <20210111114638.16530-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Mon, Jan 11, 2021 at 11:46:38AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A recent change added a new BOOTUP_DEFAULT power profile mode
> to the PP_SMC_POWER_PROFILE enum but omitted updating the
> corresponding profile_name array.  Fix this by adding in the
> missing BOOTUP_DEFAULT to profile_name[].
> 

Still not enough to prevent the array overflow.  It needs POWERSAVE as
well.

regards,
dan carpenter
