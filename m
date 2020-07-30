From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jul 2020 11:52:26 +0000
Subject: Re: [PATCH] drm/amd/display: fix dp_dsc_clock_en_read() debugfs function
Message-Id: <20200730115225.GG5493@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200730114613.GA59409@mwanda>
In-Reply-To: <20200730114613.GA59409@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Eryk Brol <eryk.brol@amd.com>
Cc: Stylon Wang <stylon.wang@amd.com>, kernel-janitors@vger.kernel.org, Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Alex Deucher <alexander.deucher@amd.com>, Mikita Lipski <mikita.lipski@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

The other debugfs functions should probably be updated as well...  I
just did this one as an example of how these functions are normally
implemented.

There are some other warnings we could look at as well.

regards,
dan carpenter

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:683 dp_phy_test_pattern_debugfs_write() warn: we tested 'valid_test_pattern' before and it was 'true'
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1005 dp_dsc_clock_en_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1005 dp_dsc_clock_en_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1010 dp_dsc_clock_en_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1019 dp_dsc_clock_en_read() error: snprintf() is printing too much 30 vs 10
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1062 dp_dsc_slice_width_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1062 dp_dsc_slice_width_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1067 dp_dsc_slice_width_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1119 dp_dsc_slice_height_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1119 dp_dsc_slice_height_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1124 dp_dsc_slice_height_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1176 dp_dsc_bits_per_pixel_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1176 dp_dsc_bits_per_pixel_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1181 dp_dsc_bits_per_pixel_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1233 dp_dsc_pic_width_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1233 dp_dsc_pic_width_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1238 dp_dsc_pic_width_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1290 dp_dsc_pic_height_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1290 dp_dsc_pic_height_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1295 dp_dsc_pic_height_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1347 dp_dsc_chunk_size_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1347 dp_dsc_chunk_size_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1352 dp_dsc_chunk_size_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1404 dp_dsc_slice_bpg_offset_read() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1404 dp_dsc_slice_bpg_offset_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1409 dp_dsc_slice_bpg_offset_read() warn: address of 'aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i]' is non-NULL
