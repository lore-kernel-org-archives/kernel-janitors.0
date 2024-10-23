Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E261FF2
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672517; cv=none; b=CZ/X3NClpdDRhoiYjj7QtlfJ6TQk8UXEGJA5V7ZDfUo4cVpAWwTelu8dE1IatrHc/DA+uoTAlW62Dpq3QWfCrTkXgtZyp5usK8Qhoi0qUnmFqD2YFPWhsipyKNtBlMKmvqbK+t0v0Z4fIZ6U5Cg+m0xz38A1grPFAOzuZNfHKyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672517; c=relaxed/simple;
	bh=asnLS+EmH7yhaFNpb7qccfRX1olrMIisDu1X+wRh2Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3PPgJKgyzp/O6TFA8ijsqMBR5Bfmj4VfO+sOzX0gEiRPzI/53p463Dlv6qZq+rM31TuCYeD5EfQX1DRrT11HNxgyEMW1o5GeKbK+2+Rd047l2qgKEY/swGBVQU5QYDzyDkPfJ4swvAWL0VZTnaW5ZDDHqSfIueHxpUsiIKar0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IxABMWm2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IxABMWm2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso66089365e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 01:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672514; x=1730277314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9pwg9xrcCt0istZyNHx+xNVxgZiXZ5ztml68Y6uwKbU=;
        b=IxABMWm26/wnTHe+MFcSt7teFBMEjUwo/xF/G47+XFILVUq8X34V4Dn5imwUD0SITt
         6MW2/nlhH8Y/x8l1oTPR56ZSjelh32Q0CYah+rxqPi00GCNAxgnc5RZD7PWoDXu/QTNG
         ic+T2Xm01sLvouO3HOtQszRGRSnzxQ+TFZxDTq6Jq95ctIWTin+HsgLW4N0FGyRRblyZ
         7OI5qfagie0pnqLG9gdI1md3trSxpj/GahD8eqa01U2fduy4Y1BAniaZNvZZ8Woae82J
         yWG8i9AYLGo5X7YpYVeWu5dw0UkyMzf0t8TaNmZnIaBYMw7M35DRQPmfndqNl9f3YcaM
         Qspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672514; x=1730277314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pwg9xrcCt0istZyNHx+xNVxgZiXZ5ztml68Y6uwKbU=;
        b=AhzQ92N9mN/+AYks0PqrigAdIi4ErrWKw4uDX62BiyI52OiL/RuBLgtoBytFS15YJp
         EOfZ6hX9OeLYCTa9c28FDnLU3uneSIztfnohDWySQ5aVrpHQ8OTV0IcCqmlr15Xu5Rha
         NcJVQuXAnv/PdNN6/I/qIYA+385FPukckUWVm5gf2DUKzI9Ueldv8fXEY9Km1bLoqFdt
         uK2DedgQIG/H1CfEpxYj2kWkbS73bp4cM2/HweUOZJ1Xz83ZzdW5mPDshQmbWTjTBrXS
         3nC86l7ahWTkOa+6XXI9SUQET55R1VVPzNCoh9LaAmI3kqHyV2N01QjnC88PWm84WlLu
         AehA==
X-Forwarded-Encrypted: i=1; AJvYcCUbvryfmmXAOZr8wIqgjLsDd+LQ7z4QShz5zj1qkwEr9DwK+V9G30/soSHzbDUVZ/eEPB32+KQB4wb8BzqBpvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/cd6Ys9Su4gKrp66wxcPduuUuMoaZAIHJRRlr2p2WIQnIeJvw
	WjCIwxOFCyyti+Bq6V4X2oWaO+o7RwGbfW31CrZZqMELgH25ULLVW9hTB19sIV0=
X-Google-Smtp-Source: AGHT+IG6BfYRaxuQt+TZH1fYAiwXxf8JZ6zQWto1UJUldW2JmsaSAInHWPIkYLQ8xIlIQ44Z5SXl/Q==
X-Received: by 2002:a05:600c:3b16:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-43184198a99mr13532065e9.23.1729672513733;
        Wed, 23 Oct 2024 01:35:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c50947sm9710115e9.45.2024.10.23.01.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:35:13 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:35:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] wifi: rtw89: unlock on error path in
 rtw89_ops_unassign_vif_chanctx()
Message-ID: <2e85c84b-31bf-484b-b3e2-9285999bb2e4@stanley.mountain>
References: <8683a712-ffc2-466b-8382-0b264719f8ef@stanley.mountain>
 <6a80d4adc51f4ea884b5e02f16d8aaed@realtek.com>
 <931c79c15bc04be99bb87a9826cf2b04@realtek.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <931c79c15bc04be99bb87a9826cf2b04@realtek.com>

On Tue, Oct 22, 2024 at 03:32:23AM +0000, Ping-Ke Shih wrote:
> Zong-Zhe Yang <kevin_yang@realtek.com> wrote:
> > Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > > [...]
> > >
> > > @@ -1373,6 +1373,7 @@ static void rtw89_ops_unassign_vif_chanctx(struct ieee80211_hw
> > > *hw,
> > >
> > >         rtwvif_link = rtwvif->links[link_conf->link_id];
> > >         if (unlikely(!rtwvif_link)) {
> > > +               mutex_unlock(&rtwdev->mutex);
> > >                 rtw89_err(rtwdev,
> > >                           "%s: rtwvif link (link_id %u) is not active\n",
> > >                           __func__, link_conf->link_id);
> > >
> > 
> > Acked-by: Zong-Zhe Yang <kevin_yang@realtek.com>
> > 
> 
> Thanks for the ack. 
> 
> Acked-by is often used by the maintainer, so I will change it to Reviewed-by
> during committing. 

To me Acked by just means you're okay with the patch.  When I use it, it means I
don't feel qualified or interested enough to do a full review.  For example, if
I complain about a v1 patch and they fix my issue in v2 then I like to say that
I'm okay with it.  In that case I'll use Reviewed-by for a full review or Acked
by if the bits that I care about are okay.  I don't like to complain and then
just go silent.

In the end, it doesn't make any difference.  You'll get CC'd on bug reports to
do with the patch and you'll potentially feel bad for not spotting the bug, I
guess.

regards,
dan carpenter

