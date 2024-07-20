Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8210E6
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Jul 2024 03:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721446727; cv=none; b=iQIV8FTRHFuvPla8/BfhrNwDGbCAyYkFRmdkBfhlQr6zmNw4RKMoNbOVriDLtZDLnDRDbpDFAn4DeUOScmBVdu1bZIrsJwjjaV/AQDhR9TiAOWVDkQznZ7HHOgfs4X7Tmq+waWyEFARD+361ifZ1z83kVXFHA0CZEBIo76ihhGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721446727; c=relaxed/simple;
	bh=TLDylYPZsCMZtAc8wiveu/6zwfhNg8BI6WmgBJBWvV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8bT63QzYlE2IM5IsT5slQy1USt8sFwdKVKhwRBoIWqO+RuFWga8MkqB/1l+nVwksjDZ9Ls6UTbeJMfmHI/a03aDZjHlShNWQKisieIMdxV4toY0vdEu+KqHETkoZh+jzqSTNb/TIQyUKNOnMrvh8nnPqIje17nmfa8ES9j9TXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htF0JNO5; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htF0JNO5"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c9cc681ee7so1252835b6e.1
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Jul 2024 20:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721446724; x=1722051524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cClTBAbYXiLYPh2mydOYSPjwCmRcNI1cZVCCE11hSAE=;
        b=htF0JNO5lAjCz2lv2y4hxKqtjREWGm866FNScu4fE0TsRQfGlHZ7kaRORcvmfYEiI7
         Xw0uQ/pK9xfRgQAwzp7gxreo1vQ97uwPEMKXx71OMSbPs+uQk/NxBxciu/5lubDeCcBC
         cAijkUe2UMgkNjXkBPd247BYKEmS6v8igoZm3sULxlUgEmGPSvtgWGZNDfHPoj9VY/k8
         s8rFDUhC9N0ta9mfTiDVmR+Ah39XzqKGLQ0HVPoswXbKPdAelJNxrzXE3xQabFptU05X
         eqYq65x0YnDscBBY4J5Ds4w+WtiXtQVoK8kDWyRO658xl0r4GeA0557X8woLIQBR0qPv
         J4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721446724; x=1722051524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cClTBAbYXiLYPh2mydOYSPjwCmRcNI1cZVCCE11hSAE=;
        b=v/wv5QG1twzgb+JbvtuDYyW7X0mhK/PyP5k1ZcDWu4QLQOmUwamUTJHEZMmtTn4dMv
         o3Gqpoo1UEP9hWzYeMUdhSiWH9XEgPwjyoOEgIllNMItLcTHJcaDXRyd4GC4Mer4CGar
         jPfcxLfSm6gImwQyvZy7+8CNMmUtRhjVg6wzx9LEyHCvJBVDRa1W2ciboPPvmvD0JGGy
         ll2x8Xe0/UdKR0YhUK0+yeCPnhEAPG/xxYPOoFP57gY+sB5/itopXud+N2dUXMmTTUdf
         DoYEkWA0hWPwCGpjh2ZCcg/Y+6/wJ+7X9bgfd7dKIR1c9i/fJi/NNzmNNgFapf+55835
         LUlw==
X-Gm-Message-State: AOJu0YwRPPqcWHSzd7geW2XqwLDq9LnTRv18NZXUbSvqih0Deg5s0nMF
	NUAKp93G3Pc2P4Ba6gpOBSRumH8kX0nptBhFAU2ZvDpVs3ZIua2YGmVBNRHJreU=
X-Google-Smtp-Source: AGHT+IE6FafAaV+XRc2gY9e0msZLx1CjRqvih3LOwBBb502JmarZN/NsbvgDMFwWW0B/06TShmxMDg==
X-Received: by 2002:a05:6808:1b10:b0:3d9:ad9d:620e with SMTP id 5614622812f47-3dad732ebb9mr3814085b6e.0.1721446724498;
        Fri, 19 Jul 2024 20:38:44 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:4528:a9e:1eaf:80c5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610ca4617csm611274fac.39.2024.07.19.20.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 20:38:44 -0700 (PDT)
Date: Fri, 19 Jul 2024 22:38:42 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: kernel-janitors@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Andrew Gospodarek <andrew.gospodarek@broadcom.com>
Subject: Re: [bug report] bnxt_en: Increase the max total outstanding PTP TX
 packets to 4
Message-ID: <1b44dc03-0092-4904-89ad-4e7a78bc2aca@suswa.mountain>
References: <cc01a509-ca3d-488c-b158-2ef16cbda5e2@stanley.mountain>
 <CALs4sv3RY6ANULQK7zX3Rpk7EQrq5Nm5q8PMBkLuFmYa2QW=zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALs4sv3RY6ANULQK7zX3Rpk7EQrq5Nm5q8PMBkLuFmYa2QW=zg@mail.gmail.com>

On Sat, Jul 20, 2024 at 09:01:48AM +0530, Pavan Chebbi wrote:
> >     759
> >     760 tx_free:
> >     761         dev_kfree_skb_any(skb);
> >     762 tx_kick_pending:
> >     763         if (BNXT_TX_PTP_IS_SET(lflags)) {
> >     764                 txr->tx_buf_ring[txr->tx_prod].is_ts_pkt = 0;
> >     765                 atomic64_inc(&bp->ptp_cfg->stats.ts_err);
> >     766                 if (!(bp->fw_cap & BNXT_FW_CAP_TX_TS_CMP))
> >     767                         /* set SKB to err so PTP worker will clean up */
> > --> 768                         ptp->txts_req[txts_prod].tx_skb = ERR_PTR(-EIO);
> >                                 ^^^^^^^^^^^^^
> > The patch adds an unchecked dereference
> 
> If ptp is null at 513, we will never set the lflags with TX_BD_FLAGS_STAMP.
> Hence I think this Smatch error be ignored because under no condition
> we will reach here where we find BNXT_TX_PTP_IS_SET(lflags) = true and
> we don't have a valid ptp (bp->ptp_cfg)
> Thanks
> 

Ah, yes.  Thanks for the review.

regards,
dan carpenter

