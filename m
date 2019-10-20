From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 20 Oct 2019 08:20:26 +0000
Subject: drm/gma500: Checking a get_config_mode() call in mdfld_dsi_output_init()
Message-Id: <0f501ca6-0b4f-0ccd-c366-bed2a10fde03@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points a call of the member
function “get_config_mode” out for further considerations
according to the implementation of the function “mdfld_dsi_output_init”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/gma500/mdfld_dsi_output.c?id=531e93d11470aa2e14e6a3febef50d9bc7bab7a1#n523
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/gpu/drm/gma500/mdfld_dsi_output.c#L523

…
	dsi_config->fixed_mode = p_vid_funcs->get_config_mode(dev);
	if (p_vid_funcs->get_panel_info(dev, pipe, &dsi_panel_info))
			goto dsi_init_err0;
…
	dsi_config->mode = dsi_config->fixed_mode;
…
	if (!dsi_config->fixed_mode) {
		DRM_ERROR("No pannel fixed mode was found\n");
		goto dsi_init_err0;
	}
…

How do you think about to move the condition check for the data structure
member “fixed_mode” directly after the corresponding assignment?
Can it be helpful to reorder these statements a bit?

Regards,
Markus
