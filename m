From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Oct 2017 10:31:58 +0000
Subject: Re: [PATCH] drm/amd/powerplay: fix amd_powerplay_reset()
Message-Id: <20171024103158.2kbtldetdoudtvfo@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171024094418.za4qacxapyrud2m4@mwanda>
 <87k1zkj1ok.fsf@intel.com>
In-Reply-To: <87k1zkj1ok.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org, Eric Huang <JinHuiEric.Huang@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Tue, Oct 24, 2017 at 01:11:07PM +0300, Jani Nikula wrote:
> On Tue, 24 Oct 2017, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > We accidentally inverted an if statement and turned amd_powerplay_reset()
> > into a no-op.
> >
> > Fixes: ae97988fc89e ("drm/amd/powerplay: tidy up ret checks in amd_powerplay.c (v3)")
> 
> For some reason I looked up that commit, and it has *two* cases where
> "ret != 0" gets changed to "!ret".
> 

The other bug was secretly fixed in commit 3811f8f00c5f ("drm/amd/powerplay:
move set_clockgating_by_smu to pp func table").

regards,
dan carpenter

