Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E040122DC44
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736851512; cv=none; b=sHmZyTv5ytezFdJyad2fHzpR3U8vJUo4E1Jw9RTJYlsRVR8sM4BH7RlOOYSV27Blp89KIwzsnba3YPIZWvw/eSZ3cfdmLF1tOVGyogw4PP9XLYHPwmTITbKCHBEUVzrBTRjcM/S/xaICVFno9qwEEunGB7mrTpLHPD2pKbHbYaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736851512; c=relaxed/simple;
	bh=JX8BU/UHAINQ03gKNeZE3v64RzFXpUq4unVLUxoDGSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZAgbywiDc/qVBFGW3cbV84PSiqef2RhgQl3FRhXv9DAa9HbK5UJCebas0/cotICqkeY99L0IhlFM6z4ZeuknWqC6lMuMXbC1SKQuNgv5jcBxP8REib5/J/Xka3nt3mRZvMxSetfOgO7EABFZaSom5I5RnIEPSTXFHc0y/nny2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qbk8/KL4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qbk8/KL4"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso9630616a12.2
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 02:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736851508; x=1737456308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=91oZE8SNrLdkhlSes3IetGvw7SmPXpAR69UBGkhXJZ4=;
        b=Qbk8/KL4SRg/al+lS8lv/WM6SU67elePOE1J+eRi99X1XUPzQHpR75rgG3KSUc9CW1
         hjurkNxuI0gEfFi8muQezyISPXdWLtN29/O5qpiREpNIn3aIN2vcVNzzi264iy0ZkBsB
         Q4SdW70yk27qmFit/zZf3nwwCEwK0gLdxxdR1ki8HgE2L1IpqlbptkljtvCkrXXTnKG2
         zAi9JdNIMWoDG36t/ZKU7q/KvhugeQSjK4iyNj5niEijPRoI0keC2uAPHkUHwNCpJzza
         Rp1hU8ayY8lLZS3bLoljLszd4TwU+xnYD89bkbatjTGTvOtI1NThlGPGa0Bn6yY6j6kY
         QVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851508; x=1737456308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91oZE8SNrLdkhlSes3IetGvw7SmPXpAR69UBGkhXJZ4=;
        b=kylStNAXFAivxcYK6rCx9YFdQoOCTX2qX+ovYkRHufLz7g988p3oEqCh7W8x/CTHFE
         Rh5zJsqX8qlHAV5BglYKXBSS9MnBMOl/LOrTaB9m/MbCP1vhLt9advX95HcLJsqmJH1z
         RhrugzeQ7A0gkWPh6J//OTk4KOsY9YblHuLopEru30/ZK/4VzFv8eC3B2eedbwwCeDLm
         eRaekRKFHSdW4Lz3b84wxc+CETh1o4FqkEkLB8oi8Z9ux8AbNkjBtzag0qLVwlFDGNIC
         zoaydzV9vAU58nTrrObX3a6nyVKIKgkvOOBC6k8dCxQe+TOpXJEdcG4bRYnDXeWNyN8s
         4aiA==
X-Forwarded-Encrypted: i=1; AJvYcCU8s55IPL0esz4N5+rrqQVKwaiKutibJP9ihn7s0mbx2BZtlrb1JJlyhIxDcAHDhCyNtqA4damCE5To3hm1a7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDhcvzoy/mDYNe78EzyyioQ89omV/ClsF0fWj5SHiBSZ9rc3GW
	b4NaIC4GFpJl+eakS75lJF0DSFTG/y6kAZHdRrnGoreNM5Uhaoue4bK30m/a6rI=
X-Gm-Gg: ASbGncveuXDdeY1sOeBE4M2gbWA+J1boK1rISo9tn2wi1d7jE40HqBDTafjkm2uMicF
	rxrJaeVaozwivw+TEvsEOZFRTHSXPvXbvL/BriXjLdqW0kqf/rxPrIBrkGAHCOeqSR1vMDBB7pW
	X0fXkVRQ6hVxEt2NJbuxBVUg5qWQkycchOPhiHiUE1Z5E1uKsMbpswMKHLfbA+qPddUgm1yew29
	zhdkD5WFtVRWNd3bhMeBHugZGYDy1alqdVbMWMxNHYKOUykqYAZllBi7u0gNQ==
X-Google-Smtp-Source: AGHT+IEo3aHs2albkGeyR9BcAkeDWYBoYCWdzhqgjZb2f0VdDSTMfOOHcn07QDxniXBFjvVorqej7g==
X-Received: by 2002:a05:6402:320b:b0:5d0:cfdd:2ac1 with SMTP id 4fb4d7f45d1cf-5d972dfcbcfmr24768732a12.6.1736851508062;
        Tue, 14 Jan 2025 02:45:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a4d49sm5812922a12.78.2025.01.14.02.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:45:07 -0800 (PST)
Date: Tue, 14 Jan 2025 13:45:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Louis Peens <louis.peens@corigine.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Quentin Monnet <qmo@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] nfp: bpf: prevent integer overflow in
 nfp_bpf_event_output()
Message-ID: <Z4ZAMCRQW8iiYXAb@stanley.mountain>
References: <6074805b-e78d-4b8a-bf05-e929b5377c28@stanley.mountain>
 <1ba87a40-5851-4877-a539-e065c3a8a433@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ba87a40-5851-4877-a539-e065c3a8a433@intel.com>

[ I tried to send this email yesterday but apparently gmail blocked
  it for security reasons?  So weird. - dan ]

On Mon, Jan 13, 2025 at 01:32:11PM +0100, Alexander Lobakin wrote:
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Date: Mon, 13 Jan 2025 09:18:39 +0300
> 
> > The "sizeof(struct cmsg_bpf_event) + pkt_size + data_size" math could
> > potentially have an integer wrapping bug on 32bit systems.  Check for
> 
> Not in practice I suppose? Do we need to fix "never" bugs?
> 

No, this is from static analysis.  We don't need to fix never bugs.

This is called from nfp_bpf_ctrl_msg_rx() and nfp_bpf_ctrl_msg_rx_raw()
and I assumed that since pkt_size and data_size come from skb->data on
the rx path then they couldn't be trusted.

Where is the bounds checking?

regards,
dan carpenter

