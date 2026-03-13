Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AED3603EB
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Mar 2026 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424274; cv=none; b=OI4ss2q5Pw9znTGnn88AhAmifqNVGyaptWfFIa7hn/x7C+XxodBNUkYcQzOkdB4ugsAFRIHx84iAShbpsh2ABJjj9BW5WEhHt1vfOjVlaJZOOPPLdVAffTv099H44CmFs52FlNkuZQeaQirI8Cs4rQqhgBScbJKrwJzrEnh4dPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424274; c=relaxed/simple;
	bh=qvsKtgFzPXN+lLScDp+m8HgvSi6kxwQ4R4oo464TpwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzxKD9d8LPVcNex3LV6l3hDodzdPveH75kngc/pCq+m4JgVAbmWBBVH6+v50dC0UE7StkSqjd52s/xe6nXgaYzcjb2S0PTDi6NIzNM+shjLroyibn4Leb8ZJQGIm8V/eFJaXH3mISs/HVBqS9qH0BfGOhs05jLvFPlamCpEfIkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=TdEPBI/+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="TdEPBI/+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829abaaa92bso1638405b3a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Mar 2026 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1773424273; x=1774029073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ski0FE2bQULyvUQFwoDAaSkxf64xsZOdGRUr53F3qI=;
        b=TdEPBI/+wTxj8FSgNM94AUShLvZUM+8PlbQ2C8Gjjz0RpH2hnyv6fEYNl5iBN28Dqp
         612Z/Wgm9/ttkbD5spRPB4cKGP8ERi4/BwPFzZJFokeDOGu93QRFGw9arZRgbbN40CjG
         eIB6iyJxR5TVW5EJEu0lUXw/JS51C0nakPRPorolqjV+c7t/UgTSX4KUomuNsBfu1WEb
         NC2HnokmPUr5SYHUI+18g4ct3Xu1jAKjtDsocTE8AKJ+JjK987yoTMEetxrs/lh2jYam
         i3qKK2HRGGLgdHf+1tJcEmZGBh+xUMbYubSj2T2JLLZ8/zKvlQzLi2NcgR8jhOrPCrqK
         K/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424273; x=1774029073;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ski0FE2bQULyvUQFwoDAaSkxf64xsZOdGRUr53F3qI=;
        b=IF07jWSS0rzL4G+vdmgJfT0n63Zxoa9PU8U/ZYzEtzZUtk7aQ+NIrlSc42cdKWgl87
         d0RCD1SgajeVlhhd2QnE5Gx9yqJqTB1uOzVh+rgoM1eIE9H23Q+UhmU3VlPGy8XHlNwj
         5h0SbIE70+NQQmQkFEAQpLyqAze3/gPZfs9nwQnjDi5e79g/oHGWbbbW6NQo8ckWmOaV
         WrRVTpJNkQAX1S9P8WsHa0SWiHHD+WlxrHBv+fWngb8bx6S6dzhe4mBwpxcc4shyeDXk
         IIrSRTeXtDv1OBUDMGjQmfKk/WjIgXUmW/7O88m365oAgS6pN3SleOZAZmfZznpLBGyG
         n1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWT3eF61NYqEzb33Eu3e4TvF/gy//WrKosEMh6brDaTLsPGcV4zayk07jz86iCedDvraZgA2lSISottGytMEoM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pTAkx8luv0LHklLfxpWrp0iPfdrFlszQ0CeS3HdzI/xuJHpD
	6mARmStwXbiI6bHHw1WJpf50KQqu2O3QBU/zfS1nip8FpMIWp82ET2shcJsHXcXOqsY=
X-Gm-Gg: ATEYQzx8AvLmrX/3G05CU1GxUMhG+mAtc3/4vOAJuhpM8F81MnYenYEy1eVNWa/aVMH
	WFmYnPKpQuJAd4xeOA0z8i6mEawy59clyz3NrN0RapQfb1gtc+Btuk7KiWz2TmbGvIs8CoqTzIa
	TAWMJe6oWQieMyjb3ZJ8h97cvm1DGYhry2UhWKxBhuh7nKQp32UT6vHGdC6FuCdPwpmfTL8p8P1
	U3HWJ28J7uFGxLdqdrS7X7Zs1waTMUaMCtoC6WvyaIDdDro9CeMORBiRltasMrkfdzQbbYNHu/w
	buWdtD0OkXl1CUvk+V7tO49PFBAaMkT2sbfW6IrKdjnTjwPeJrJrxMOVRT4Uubx60xzyotjbZM2
	758jlADs5b8LOcrFh6LqoH1IHj9GQp79lsqOopKAOVHk0Y9C5X7NYwqcdoZ3KwRvNS+UxuH+ULY
	2K4Clc
X-Received: by 2002:a05:6a00:124d:b0:827:3914:f130 with SMTP id d2e1a72fcca58-82a198d0c53mr3634373b3a.36.1773424272713;
        Fri, 13 Mar 2026 10:51:12 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725be23sm6290765b3a.15.2026.03.13.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:51:12 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:51:11 -0700
From: Joe Damato <joe@dama.to>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Fan Gong <gongfan1@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] hinic3: Fix spelling mistake "capbility" ->
 "capability"
Message-ID: <abROj00x3K/pauRL@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Colin Ian King <colin.i.king@gmail.com>,
	Fan Gong <gongfan1@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260312235922.3442120-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312235922.3442120-1-colin.i.king@gmail.com>

On Thu, Mar 12, 2026 at 11:59:22PM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Joe Damato <joe@dama.to>
