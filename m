From: Joe Perches <joe@perches.com>
Date: Tue, 08 Oct 2019 14:00:13 +0000
Subject: Re: [PATCH] drm/amdgpu/display: make various arrays static, makes object smaller
Message-Id: <05e9cf0254790321433fd7d2c19129ec952bb3ac.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007215857.14720-1-colin.king@canonical.com>
 <9579bfae-1db5-d282-79ea-df1966f4c123@amd.com>
In-Reply-To: <9579bfae-1db5-d282-79ea-df1966f4c123@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <hwentlan@amd.com>, Colin King <colin.king@canonical.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, 2019-10-08 at 13:56 +0000, Harry Wentland wrote:
[]
> > diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> []
> > @@ -2745,7 +2745,7 @@ static enum bp_result bios_get_board_layout_info(
> >  	struct bios_parser *bp;
> >  	enum bp_result record_result;
> >  
> > -	const unsigned int slot_index_to_vbios_id[MAX_BOARD_SLOTS] = {
> > +	static const unsigned int slot_index_to_vbios_id[MAX_BOARD_SLOTS] = {
> 
> Won't this break the multi-GPU case where you'll have multiple driver
> instances with different layout?

As the array is read-only, how could that happen?
