Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FDE1EDA11
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990516; cv=none; b=XmwxkFvAtIdI6Zcp+gxQ3V343lIOtlxbI9Jgch8aO0P8VIsFYeunp8D8VPWYODVsCbI07Yo70CTfhnsGfTQxJ+3sS9EkLhuCEXFqO6S3WUO/PWHdOKHLF9FXnAYlYrOYSb6y3Pey3KN1b8tRvdBHXqPzNtt12H1VczLOq5VuRSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990516; c=relaxed/simple;
	bh=17WU/vH9aHCfGSpScMmdp2rp+45c0QI5B8X33drirlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZ6/KJxbQn1Wq1Oit1r15ww3AgOq7SgzE59MZbjmUwuuCBMuFN0ieVDCGc897xNhv74apEEdrGUq1DCMHU4o89szs5rnZuqavd5HJ5SsKClSZvLePgP3/MIfr0wsI8boa5/+NId5Q3M7Syc/rLRU7Qla6rvFERqJtH5oDtGx7Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mSRy+ul+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mSRy+ul+"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e51e3274f1so3192999a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 00:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740990513; x=1741595313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GVS4Gx/rVoQ468as/SRsaUG7WhV9vxUwVHJFy+CZ1g=;
        b=mSRy+ul+qpvSr/yDInfA/iZF1XHAHsoejAB5qBP6mI7zryP1CLNvjWrPXszFRm+AZv
         tSooa1JyE2H06PCzI5pzUUTVtty/ne/ouq1/TVRE0Fr06s/kjukRqrfG9iTJYwUbFK1+
         DCwZlmDCM9pZCJJJ12kkUqm66/CzojVkDhbmKFPZEVbr/g2EchpgTYhxhr+nq1eaaIPC
         2Q34YbCPd9McWcFL378WXhx/0nqY4TG7s1fg+Pffp40bsCdoJzeahr7w8m6ow/FVf8CD
         19EMMeozA7Jw2FnTyO1nRI56AKMuy7FaCQdKcgLRb4i2JbnPzIWGFWy26asgP7UGMd1p
         vrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990513; x=1741595313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GVS4Gx/rVoQ468as/SRsaUG7WhV9vxUwVHJFy+CZ1g=;
        b=BxMpS4OwomzOjckmNjN5MgzIoqBQcRFiCgmc2REIJ4EXjR2aDxLO6DfK2XgKj7XktF
         AP+VZ56P5yY5jUCVFJQTlTYGMHL/S4HT5K+2MkRS3EDI+tzebmmOUwRSe9+0H1hsnewx
         kiEa6fZCMW3BlhAMSCZXGghiSeuLMUJKM2rfc+j+IKr8otHY6QNDH5m+BPmRcYouTq0K
         eJBIVCAysziiRtewGtF3DmX50rfpkzOBCzMch3MvLNNBbvZb8A1jXEehCsWecWGIkcRE
         cYi+l3mMUX16zyK837qFlfMR+QvYCSVqmSdO8suVWrC3/ToT9YMleXa2Y5sNkYq8DdsV
         hIaA==
X-Forwarded-Encrypted: i=1; AJvYcCUzS8o6tVW21mARUsdyhJ94jBvtM/WPYnlGuJNFlRwmep5BaWriTFPBtxgb8do/20FKTtAiXtz41DFDqBfeGWY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx94m8fcHax2giLZbpGQK7Cc0M/MIGcMouDUdCTAL7FxQh3FA5P
	h1PS5XQ0PkQcuiRO26uPJMJPQ8UuJpfRT9c68B+5PVrufpizMc6xKLBmpHVZsYY=
X-Gm-Gg: ASbGnctcd7JHDFkMc049uk0T+9sBEYZfimDSJguyIWHeV97FdPzGUvuV4ewhYYPB/9v
	3TPGX4tRzvRqRKIwFCObbRjySKjNcb5hwiUE89jnito9GUqOWTuO2ERrSiANOfu7e81OxeSvFOW
	Yw1o4/fhhSqvarl1mIzeYyE8mFIXHqlfx0/mCUeLG94Sh4/8VvN3zXvtN+RKPfsPi1HylUvCKpg
	M/ir5TGPWEBMxb87K1RgcmncyhNcYpR4iQ4q3DVl0l5Gkld2p7D7b16ECng3l+rbHGZuMR12ik3
	diczrG4whutxLJ1J8tTiNyiGU/EtHn77ngmWymQSuW63bOcXfQ==
X-Google-Smtp-Source: AGHT+IGw3jWZzmT57/dnLc4o23VsN9vptXaHinStqoaL1K9VwYGdN1PlwZ1rxWVXdJbPl66BSv46Bw==
X-Received: by 2002:a17:906:135b:b0:abf:3fb0:8c01 with SMTP id a640c23a62f3a-abf3fb08ef3mr1023217366b.6.1740990513299;
        Mon, 03 Mar 2025 00:28:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf7a3ea634sm145845666b.174.2025.03.03.00.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:28:32 -0800 (PST)
Date: Mon, 3 Mar 2025 11:28:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Ariel Elior <aelior@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Manish Chopra <manishc@marvell.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Ram Amrani <Ram.Amrani@caviumnetworks.com>,
	Yuval Mintz <Yuval.Mintz@caviumnetworks.com>, cocci@inria.fr,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND] qed: Move a variable assignment behind a null pointer
 check in two functions
Message-ID: <a191bd33-6c59-45c2-9890-265ec182b39a@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <f7967bee-f3f1-54c4-7352-40c39dd7fead@web.de>
 <6958583a-77c0-41ca-8f80-7ff647b385bb@web.de>
 <Z8VKaGm1YqkxK4GM@mev-dev.igk.intel.com>
 <325e67fc-48df-4571-a87e-5660a3d3968f@stanley.mountain>
 <64725552-d915-429d-b8f8-1350c3cc17ae@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64725552-d915-429d-b8f8-1350c3cc17ae@web.de>

On Mon, Mar 03, 2025 at 09:22:58AM +0100, Markus Elfring wrote:
> > The assignment:
> >
> > 	p_rx = &p_ll2_conn->rx_queue;
> >
> > does not dereference "p_ll2_conn".  It just does pointer math.  So the
> > original code works fine.
> 
> Is there a need to clarify affected implementation details any more?
> https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+null+pointers

This is not a NULL dereference.  It's just pointer math.

regards,
dan carpenter

