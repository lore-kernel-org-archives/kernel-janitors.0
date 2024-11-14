Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E67329CFB
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574911; cv=none; b=Md2moZcDOVZ4aHFj1ceiIZdtnGZMhEKhkYS2FC6VseLHeiMkC5XYZ/L8yuDaQ1ElHtKo86vJXztYc9uT9XMBljQfxoJLojEv9seyriI+XX3kpsuru6/SD3s9QpOit7TdAUI1Ws4aJsgrIBOKyPlXhMx6h+oitYHQ30XOkgGsHmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574911; c=relaxed/simple;
	bh=T23aK4kK/C7dpLAMu+Q5zpcRbeqquxUX93S7n31g8ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpmTcsR1/Haj+gvg4w9FXV3v9J5R0lTl671CfQrxKZZJV4sFEps3wrQIMVuef4zFxC+z6c/Gn91PqLXOvUau+vjTe2G+6iwoxc1r8AyrNOKReX7P/wuH3l955X+PcM9Hzl5dJwBXO+K9BmTkjLHGlBmQOB2HC9kw1mLX/JGClV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b+kBQhft; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b+kBQhft"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so238767a12.3
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 01:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731574909; x=1732179709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8XEUri7CoZTq5vq/DzmBb1WzLljf7ctCSh1CJnt7ts=;
        b=b+kBQhftYmsxFXZm1amTCaUYdKx4UBAq4dk6v3YnoUbcLk3+qwyhOFo4MZyTRjCHOC
         DbFSJfft4aWvh2XjEBUDuY2zezZX3w7+3eRQRCTcI0s1jcd4I9JCGxC0CxcIPU5YNlYm
         mGD9bemwdUtY/38XQiPWDSF4XUnczz4GAp8cKnhn5sfd6BZGC5hz2yQ6iWmY6zFN3bV0
         I7+OEvcR3fSDPjEyHvePiMrB8lAr/9QuLUiKZKIpikckvIAl+yMFWiuurY+YcTpVFGFu
         hfClWyL0kbJ4xpD+VQ2bJ+12T62gT2PeSHOBIqqsxleJUF00ArboeX5Y4kDw317PP+NU
         XoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574909; x=1732179709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8XEUri7CoZTq5vq/DzmBb1WzLljf7ctCSh1CJnt7ts=;
        b=fVNokIH1Ao4pWGNce/16qNVKl7BZKEm0PO7Qd9A8nFSfeESxtmrrRhH+H/6FITsTv9
         e6mLX1MjHrTOAAqFohNgDA40kXChHJBYdeab2g4QCuah0SxWrHWmgxKUL/XGytTRO23c
         Ajy5d+iWp+0fnRfJI4smnoE6/jtAEAd32fzMWcYPe8nosgl8R83eTS15XvWRsIwpDYmI
         DntwmZlTnWhzZLY5DJr6xQaljCZH1SY3QCgUrG67ieM2NjLGtvxw/xIEE6ut5qW7z8TS
         SStjGy03EBgrOEf0i4+qAmGGpc1lwRcXwws8+0vXhJAOt5Qc5yZggxc/Q4c/LrhgCciy
         SqWw==
X-Forwarded-Encrypted: i=1; AJvYcCVvhCNm6HSGqdZtfCLVAsphocedWBR3RXrcApIrBod1pRkaoCE1BlR88DHqC0izomblEZ3iLppmlLpz7yj5aOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxGIa+F6lWj6j/U0IAmy/HBlVDHmGzDvmI/q3b3T8VOG0Be+FO
	GNGJCxWMNwMNtPts87NC2snnVDopLBN28G6KIRNlqyo+tTIhSaFquKo1g6gnsDM=
X-Google-Smtp-Source: AGHT+IF9ICqS2lyMmRBik5cNw7m35MJ5Mn9ZVdXEESxz2vH6U+lU1+8C4M51kQ1zPlNSPGNFGx7RWw==
X-Received: by 2002:a05:6a20:e347:b0:1db:f00e:2dfe with SMTP id adf61e73a8af0-1dc8348c820mr1817985637.39.1731574908948;
        Thu, 14 Nov 2024 01:01:48 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b36da8basm635461a12.3.2024.11.14.01.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 01:01:48 -0800 (PST)
Date: Thu, 14 Nov 2024 14:31:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mailbox: arm_mhuv2: clean up loop in get_irq_chan_comb()
Message-ID: <20241114090146.u2cyg6fmykw57mei@vireshk-i7>
References: <40fd7f80-26d6-4cfc-8bc5-f8572eae94d4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40fd7f80-26d6-4cfc-8bc5-f8572eae94d4@stanley.mountain>

On 14-11-24, 12:00, Dan Carpenter wrote:
> Both the inner and outer loops in this code use the "i" iterator.
> The inner loop should really use a different iterator.
> 
> It doesn't affect things in practice because the data comes from the
> device tree.  The "protocol" and "windows" variables are going to be
> zero.  That means we're always going to hit the "return &chans[channel];"
> statement and we're not going to want to iterate through the outer
> loop again.
> 
> Still it's worth fixing this for future use cases.
> 
> Fixes: 5a6338cce9f4 ("mailbox: arm_mhuv2: Add driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/mailbox/arm_mhuv2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
> index 0ec21dcdbde7..cff7c343ee08 100644
> --- a/drivers/mailbox/arm_mhuv2.c
> +++ b/drivers/mailbox/arm_mhuv2.c
> @@ -500,7 +500,7 @@ static const struct mhuv2_protocol_ops mhuv2_data_transfer_ops = {
>  static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 __iomem *reg)
>  {
>  	struct mbox_chan *chans = mhu->mbox.chans;
> -	int channel = 0, i, offset = 0, windows, protocol, ch_wn;
> +	int channel = 0, i, j, offset = 0, windows, protocol, ch_wn;
>  	u32 stat;
>  
>  	for (i = 0; i < MHUV2_CMB_INT_ST_REG_CNT; i++) {
> @@ -510,9 +510,9 @@ static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 __iomem *reg)
>  
>  		ch_wn = i * MHUV2_STAT_BITS + __builtin_ctz(stat);
>  
> -		for (i = 0; i < mhu->length; i += 2) {
> -			protocol = mhu->protocols[i];
> -			windows = mhu->protocols[i + 1];
> +		for (j = 0; j < mhu->length; j += 2) {
> +			protocol = mhu->protocols[j];
> +			windows = mhu->protocols[j + 1];
>  
>  			if (ch_wn >= offset + windows) {
>  				if (protocol == DOORBELL)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
