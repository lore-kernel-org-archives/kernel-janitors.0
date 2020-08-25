From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Aug 2020 18:53:24 +0000
Subject: Re: [PATCH 1/3] drm/amdgpu/si: Fix buffer overflow in si_get_register_value()
Message-Id: <20200825185324.GW5493@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200825111843.GA285523@mwanda>
 <CADnq5_O0f7NdR92PSKFS0zrN4oFb_WJXX1E_HQ9uHzM-4NL2OQ@mail.gmail.com>
In-Reply-To: <CADnq5_O0f7NdR92PSKFS0zrN4oFb_WJXX1E_HQ9uHzM-4NL2OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Jivin <alex.jivin@amd.com>, Frederick Lawler <fred@fredlawl.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, Sonny Jiang <sonny.jiang@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Monk Liu <Monk.Liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

On Tue, Aug 25, 2020 at 11:53:25AM -0400, Alex Deucher wrote:
> On Tue, Aug 25, 2020 at 7:21 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The values for "se_num" and "sh_num" come from the user in the ioctl.
> > They can be in the 0-255 range but if they're more than
> > AMDGPU_GFX_MAX_SE (4) or AMDGPU_GFX_MAX_SH_PER_SE (2) then it results in
> > an out of bounds read.
> >
> > I split this function into to two to make the error handling simpler.
> >
> > Fixes: dd5dfa61b4ff ("drm/amdgpu: refine si_read_register")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Good catch.  This is more defensive, but It's a much simpler check to
> validate these in the caller.  See the attached patch.
> 

That works too.

Acked-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
