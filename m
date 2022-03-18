Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE35FC433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Mar 2022 16:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238656AbiCRQR0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Mar 2022 12:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238699AbiCRQRY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Mar 2022 12:17:24 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789D81D78AF
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Mar 2022 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647620160; x=1679156160;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kk0QEZb6sU6ljmyBf5iZtjDtuEKxL+HDQZU1VPh1Xao=;
  b=fv3NwFvoxLwvB+8udH94lwlH5jP6t4SAUZRO1qZqbdJWbWR900jChadi
   wC97fjKi1HFq14rpb8JD8gNxMmsMcN4EPYhBIHNtatghrwolwjFF+1YJU
   bzY1MS6mDpdpR10aBHNnT+2wq0kpH5LbnTJCnRQPRsP85fXSVczwM/SR3
   xofxA8VsXpXXWW1SANpsN+pvasHGVGE4kB7/Vo75ryvIYzVIOf3Gg/h4d
   tmI8fuBth6dpgcnkkzl+eHjWApSf1/ZsyBosnKytzwzoxyL4JoMV4JXlC
   yYcDLiaYevo98vJC52dZGlmqpEGWPOYMzn5xC4MdjaPAKQzmcWSaM4Oh6
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="343600292"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="343600292"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 09:14:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="513940889"
Received: from dcforman-mobl1.amr.corp.intel.com ([10.254.51.56])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 09:14:55 -0700
Message-ID: <1049c2410500a3a9ed97f83b5e41e89a74102c96.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Prevent NULL dereference in
 sof_pcm_dai_link_fixup()
From:   Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        =?ISO-8859-1?Q?P=E9ter?= Ujfalusi 
        <peter.ujfalusi@linux.intel.com>,
        sound-open-firmware@alsa-project.org
Date:   Fri, 18 Mar 2022 09:14:55 -0700
In-Reply-To: <cf4c4a84-335d-8799-7a5b-afe298881342@linux.intel.com>
References: <20220318071233.GB29472@kili>
         <cf4c4a84-335d-8799-7a5b-afe298881342@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2022-03-18 at 09:42 -0500, Pierre-Louis Bossart wrote:
> 
> On 3/18/22 02:12, Dan Carpenter wrote:
> > The "dia" pointer can be NULL, so handle that condition first
> > before
> > storing "dia->private".
> > 
> > Fixes: 839e484f9e17 ("ASoC: SOF: make struct snd_sof_dai IPC
> > agnostic")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks for the patch.
> 
> This part will be removed in follow-up patches, likely the reason
> why 
> this problem was missed.

Hi Dan/Pierre,

Both these problems are address in the series I posted yesterday.
Particularly patches 16 and 18.

Thanks,
Ranjani
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> > ---
> >   sound/soc/sof/pcm.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> > index 1661b0bc6f12..71f5bce0c4c7 100644
> > --- a/sound/soc/sof/pcm.c
> > +++ b/sound/soc/sof/pcm.c
> > @@ -702,7 +702,7 @@ int sof_pcm_dai_link_fixup(struct
> > snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
> >   	struct snd_sof_dai *dai =
> >   		snd_sof_find_dai(component, (char *)rtd->dai_link-
> > >name);
> >   	struct snd_sof_dev *sdev =
> > snd_soc_component_get_drvdata(component);
> > -	struct sof_dai_private_data *private = dai->private;
> > +	struct sof_dai_private_data *private;
> >   	struct snd_soc_dpcm *dpcm;
> >   
> >   	/* no topology exists for this BE, try a common configuration
> > */
> > @@ -727,6 +727,7 @@ int sof_pcm_dai_link_fixup(struct
> > snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
> >   	/* read format from topology */
> >   	snd_mask_none(fmt);
> >   
> > +	private = dai->private;
> >   	switch (private->comp_dai->config.frame_fmt) {
> >   	case SOF_IPC_FRAME_S16_LE:
> >   		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);

