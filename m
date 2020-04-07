From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 12:58:02 +0000
Subject: Re: [PATCH net-next] drm/amd/display: Fix link_detect_sink()
Message-Id: <20200407125802.GK2001@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200406091910.GA5405@mwanda>
 <7ab9e9de-8d78-7f63-f2b3-c1e9669faa6d@amd.com>
In-Reply-To: <7ab9e9de-8d78-7f63-f2b3-c1e9669faa6d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Chris Park <Chris.Park@amd.com>, Leo Li <sunpeng.li@amd.com>, Zhan Liu <Zhan.Liu@amd.com>, kernel-janitors@vger.kernel.org, Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org, Wenjing Liu <Wenjing.Liu@amd.com>, Melissa Wen <melissa.srw@gmail.com>, David Airlie <airlied@linux.ie>, Nikola Cornij <nikola.cornij@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Lucy Li <lucy.li@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, David Galiffi <David.Galiffi@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Harry Wentland <harry.wentland@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Anthony Koo <Anthony.Koo@amd.com>

On Mon, Apr 06, 2020 at 12:22:51PM -0400, Kazlauskas, Nicholas wrote:
> On 2020-04-06 5:19 a.m., Dan Carpenter wrote:
> > This TODO stub originally had curly braces but we deleted them as part
> > of a clean up.  Unfortunately that changes the behavior of the code
> > because now the switch statement is part of the if statement.  Smatch
> > complains that the indenting doesn't make sense.
> > 
> >      drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:425
> >      link_detect_sink() warn: if statement not indented
> > 
> > Also I changed "ZAZTODO" to just "TODO".  The ZAZ isn't used anywhere
> > else.
> > 
> > Fixes: 621514aa4140 ("drm/amd/display: codestyle cleanup on dc_link file until detect_dp func")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> I'd prefer just dropping the block, but either method is:
> 
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> 
> Since that previous patch broke most sink detection...
> 

Sorry for the net-next in the subject.  Anyway, this was fixed in
commit 50dc581a8f43 ("drm/amd/display: fix the broken logic in dc_link.c")
so no need for me to resend.

regards,
dan carpenter
