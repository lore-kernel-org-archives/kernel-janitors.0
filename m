Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9855924A12
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 08:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710749459; cv=none; b=TEPO5C+sOE3Z9LJ6Xb9KDnRO/1SwGK+i3tbTKEF61t0ofP4C3M6V9o1qCIdWAYWteNot36VVXgB+sbA3bhivnELLND8M4xLjgcIR6krOUOw8jOhvpzIz2+UuVHz2UgHK4MArReChF/Dg5mCwIQJkdzKQio0H5fbDeG1B0Nfmh4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710749459; c=relaxed/simple;
	bh=opmeh9JyNTU62HaqhKhjZQzYJINRflOWclmPToSuOvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkhNOEjIgLx9wMNpN4jEw+dA2cSRP5zet6Qs9mTRG94MYQZRcgEHJ1InRC2WK6MRmxIl6mGMy/w2OUCdRqqGvGLoYohCFswPQg/IpzgzmEw+YpAgc3Kw8AfwSdhLpZ22z9Kyuks6x23SdA7S80Vc3UsIiZW+YiCtXsxhNmhSqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/QuOR6w; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/QuOR6w"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-568c51f44e5so1542285a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 01:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710749456; x=1711354256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E4DNi1tThxPrAjwj3MNLTkspc0oafwDCMGAENKTid3c=;
        b=j/QuOR6w9TSdjgU1TlaZerDTlRnKi4MwLIK6OD5Z6wf5Bi6Lc23Uy2w4CBDNoheNoi
         xNliQLXJJTvrCjWG3Mz9BEKmHl9awVjwFYCU7pRVoj/uwifDQ9252CK35c9D8BDyuClr
         XiM1/j/Dcx/tfo8bR62SWXBq4/tJyOVN6cAwJC1Evut9WeJaDFY7a0SfQ8pP8oAbC1Zk
         Y5xlS7pDOFqnFej6ulWXp7ncnwgzFHdGEFV7vB4jbTVD+aHD6E0cUX3iNOeLMiVW9Hy+
         hlmZmLlOQnbfsZGqcrctcKfl7ejBP67mUFItk39yw5XTnNIMxK53mIg1/YLWTbdorixk
         qqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710749456; x=1711354256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4DNi1tThxPrAjwj3MNLTkspc0oafwDCMGAENKTid3c=;
        b=rQozazULUsGPU7FXHO9VlEmd9BxVtqjM7K4cY523NGdip6y9rZo0ix5515/eP9im/f
         OXcDL0uyacU1QJoigZKNGoCZpPwFDdSOX2GaW3vv1r6O/C9l2ooQ/qpxWYqJ60WENQSy
         pwF+SGIO2GbqkCGA3ObHgVObGu/0OkiXi/pTpe+ijjbda8rqwxpnNBJ306bB7Mau0YOx
         ycvqTyRXFC6SKqloFiVf7/E/Ku7bx0aOug1YtSfN6Nirv570O8GcFeB6ObWPaRSCGiTw
         OsbWNwbdRJhixAzojfqcp6B5zCCilMOJzPCxCWmObOlfymWzPyj1M3TGhENV8gogjdQg
         /Uvg==
X-Forwarded-Encrypted: i=1; AJvYcCW6jAVBpKOSvgJ10zAJKd275QR17s4EnSWyV39CgPWbpUMSpsKmKPWnXgBzImcsaRPHw5WnvkQkofUOzl1MZZ/aW1E/YPEkE6wZXf9Jt+UU
X-Gm-Message-State: AOJu0YyhAPs8xpMI8Y6uvYcaCtN9+cR89ZP7y/8YbKwRp0uQm6789xLL
	IvA07ZIQAt91PDNnci1nW4p52bG4Vy7ob2HUiofFuqlqH9RG5g9rcKUGlitjF88=
X-Google-Smtp-Source: AGHT+IF7QDTquWD+I+K+G6iw+g4y541SJ1nIcz4EIs4ACVb80u6p6Zv/G7HRDxnFSFtqQ8VONOtvKQ==
X-Received: by 2002:a17:906:ca17:b0:a46:cef3:4aba with SMTP id jt23-20020a170906ca1700b00a46cef34abamr125127ejb.75.1710749455840;
        Mon, 18 Mar 2024 01:10:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dv22-20020a170906b81600b00a4658d3e405sm4531600ejb.196.2024.03.18.01.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 01:10:55 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:10:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] ice: Fix freeing uninitialized pointers
Message-ID: <a315177e-a9b1-4110-a176-8a909335c56f@moroto.mountain>
References: <77145930-e3df-4e77-a22d-04851cf3a426@moroto.mountain>
 <Zff0IO6nqpMiGXl5@nanopsycho>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zff0IO6nqpMiGXl5@nanopsycho>

On Mon, Mar 18, 2024 at 08:58:24AM +0100, Jiri Pirko wrote:
> Sat, Mar 16, 2024 at 10:44:40AM CET, dan.carpenter@linaro.org wrote:
> >Automatically cleaned up pointers need to be initialized before exiting
> >their scope.  In this case, they need to be initialized to NULL before
> >any return statement.
> >
> >Fixes: 90f821d72e11 ("ice: avoid unnecessary devm_ usage")
> >Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >---
> > drivers/net/ethernet/intel/ice/ice_common.c  | 4 ++--
> > drivers/net/ethernet/intel/ice/ice_ethtool.c | 2 +-
> > 2 files changed, 3 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
> >index 4d8111aeb0ff..4b27d2bc2912 100644
> >--- a/drivers/net/ethernet/intel/ice/ice_common.c
> >+++ b/drivers/net/ethernet/intel/ice/ice_common.c
> >@@ -1002,8 +1002,8 @@ static void ice_get_itr_intrl_gran(struct ice_hw *hw)
> >  */
> > int ice_init_hw(struct ice_hw *hw)
> > {
> >-	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree);
> >-	void *mac_buf __free(kfree);
> >+	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree) = NULL;
> >+	void *mac_buf __free(kfree) = NULL;
> > 	u16 mac_buf_len;
> > 	int status;
> > 
> 
> How about similar issues in:
> ice_set_fc()
> ice_cfg_phy_fec()
> ?

Yeah.  Sorry, I'll resend.  Smatch didn't warn about those bugs because
the sanity checks are the begining of the functions:

	if (!pi || !aq_failures)
		return -EINVAL;

are never true...  It's the first time I've run into this as an issue.

regards,
dan carpenter

