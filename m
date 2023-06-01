Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D10C77B7E
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jun 2023 17:40:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbjFARkB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Jun 2023 13:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbjFARjp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jun 2023 13:39:45 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB98136;
        Thu,  1 Jun 2023 10:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685641184; x=1717177184;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T10NFGdSOn3kZ70NkVkGG3eMfGwDT3os3Zr2NIy+93g=;
  b=ZuD627PUfZaFsEtHe7IPsdmeTmtY6K8pYCC57eOGS6EdUJZDGnxrgmoR
   HtSNgSJP35SBx96J7W3WVBPX0Tyz7FlsIQweH+xxMOTQ8Ey3wkFMK9Bll
   N+ZtgIWx9nzO48T1YJszHvXnT+LACxiA4jrfTwlBDy4A/fg7jGnF8EVDz
   azk7m9IOC2dGI3gE+Xd15SjQCMxoZGijbOp2VpNDwA2rC0bsEdJRebEJQ
   afj1AThRpGd2NLfvc+02fcnN9q3VKYf/hVmhqcY8/BjemOAc5LXdrpwZH
   PXj1xwUWY8nSXnQ0gwZy8QQdOp5Zndf2MCFctLGMB5Fz4Wy73GGqc4yUX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335253627"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="335253627"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 10:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737197106"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="737197106"
Received: from rcelisco-mobl.amr.corp.intel.com (HELO [10.212.207.82]) ([10.212.207.82])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 10:39:42 -0700
Message-ID: <2720a80a-4496-0ba9-e545-046ed2529f7d@linux.intel.com>
Date:   Thu, 1 Jun 2023 12:39:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Use size_t for variable passed
 to kzalloc()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
References: <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 6/1/23 12:30, Christophe JAILLET wrote:
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

looks like there are similar cases of struct_size -> u32 conversions in
other places:

struct snd_sof_control {
    u32 size;	/* cdata size */

ipc3-topology.c:        scontrol->size = struct_size(cdata, chanv,
scontrol->num_channels);
ipc3-topology.c:        scontrol->size = struct_size(cdata, chanv,
scontrol->num_channels);
ipc4-topology.c:        scontrol->size = struct_size(control_data,
chanv, scontrol->num_channels);

not sure how much of an issue this really is though?

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
>  
>  		base_cfg_ext = kzalloc(ext_size, GFP_KERNEL);
