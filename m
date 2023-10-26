Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9956BC25B6B
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Oct 2023 10:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235051AbjJZKmv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Oct 2023 06:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbjJZKmc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Oct 2023 06:42:32 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE10D69
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 03:42:06 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so10991981fa.3
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698316924; x=1698921724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyCnnP8S53LJCOoW53IAuKx0l5pIW3cQAjaLRYUze6c=;
        b=ze52VoPs7EcBjo3QVgXuBaJ1WpLcLIhODqEEZb/hebAp2rfWBim9jNiuKJxrsVALkD
         1l6sj29ZDxpT6LmAh33AzfmIkzx+6Cc4rMxykij38rKvL9iC9XQKJ3OtiJDYGov5AcPz
         raQ8qwmxB66qBs9MFKFDmGtCykLiTAIfZMnedGNWtqRnLyG4iaGBupMBxwD2mwu6seVk
         tD4Q4CD7VAuSx2iOuce31OOSzlspGd1ofMv987qLOL6HuRWNL6FJYakVQmdW5GboJQ96
         0+qBo4IpY3gy+4a8shHfeAd9seEsvr1aSA4wRXIgij9tFq/+mSCR6tyR+ZxQ87thTJ8O
         boFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698316924; x=1698921724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyCnnP8S53LJCOoW53IAuKx0l5pIW3cQAjaLRYUze6c=;
        b=XDWsUd0ueLhBnrP6AAH+TkKcMRrlx5EVNZDunixvA/V9rqCBxcwZ02p9PsRkTdMlxg
         iNG8xNeFFjf/O/P66qFJUmw2w+AaGRe62kjX2LHHRQZ8Nxm/SiK08PcueBecmvYeUjlB
         /SnOEfsPsG/BJkGchJBN0uSx5EVgDYjvznILlPhVaju4eiDRYcs3mJIe9E320zqN8B10
         TIoMMllD8nse/5MOb2WNuZakVai3TOUim6dxmNXZgtDrV9M4FXZJypqU+w70nwkq4G67
         1pX6f0DfdJAjI1kGWw0mxMbIt0/1DVkumToXdtdVvwS4Ksxq7FjvCbfltPHyWPJo01eg
         mGcA==
X-Gm-Message-State: AOJu0YzHM1B/ifFnCzLK1dD8ha1y050yYmYb89ZlppSEzgDIEpWdVgRB
        aeX37vtAE0fFfM78RJ0L87tYEQ==
X-Google-Smtp-Source: AGHT+IG1GMne5atwKenhd1l2WoZcVdwnLhRNArbCtQrH7H4ObuobEPO35dMkQ2loeI0+gr3ts9F+8A==
X-Received: by 2002:a2e:be14:0:b0:2c5:380:7bff with SMTP id z20-20020a2ebe14000000b002c503807bffmr13441810ljq.25.1698316924463;
        Thu, 26 Oct 2023 03:42:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c021a00b0040813e14b49sm2188665wmi.30.2023.10.26.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:42:04 -0700 (PDT)
Date:   Thu, 26 Oct 2023 13:42:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Gregory Greenman <gregory.greenman@intel.com>
Cc:     Kalle Valo <kvalo@kernel.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Shaul Triebitz <shaul.triebitz@intel.com>,
        linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] wifi: iwlwifi: mvm: fix an error code in
 iwl_mvm_mld_add_sta()
Message-ID: <79f70bb6-ca33-48fc-ab33-6a6cd8ba2e1d@kadam.mountain>
References: <75e4ea09-db58-462f-bd4e-5ad4e5e5dcb5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75e4ea09-db58-462f-bd4e-5ad4e5e5dcb5@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Ping?

regards,
dan carpenter

On Wed, Sep 27, 2023 at 03:40:41PM +0300, Dan Carpenter wrote:
> This error path should return -EINVAL instead of success.
> 
> Fixes: 57974a55d995 ("wifi: iwlwifi: mvm: refactor iwl_mvm_mac_sta_state_common()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> I copy and pasted this approach from similar code in the same patch.
> 
>  drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c b/drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c
> index 1464aad039e1..f2e952481ff8 100644
> --- a/drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c
> +++ b/drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c
> @@ -707,8 +707,10 @@ int iwl_mvm_mld_add_sta(struct iwl_mvm *mvm, struct ieee80211_vif *vif,
>  			rcu_dereference_protected(mvm_sta->link[link_id],
>  						  lockdep_is_held(&mvm->mutex));
>  
> -		if (WARN_ON(!link_conf || !mvm_link_sta))
> +		if (WARN_ON(!link_conf || !mvm_link_sta)) {
> +			ret = -EINVAL;
>  			goto err;
> +		}
>  
>  		ret = iwl_mvm_mld_cfg_sta(mvm, sta, vif, link_sta, link_conf,
>  					  mvm_link_sta);
> -- 
> 2.39.2
