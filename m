Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965091E3DE8
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793105; cv=none; b=hnnY18/EBYL+WsPbNIvjM3iOBep27vx+HK6s8tArVpEWGPY9LgmYIFd4TIdqrA62JVKB/eKmRnjmL9XIZnCMfQvFlK9nwliKXvV4MUjpdtETeFUvowzEcfCaK6aYjvg2GX4FwpuNeZ12lWxcQ03BOhxEmlioW5093XXVcAimOCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793105; c=relaxed/simple;
	bh=Emp6Z3aIQvwk7fgn4fyq/ADmvkKqA6pgqsXlO4s06/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m79tzAulbk3lJnQxO5hl2edJWKUK3mTA5dAOapGlTNbbfr1HfuDVhULWRkOSdjZu5l612MicDElaFoQqa7dDDBAAFMREXCWCVPU9s3GZVk7lfqBDF5FEqFYfTHRPr2vUohwW2AFsdyhkbrlsOqWcpVRXmVuMIp2SVIj7tJ6CDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EJLSYGBx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJLSYGBx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913cf69784so4921321f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741793102; x=1742397902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fLzKPMExXtwTBCfsr8dbxK/LiBLIFtL0pBVuR4STJfg=;
        b=EJLSYGBxA0Gl6eQ60LDZb/afzU9576enjDJ6bpfkzzd/V1MPVl+Zj4k97gZw398DUo
         h+mo/0/QqIdOXXQvXs2n450nr5KuUwsKL10AGQ6fLuxWgNQrpPBYPjAk3FEHI4BYkZow
         RdgkPh1rMrEWCmdnbGjmy+AXhzU9DFUNYAQJcbHRicdHEppoGnwJx6DJAXaMIsxrlTuX
         xvR3yQDPGaW4nOJjj1H6ejwMJV3lCczXVW0A3z2O05UUr977Ryltld26jwmjdMY+okdd
         IlEv42cQ5dcenJSrY4CrfhQEX4wyMlFqmi8hqMyGZRI8fhwCk74/DoKiBAE9kwYi2L3f
         ChtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741793102; x=1742397902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLzKPMExXtwTBCfsr8dbxK/LiBLIFtL0pBVuR4STJfg=;
        b=jZYzQMg8F9g+pXWOq2JE5UYW4nL1gxU8n3Ixjj8PNu38r7U4y2HwnH/VlQVpMxvUge
         t3bvxZRMobauqEWEFRuODgs6JUBMZmQTOjRe8Zq3lTmqd6YuMNxfwPDoHEwoiPqhGjB7
         crvTFlWKXNA8QasaPbLd6J6OXkI02cNn8krFHGLx77sJS7U/aexSStq470eCJKA9CguC
         z3dxNoin460sXCIFd0UXpVdTAUTiH2aCSEVgX1esnZ9tHfR5zFNjeOTSlCYJ7zjACBdL
         5VqffzrrV7jD0MPF8ICAa8IdGO58iAQtQxPYEC+dwTkhY/Hhmb0NT4gFLECt886vkdx9
         3wUA==
X-Forwarded-Encrypted: i=1; AJvYcCVOpwdl+bKheKn7c4lai2o2HQmk7nIxwyglk5CvBqjTnidFxXbAC0/eB7ot4sRvvo+A7eLLADN+21V5xAmpNp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGNLD87YExI8OgHJJq+zz+n1iTeorCwP2m3ZBGQw/hYOKhs7H0
	nPlnshFaT+ZURJQFiO2zXdqdUJarEBofThxIjaCNg4w4Z5ZUB4gLibKENiwY6bo=
X-Gm-Gg: ASbGncuY2Lto1IgHVXacjpn6m0ohsy7FC0RWBBbqQkN2oCfSJcfQKvJu9jGfP34Yil8
	UOYonY4N3nWi8OGrUubGURWt1/up6OavucClOVsh0C8XGlYNtcn9j23eucSkZE9kaEsM6zwHOfV
	R4Lw5D+/dIHafmeBjpbI0QumEMNHQfAsFh+/0KQqA6jb6lddrGmwDR/Dzz4206kzcaNvohFVHNm
	B/GLfgPNnvMiFEqxTCEO3L5DXSGXANN+KClUHk3LUXTDHv2nhR+TtoVZ31vxeTC76PArQDkXFWx
	GxoZcXaJp91Om8idNwxKBXstZQSdOS3fveSpPS0+5bvHNDzLrg==
X-Google-Smtp-Source: AGHT+IHn215KXGxBksWYO6IGqlkECpcXD3aN6+wMQCz0c2YurmIv585IQFuPkM2YCeNe5QHeih3GEA==
X-Received: by 2002:a05:6000:1849:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39132d21141mr22108859f8f.15.1741793101874;
        Wed, 12 Mar 2025 08:25:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d0a8c5cbfsm23813665e9.30.2025.03.12.08.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 08:25:01 -0700 (PDT)
Date: Wed, 12 Mar 2025 18:24:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Daniel Gabay <daniel.gabay@intel.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: iwlwifi: Fix uninitialized variable with
 __free()
Message-ID: <341d748f-55ae-451b-983a-ca9684d265b7@stanley.mountain>
References: <f7c17a7f-f173-43bf-bc39-316b8adde349@stanley.mountain>
 <a21610ae-e155-44bc-bcc5-b9b8b1c8cbd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a21610ae-e155-44bc-bcc5-b9b8b1c8cbd1@oss.qualcomm.com>

On Wed, Mar 12, 2025 at 08:15:18AM -0700, Jeff Johnson wrote:
> On 3/12/2025 1:31 AM, Dan Carpenter wrote:
> > Pointers declared with the __free(kfree) attribute need to be initialized
> > because they will be passed to kfree() on every return path.  There are
> > two return statement before the "cmd" pointer is initialized so this
> > leads to an uninitialized variable bug.
> > 
> > Fixes: d1e879ec600f ("wifi: iwlwifi: add iwlmld sub-driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/net/wireless/intel/iwlwifi/mld/debugfs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c b/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
> > index c759c5c68dc0..1d4b2ad5d388 100644
> > --- a/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
> > +++ b/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
> > @@ -556,8 +556,8 @@ iwl_dbgfs_vif_twt_setup_write(struct iwl_mld *mld, char *buf, size_t count,
> >  	};
> >  	struct ieee80211_vif *vif = data;
> >  	struct iwl_mld_vif *mld_vif = iwl_mld_vif_from_mac80211(vif);
> > +	struct iwl_dhc_cmd *cmd __free(kfree) = NULL;
> 
> hmm, I thought the recommended convention was to define __free() pointers at
> the point of allocation. cleanup.h explicitly says:
> 
>  * Given that the "__free(...) = NULL" pattern for variables defined at
>  * the top of the function poses this potential interdependency problem
>  * the recommendation is to always define and assign variables in one
>  * statement and not group variable definitions at the top of the
>  * function when __free() is used.
> 

People do it either way.  I'm agnostic so long as it doesn't have bugs.

regards,
dan carpenter

