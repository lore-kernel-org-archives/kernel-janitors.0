Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00B2C77B7A
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jun 2023 09:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbjFBJve (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Jun 2023 05:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234879AbjFBJvc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Jun 2023 05:51:32 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D08C0
        for <kernel-janitors@vger.kernel.org>; Fri,  2 Jun 2023 02:51:31 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f70fc4682aso17514225e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Jun 2023 02:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685699490; x=1688291490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zGtSPD/KSvWTuHa/AA+uczmQU/ENOiQMfRsZQeajJ5I=;
        b=P+KNl/NxHb1htEUlM/JYGx6KvK0eHnRM1/FNkMDOULUzpQN5tQYzbSeWXp3UJz/mpr
         EQm1ZN77g2419QZCiDqctQYEzlaus5armw/606j9Rrxu4M3n3btbrexCK7Rp6QGfj6gS
         mOHrDofQiL181qUvzVK7sItn/sbDLHtqL/QX/EVic5HLWHr1NCYlK0G131KduHfxRcjH
         SMqnAgmXBnVv3L6y+jnIOWVk1CPIHPa6gre93EgFakek5vS8YyOlLQSjA2+1z39qZU+X
         SYVslyW20kz2S1z75HvMLjKPMk64OoPwK+hJPy2UchNMx70/lB+0qvlOVmraGe3QZIGF
         DM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685699490; x=1688291490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGtSPD/KSvWTuHa/AA+uczmQU/ENOiQMfRsZQeajJ5I=;
        b=J2lAZOJA0OdK/Vlphw3pde6C0StCc21+h+pkoYi1crSel2J/0v3/BZWlhJZPslmR5s
         ar34jpXz1sCpTl1j4sXOcZzprMk3rkIvt4hwbi8h7Ysz+elG+BNoV0H1YnSN0sqfd1zP
         /qGtnxdqbW05ktv/nJNLQzFXJZNMGrA1YfOlMKXHuW3/jdRdPK6WRPeoRLGG9Lwr76Mk
         67NTepig9MH1E3Z/ac4PvpOc0SmffNwi8Tur7EcP000mI16o/rvF7ilDKc+HXnwoaeEn
         Ak0xBsqzvGwqaeKoR16FZjthE/IAk9UkpAxQ5mtHlYKpgFwjoRB8oVVxgWGqv0gYh2+w
         O8oQ==
X-Gm-Message-State: AC+VfDxv+5IfodOvJ9xcdwneMeK/U7Y999uKIktf/sTiPbiq91wV8LQz
        5EC3Q+23enmUu4jtjNi4et18yQ==
X-Google-Smtp-Source: ACHHUZ6A1brfLCWWqQzljL7Mxmx2fPEHJx0/q/zn0bbgPiI4NqAwmYm0kU04EGZGKPiNYZHBwKX3cw==
X-Received: by 2002:adf:e988:0:b0:307:95d1:d7d0 with SMTP id h8-20020adfe988000000b0030795d1d7d0mr4253499wrm.39.1685699489831;
        Fri, 02 Jun 2023 02:51:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4585000000b003078354f774sm1185082wrq.36.2023.06.02.02.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:51:28 -0700 (PDT)
Date:   Fri, 2 Jun 2023 12:51:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Use size_t for variable passed
 to kzalloc()
Message-ID: <311dd225-9d30-4100-a779-bd0a9499535f@kadam.mountain>
References: <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 01, 2023 at 07:30:12PM +0200, Christophe JAILLET wrote:
> struct_size() checks for overflow, but assigning its result to just a u32
> may still overflow after a successful check.
> 
> Use a size_t instead in order to be cleaner.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Based on analysis from Dan Carpenter on another patch (see [1]).
> 
> [1]: https://lore.kernel.org/all/00e84595-e2c9-48ea-8737-18da34eaafbf@kili.mountain/
> ---
>  sound/soc/sof/ipc4-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index db64e0cb8663..50faa4c88b97 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -881,7 +881,7 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
>  	/* allocate memory for base config extension if needed */
>  	if (process->init_config == SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT) {
>  		struct sof_ipc4_base_module_cfg_ext *base_cfg_ext;
> -		u32 ext_size = struct_size(base_cfg_ext, pin_formats,
> +		size_t ext_size = struct_size(base_cfg_ext, pin_formats,
>  						swidget->num_input_pins + swidget->num_output_pins);

The temptation would be to change the addition as well:

	size_t ext_size = struct_size(base_cfg_ext, pin_formats,
				      size_add(swidget->num_input_pins, swidget->num_output_pins);

These values can only be in the 0-8 range so it's not a real bug.

Smatch cannot parse this data correctly to verify that it is safe.
Maybe in two years Smatch will be able to.  Probably a human who is
unfamiliar with this code can figure out that it is safe within 15
minutes?

I think the change to size_t doesn't hurt anyone and there isn't any
downside to it.  The size_add() change is slightly less readable than
just adding the numbers but I think eventually people will just get used
to it.

regards,
dan carpenter
