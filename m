Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2B22D9EDA
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758707803; cv=none; b=ir0N7jXHxYz33bSFIXHBU78THXp30zcfP0oSMSTetnWEZgC7spgK8CCflott68W3RXlxsRfarkoXpQOIIzYW2lK8MOiQ6rNHq3CdIj3jBBmPKawn2CcRRgHbvg3l3rKuwGjjmt1/nAy7uFR9J+kHd/JPKS8w7EqAC7euyrNYKUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758707803; c=relaxed/simple;
	bh=IBAEgyTXCqwNyhGaSkgFoFNYkK8oRthrsdqFIeVuTmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/o3G3sgJ5LYMdKVhiW/TYKSJSpQlerw/8QuDT+y3MoRn8pfgcNoNbR00+fXQ2W7/jzROYxAUjEci9RaolDAoy2Cytj+gII5ju5nOWnO4RPmMTxahQMBjVpgmp498SLI/29vcmAwzdPBHLaJcn+eRW5KwVyNgWhEi8/OtYQHTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AOFfHhty; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOFfHhty"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e2e363118so4338115e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 02:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758707796; x=1759312596; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRSL/1nJSQ5kI07UrUanYwK66jzdWfPHTpIh5wL8rXk=;
        b=AOFfHhtymdaEpoWhLwhHTfshOgWHi7xxDrunar23lXqhIy4rMPklm6GAU98HIyiWba
         j76mmLgrZScAyiS9Q8gNRLJVEwaud5YHSakV5/EzjPxX9/1p7IrreesewMbx5FfGxMzr
         JAyuadmgiYFO2aKcwwyxkI3kf/pNMGZphsLFS+I0EOw3DFf/WzR8TlW2+jOZ96Ewk+Pg
         rR9SEujg/+1+/B7mTrZJVgkcqdmPxHvmHcJCNsVdGd1YVzTeRkpHpO+3AmhT7uR1VBQB
         jWgodtGRfv0PWKjKAIMy38UUmSa1XhejhTk4+qqVVdg3WmCApC/FHrfCmosDogawPPRu
         dqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707796; x=1759312596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRSL/1nJSQ5kI07UrUanYwK66jzdWfPHTpIh5wL8rXk=;
        b=cgIOyafws/T+2vnNO1kim5Tz9NnylgcI+b3qX7vjV+gkjC/bj+LRxeZpdZfbxiD0So
         JxjkslhVDF2+RgnVKKkTKnAoS2JwZ/2Qqgyl7STKXq93leG6uBMCS5yLOd+b64g6+RqF
         X85J1PFwFCt73+f5tAMXwRanlqpYFCYG5uPgivLoIHKKfGdBkr6waL/QUb6uDQjQExap
         2M7tFT+gQOxmaF/OUG/PBSm3PVdhI2Cf1g+Fqi1PHUVqomGSbqysj6+tP5Ql6rqvi7bP
         ZpN524AaBKhRI+gCWPwj6XblRdT+q2sNPmlMVHI+oIuQrD3MgvAmu+T5n2kz1PhoEahn
         maIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf5MGQ/+6CB/0NdF2QZ2059uQcYwi0Q2Cup8UBztYjwdVkD0HYknFugqnIB1tjKufSxZmyawDEwIVf+BM1dZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMIr4FieJz0JM4ZFjcB0Av0/u0B7/EVhQl/sKvmyofEcb+nXwU
	38bv0gYxX7aeDNFX2zCN5ju8IYuDKq1AI4T5lRolfFN/Gs7W8QnQAm+fL6JPytOkAoA=
X-Gm-Gg: ASbGncu+kTLEaawtBk36KRaYzxCt30ihG42708DUKBvDtn9L5VkyNsykiqPrjCTuZj0
	0xG/yzlORa+v61cL9ipWvMb8clWLhQI8Pp86d3QIiOCtDYXkTK+Cbd3MnsgTFzWI4lDGt+6Sh9s
	CsqkBNCmsQl6++w1H5ztfwFqKo5AK921wPVU7miY7wj/Zd4mcs7s98CBaKStzLVxr/Ipq+3JFpK
	+5lY6+dShte5mdIawVxvggGq/d5PvCJ/2gIh/LdYp3xtlpaJMgT3VRJxo9R84WGW5Qw7Z+XYiC+
	Ao9txSCH143zIa9GflQOjbcFhmgpCYn5BYRRXwwzPz4WWLO/jUYZYZ3Y3qj0ojYNjlaBRlghojw
	x9asgKxstUCgk+N0HJe5YEvXZkr8GcJBpXvaxYJI=
X-Google-Smtp-Source: AGHT+IEV83QRdmbsMqgiTy+g6mdP+Mx8Vek5R5nQm/u5KqDUFtolGSlsI9sVken95Qe9w/ozF+U6xg==
X-Received: by 2002:a05:600c:3b11:b0:46d:1046:d356 with SMTP id 5b1f17b1804b1-46e1dac2e1cmr45790995e9.27.1758707795692;
        Wed, 24 Sep 2025 02:56:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3f70b47ca57sm16940084f8f.0.2025.09.24.02.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:56:35 -0700 (PDT)
Date: Wed, 24 Sep 2025 12:56:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
Message-ID: <aNPAT_uf-JFvBvkV@stanley.mountain>
References: <aMvV4kK386Sni10i@stanley.mountain>
 <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
 <bb776102-310b-4a84-943a-86d4138592d8@oss.qualcomm.com>
 <aNOfXlG21HIBR18E@stanley.mountain>
 <CAHUa44G2yaB28sd0FjkjyCNJKXjx2Jg9j-9HXytyvsmiQ3ThAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44G2yaB28sd0FjkjyCNJKXjx2Jg9j-9HXytyvsmiQ3ThAA@mail.gmail.com>

On Wed, Sep 24, 2025 at 11:21:34AM +0200, Jens Wiklander wrote:
> On Wed, Sep 24, 2025 at 9:36 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Wed, Sep 24, 2025 at 08:58:45AM +1000, Amirreza Zarrabi wrote:
> > >
> > >
> > > On 9/24/2025 8:48 AM, Amirreza Zarrabi wrote:
> > > > On 9/18/2025 7:50 PM, Dan Carpenter wrote:
> > > >> Re-order these checks to check if "i" is a valid array index before using
> > > >> it.  This prevents a potential off by one read access.
> > > >>
> > > >> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> > > >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > >> ---
> > > >>  drivers/tee/qcomtee/call.c | 2 +-
> > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > > >> index cc17a48d0ab7..ac134452cc9c 100644
> > > >> --- a/drivers/tee/qcomtee/call.c
> > > >> +++ b/drivers/tee/qcomtee/call.c
> > > >> @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
> > > >>    }
> > > >>
> > > >>    /* Release any IO and OO objects not processed. */
> > > >> -  for (; u[i].type && i < num_params; i++) {
> > > >> +  for (; i < num_params && u[i].type; i++) {
> > > >>            if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
> > > >>                u[i].type == QCOMTEE_ARG_TYPE_IO)
> > > >>                    qcomtee_object_put(u[i].o);
> > > >
> > > > This is not required, considering the sequence of clean up, this
> > > > would never happen. `i` at least have been accessed once in the
> > > > switch above.
> > > >
> > > > Regards,
> > > > Amir
> > > >
> > > >
> > >
> > > Also, size of u is always num_params + 1 for the ending 0.
> > > (basically means `i < num_params` can be removed).
> > >
> >
> > Yes.  This is true.
> 
> So this patch isn't needed. I'll drop it if no one objects.

The patch makes the code better though...  It never really makes sense
to use a variable first and then check if it's valid later.  In this
case the check isn't required.

Ideally the code would only have one limit.  We could either do:

	for (; i < num_params; i++) {
Or:
	for (; u[i].type != QCOMTEE_ARG_TYPE_INV; i++) {

Either way works...

regards,
dan carpenter

