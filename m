Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7C127B53
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Mar 2024 15:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711035284; cv=none; b=FpQ6Apd9KbCOxot7UCi7z4W++N0kbxAKx8/ZseogUTwhi811vdXua8DW/q1PCfhE1EY1XX2ddpUCelrpuPCcRCZqwlXgC8ulGl7VA4YE/ZsfVk12+GMAbtNpesTBiK0pn/FpmdQsBuPATI4XxcLucOuH7MpOiZvm8mhL1H2fZUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711035284; c=relaxed/simple;
	bh=0zc0ujxsUZDSCIMa8DgsBxEKHxlROrz8eSt1YZrNcQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+evyHDNBC8QCuCiU3iVl4ImMTJp4/9AnxWs2WnrrUpHW8sd1W/J8o61Cv8jYGh/Xg4smez+42qWm05DpVt9cIjnKqz0nub0V4PhqIV1ye56qsJdt5Vk80gjWoQF8141sciBW5dsYdh2ZVERYeZpRyjgCJBPldUTUtsMa1cHjUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=rBJFnCZ8; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="rBJFnCZ8"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a468004667aso163225366b.2
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Mar 2024 08:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1711035280; x=1711640080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJZsBHwcwq2EKhTfcmV2KDI1h+H2DDxIsRSU6ooknBA=;
        b=rBJFnCZ8c3RnzjxFqOxzxWJgQxe7jDYkFCqIH/I+fB+EkHpRmALmBcSvc3iZuvZzpS
         c1FgWMQ97WBNK5QcioH/mp7nJdfZk62SZbHxQMBc3o9a+KEwOdDWM4kLQj43RWvEbpIq
         CSiqr72MaK2JeaSuZNIhqY17FnnOacF1o4Cet+NLrV/bAcWuEpVeBcQLByR9el/ESeAh
         5rXJrIMtwBIIW7tMCcIyszaR5Lt0CoAY0hdyQVFG3y0sO/Xm5QytDbkoNLP7wqMLUktT
         4cG3UYMwpAg6HShIi7aClPYV2rMipYC5FZ5Y0Mi88qQHF59MltgMvJXQI4bsNXMoa+wF
         VcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711035280; x=1711640080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJZsBHwcwq2EKhTfcmV2KDI1h+H2DDxIsRSU6ooknBA=;
        b=t3BwY7wxqJuxyjZaO8cRlD5pi0WTMLTkWYMeWU8gEQSuAYcCkG10f02baRq/avdzX/
         1qbJr4siQDNEy7933YGwm8StymMeqpJA0njcEWh+cISHr7b/CCs0Tebshj0Zj8AFwtkn
         BzJivNXBwf3ZxCgqnNPeL4oFRHbXioaF77qeC2nmfX+iP7a25olLkVJXcTxWakn4els6
         gyNOB7388/aNyco6hsYAXdLFZE1yFyymUAqu1TIlXngYBTWSWE9cx5yBE1gOQkfLIMlG
         QJvM+vJrWWfHqiE5RzGG2Yvq2eUgPiD5vaxZxtbvy8m3H+CMa2nZh5ebxEl4xELz2Jre
         0hUw==
X-Forwarded-Encrypted: i=1; AJvYcCWNzZ0cdDghw2LLSpNmbNAvSikwlyHQyLisWb38+9wJmr/kbyU7YFnLA6WRrUPmg65UA6Iv2sbNav13Y8t/F8imCcbZSR4qfYUs9+ojd35y
X-Gm-Message-State: AOJu0Yx3R1xcHJmlHBvaVsAH+j3pbo9yUNTc5MM0rVBEeyeB2Smb+iTo
	3wtUsl5laykssB1Nfr+WQgUZ1tLITeBjhuJ+CAFMLDvomV6w41gzhbQSe1amwwU=
X-Google-Smtp-Source: AGHT+IGBqgVfVrdiQ/+9M8CkXnHsQmBgBd+MDFecT1hmDvu9F6AyiYmNOC25nNXzC5ijEZZ+4GiHwQ==
X-Received: by 2002:a17:906:ee89:b0:a46:be83:36e2 with SMTP id wt9-20020a170906ee8900b00a46be8336e2mr10664449ejb.24.1711035280409;
        Thu, 21 Mar 2024 08:34:40 -0700 (PDT)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id n19-20020a170906725300b00a46a9c38a64sm39732ejk.65.2024.03.21.08.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 08:34:39 -0700 (PDT)
Date: Thu, 21 Mar 2024 16:34:37 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 net] ice: Fix freeing uninitialized pointers
Message-ID: <ZfxTjYUPAFz_LRlk@nanopsycho>
References: <0efe132b-b343-4438-bb00-5a4b82722ed3@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0efe132b-b343-4438-bb00-5a4b82722ed3@moroto.mountain>

Thu, Mar 21, 2024 at 03:42:12PM CET, dan.carpenter@linaro.org wrote:
>Automatically cleaned up pointers need to be initialized before exiting
>their scope.  In this case, they need to be initialized to NULL before
>any return statement.
>
>Fixes: 90f821d72e11 ("ice: avoid unnecessary devm_ usage")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>


>---
>v2: I missed a couple pointers in v1.
>
>The change to ice_update_link_info() isn't required because it's
>assigned on the very next line...  But I did that because it's harmless
>and makes __free() stuff easier to verify.  I felt like moving the
>declarations into the code would be controversial and it also ends up
>making the lines really long.
>
>		goto goto err_unroll_sched;
>
>	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree) =
>		kzalloc(sizeof(*pcaps), GFP_KERNEL);

Yeah, that is why I'm proposing KZALLOC_FREE helper:
https://lore.kernel.org/all/20240315132249.2515468-1-jiri@resnulli.us/


>
> drivers/net/ethernet/intel/ice/ice_common.c | 10 +++++-----
> drivers/net/ethernet/intel/ice/ice_ethtool.c | 2 +-
> 2 file changed, 6 insertion(+), 6 deletion(-)
>
>diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
>index 4d8111aeb0ff..6f2db603b36e 100644
>--- a/drivers/net/ethernet/intel/ice/ice_common.c
>+++ b/drivers/net/ethernet/intel/ice/ice_common.c
>@@ -1002,8 +1002,8 @@ static void ice_get_itr_intrl_gran(struct ice_hw *hw)
>  */
> int ice_init_hw(struct ice_hw *hw)
> {
>-	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree);
>-	void *mac_buf __free(kfree);
>+	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree) = NULL;
>+	void *mac_buf __free(kfree) = NULL;
> 	u16 mac_buf_len;
> 	int status;
> 
>@@ -3272,7 +3272,7 @@ int ice_update_link_info(struct ice_port_info *pi)
> 		return status;
> 
> 	if (li->link_info & ICE_AQ_MEDIA_AVAILABLE) {
>-		struct ice_aqc_get_phy_caps_data *pcaps __free(kfree);
>+		struct ice_aqc_get_phy_caps_data *pcaps __free(kfree) = NULL;
> 
> 		pcaps = kzalloc(sizeof(*pcaps), GFP_KERNEL);
> 		if (!pcaps)
>@@ -3420,7 +3420,7 @@ ice_cfg_phy_fc(struct ice_port_info *pi, struct ice_aqc_set_phy_cfg_data *cfg,
> int
> ice_set_fc(struct ice_port_info *pi, u8 *aq_failures, bool ena_auto_link_update)
> {
>-	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree);
>+	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree) = NULL;
> 	struct ice_aqc_set_phy_cfg_data cfg = { 0 };
> 	struct ice_hw *hw;
> 	int status;
>@@ -3561,7 +3561,7 @@ int
> ice_cfg_phy_fec(struct ice_port_info *pi, struct ice_aqc_set_phy_cfg_data *cfg,
> 		enum ice_fec_mode fec)
> {
>-	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree);
>+	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree) = NULL;
> 	struct ice_hw *hw;
> 	int status;
> 
>diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/ethernet/intel/ice/ice_ethtool.c
>index 255a9c8151b4..78b833b3e1d7 100644
>--- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
>+++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
>@@ -941,11 +941,11 @@ static u64 ice_loopback_test(struct net_device *netdev)
> 	struct ice_netdev_priv *np = netdev_priv(netdev);
> 	struct ice_vsi *orig_vsi = np->vsi, *test_vsi;
> 	struct ice_pf *pf = orig_vsi->back;
>+	u8 *tx_frame __free(kfree) = NULL;
> 	u8 broadcast[ETH_ALEN], ret = 0;
> 	int num_frames, valid_frames;
> 	struct ice_tx_ring *tx_ring;
> 	struct ice_rx_ring *rx_ring;
>-	u8 *tx_frame __free(kfree);
> 	int i;
> 
> 	netdev_info(netdev, "loopback test\n");
>-- 
>2.43.0
>
>
>
