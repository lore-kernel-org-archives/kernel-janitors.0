Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E8DC433B4
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 07:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9D0F61244
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 07:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhETH4L (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 May 2021 03:56:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:40714 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhETH4K (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 03:56:10 -0400
IronPort-SDR: q0fbCxQp5X1JG0u7LWqu00GO9ATR4qUNqBAzuDTHyja7MwbhownrtlpYNuooa30HW/SBJoZ7ZW
 iFcm8beXx79g==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262392324"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="262392324"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 00:54:49 -0700
IronPort-SDR: ups5F9VQr9xbsXWpKlRCLzsiRI1OJ8s3Sve52o0l1OEKSKyrjaNHKeNLIdKBd8b8Nq6qTEuLbM
 Ejwyn/BnFHBQ==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="473886845"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.88]) ([10.237.180.88])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 00:54:46 -0700
Subject: Re: [PATCH 2/2] ASoC: topology: Fix a small leak in
 soc_tplg_dapm_graph_elems_load()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
References: <YKXunAOB1DJ4dT5p@mwanda>
From:   =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Message-ID: <fe3d1825-aaae-0426-ad18-0e543f3fea1f@linux.intel.com>
Date:   Thu, 20 May 2021 09:54:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YKXunAOB1DJ4dT5p@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/20/2021 7:07 AM, Dan Carpenter wrote:
> We have to kfree(routes) on this error path.
> 
> Fixes: ff9226224437 ("ASoC: topology: Change allocations to resource managed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   sound/soc/soc-topology.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 6b7a813bc264..5730fcaa7bc6 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1135,8 +1135,10 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>   	 */
>   	for (i = 0; i < count; i++) {
>   		routes[i] = devm_kzalloc(tplg->dev, sizeof(*routes[i]), GFP_KERNEL);
> -		if (!routes[i])
> -			return -ENOMEM;
> +		if (!routes[i]) {
> +			ret = -ENOMEM;
> +			goto free_routes;
> +		}
>   	}
>   
>   	for (i = 0; i < count; i++) {
> @@ -1198,6 +1200,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>   	 * The memory allocated for each dapm route will be freed
>   	 * when it is removed in remove_route().
>   	 */
> +free_routes:
>   	kfree(routes);
>   
>   	return ret;
> 

Yes, that's right, however looking at this function again, I wonder if 
instead we can just get rid of the routes array and kcalloc call?

Something along those lines (hope that copy paste won't mess it up):



diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 73076d425efb..13db9cfe223f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1104,7 +1104,7 @@ static int soc_tplg_dapm_graph_elems_load(struct 
soc_tplg *tplg,
  {
         struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
         struct snd_soc_tplg_dapm_graph_elem *elem;
-       struct snd_soc_dapm_route **routes;
+       struct snd_soc_dapm_route *route;
         int count, i;
         int ret = 0;

@@ -1122,28 +1122,15 @@ static int soc_tplg_dapm_graph_elems_load(struct 
soc_tplg *tplg,
         dev_dbg(tplg->dev, "ASoC: adding %d DAPM routes for index 
%d\n", count,
                 hdr->index);

-       /* allocate memory for pointer to array of dapm routes */
-       routes = kcalloc(count, sizeof(struct snd_soc_dapm_route *),
-                        GFP_KERNEL);
-       if (!routes)
-               return -ENOMEM;
-
-       /*
-        * allocate memory for each dapm route in the array.
-        * This needs to be done individually so that
-        * each route can be freed when it is removed in remove_route().
-        */
         for (i = 0; i < count; i++) {
-               routes[i] = devm_kzalloc(tplg->dev, sizeof(*routes[i]), 
GFP_KERNEL);
-               if (!routes[i])
+               route = devm_kzalloc(tplg->dev, sizeof(*route), GFP_KERNEL);
+               if (!route)
                         return -ENOMEM;
-       }

-       for (i = 0; i < count; i++) {
                 elem = (struct snd_soc_tplg_dapm_graph_elem *)tplg->pos;
                 tplg->pos += sizeof(struct snd_soc_tplg_dapm_graph_elem);

-               /* validate routes */
+               /* validate route */
                 if (strnlen(elem->source, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
                             SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
                         ret = -EINVAL;
@@ -1160,46 +1147,32 @@ static int soc_tplg_dapm_graph_elems_load(struct 
soc_tplg *tplg,
                         break;
                 }

-               routes[i]->source = elem->source;
-               routes[i]->sink = elem->sink;
+               route->source = elem->source;
+               route->sink = elem->sink;

                 /* set to NULL atm for tplg users */
-               routes[i]->connected = NULL;
+               route->connected = NULL;
                 if (strnlen(elem->control, 
SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0)
-                       routes[i]->control = NULL;
+                       route->control = NULL;
                 else
-                       routes[i]->control = elem->control;
+                       route->control = elem->control;

                 /* add route dobj to dobj_list */
-               routes[i]->dobj.type = SND_SOC_DOBJ_GRAPH;
-               routes[i]->dobj.ops = tplg->ops;
-               routes[i]->dobj.index = tplg->index;
-               list_add(&routes[i]->dobj.list, &tplg->comp->dobj_list);
+               route->dobj.type = SND_SOC_DOBJ_GRAPH;
+               route->dobj.ops = tplg->ops;
+               route->dobj.index = tplg->index;
+               list_add(&route->dobj.list, &tplg->comp->dobj_list);

-               ret = soc_tplg_add_route(tplg, routes[i]);
+               ret = soc_tplg_add_route(tplg, route);
                 if (ret < 0) {
                         dev_err(tplg->dev, "ASoC: topology: add_route 
failed: %d\n", ret);
-                       /*
-                        * this route was added to the list, it will
-                        * be freed in remove_route() so increment the
-                        * counter to skip it in the error handling
-                        * below.
-                        */
-                       i++;
                         break;
                 }

                 /* add route, but keep going if some fail */
-               snd_soc_dapm_add_routes(dapm, routes[i], 1);
+               snd_soc_dapm_add_routes(dapm, route, 1);
         }

-       /*
-        * free pointer to array of dapm routes as this is no longer needed.
-        * The memory allocated for each dapm route will be freed
-        * when it is removed in remove_route().
-        */
-       kfree(routes);
-
         return ret;
  }


