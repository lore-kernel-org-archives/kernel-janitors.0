Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F41DB375
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Feb 2025 05:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739424090; cv=none; b=MnxhUXNlfRcQzZdlMX0RRKt6F+KEI0LcpL2VQU0SFrcUZ4DBpSlndPpLa8bekUTeQHsysmYp0eiWCVz9JYUzgcSTKnhNdNyv2KwYatEEKDa3BbCSh74D5rHiRldvIEclDqn3SBUOBbNxHv4eDfOore/ahd1O3hsHvkZC52e/22s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739424090; c=relaxed/simple;
	bh=/hYQIFN5eLsEw5ZfLn9JjnNAr5fEBGpJclbHobhz3lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0SAnS3mylOPzCRtZ3O1vmIEPZ6RTwA/vAPFM/WwWfi1YGulJXsRm3yDSltvQKywyu15QNU8Oi91WJcPDRMbrf2ChGvpaWDevT0dTWDmxffKR1adPro9+Ojn8LPE50WEaD8ldpd97JK5gPwJsTY/Y6aRf6ZmREsSfbCfUwaudgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=elJJ/cjX; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="elJJ/cjX"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5deb0ea1129so642369a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 21:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739424087; x=1740028887; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=va3y7gaOp0Y0VVUn/Hp+/Cra/1Ee6/x5n3PcEqf4xos=;
        b=elJJ/cjX6mjaLHai5BjUv/rRdfKGiutFiWmvn7dhnYuqItegLFqm83YR1jd7guwv3K
         Tmldjo5Rv5Sd89qf5bFOmafA/LE+eC5GOGCcQntMakRBPtWTCVFRYE2TY75XWrb23GXy
         KP8q22baKN7BmTQA2RlvjP/S6gddfNEhgBa7O452nXIv/rJKLyOVMK6lg3CCIOWoUIi3
         WQnLogajR+NLVK9U96T+YQp3moaZkAECBByKBJer42//oUafgLbwYXD19fMnWVyhwXI7
         u+o2FQ+N76me7gC7yxBbGXRwai4qxYNPXm52rwKLc9/e0+LU2jYedteUnUlZxtI7PFkS
         muAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739424087; x=1740028887;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=va3y7gaOp0Y0VVUn/Hp+/Cra/1Ee6/x5n3PcEqf4xos=;
        b=nAytsnquNDw4fVKQIzXBWY0kvVZJFJGQ11i0sPikL5nvZegHfltcUPtXJA3ow+Dws7
         nKplL9jKeSt0ArOPxqKlJvQKgG1pzuoJBgJZ+o/98E43x2b4R2VU1/E+ehCRp/EI8Nnj
         UkUUMS8k5KpkkxdrsdlFKfs4zjhlpdts+5RkX+CVFvxNVjbN/fpfmRTekUiu3q/ap+Am
         7wwbkJyaqlAEuiyu3xjq1U4+7n5dM0U0xAJa2mxBa+6q6kF8DGSeOe/9FjUXlq2HVtyR
         fIqsH2jTFGMLD2qyGfdl1w2G2ASu2AWRRWbbA+tmM00ZAZhLrQVr3b3e68E4REB0NwMf
         F9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/irRFzPC4vtLOZtl+Fhika0fK3Md0UB9EppsjJQyysxo/ZGSKzcN5S9CINSrEk8eTcd5DT6U277SUWNyurFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVbpR1ZqNH41n7/2aw/M/9jIJZwG79i1Lcrhbt3GsTRaw2JCd
	2o2h0TQ3xlJ/9szW3jYuOTjMbicSV5OxhGFeEiYizKytzMQxJ0H9cqNFvj6o5KQ=
X-Gm-Gg: ASbGncv9/+tRk36NddlxxHpBcGHUZy9uY/OR5fJJQp6hcexWn6EHsXGX0uWkqk6mh/N
	+tdAW+tDnntXJb0zP3klR65enFKh/Ux/nmFgPq/ZpkXTBz3P8JFX9n/8N6cK/tCvIYZ8RRBidUY
	VtmYFJLZgVdCQ2zR631xX2fTAUkeSvFQRcdg6cIAEJyq7ou6viGDwXU8yiokuhgVWVizlnnSHR/
	YwF5pFgNGbUaNfb2yxXvNngSUgQDgfHmpPm2GbYeWRdoTHF/cwKhVoC90NZP9T9nTF9INGtzA0J
	VoGNQKN09oucHB1lrjkK
X-Google-Smtp-Source: AGHT+IF++tzvA4ozNyZQfnVkn1og7OUT+54+YHB7mg9npVmHLsgg4X/HxYxaQJ/l0a+CyHudxXqOAA==
X-Received: by 2002:a17:907:97c5:b0:ab7:d4b0:9254 with SMTP id a640c23a62f3a-ab7f33f5f77mr528766466b.26.1739424086964;
        Wed, 12 Feb 2025 21:21:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba53376713sm53891166b.108.2025.02.12.21.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 21:21:26 -0800 (PST)
Date: Thu, 13 Feb 2025 08:21:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] Bluetooth: L2CAP: Fix NULL dereference in
 l2cap_recv_acldata()
Message-ID: <189055ae-a400-46b3-b265-a93a23f0d715@stanley.mountain>
References: <f9975604-6a65-4bcc-b532-15fcaa6da0e5@stanley.mountain>
 <CABBYNZK-ibR-+ri_+FFiorLkEvT_1tD2YKSOeSuTsyoS4dM1CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABBYNZK-ibR-+ri_+FFiorLkEvT_1tD2YKSOeSuTsyoS4dM1CA@mail.gmail.com>

On Wed, Feb 12, 2025 at 05:23:42PM -0500, Luiz Augusto von Dentz wrote:
> Hi Dan,
> 
> On Wed, Feb 12, 2025 at 11:40 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The "conn" pointer is NULL so this "goto drop;" will lead to a NULL
> > dereference when we call mutex_unlock(&conn->lock). Free the skb and
> > return directly instead.
> >
> > Fixes: dd6367916d2d ("Bluetooth: L2CAP: Fix corrupted list in hci_chan_del")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  net/bluetooth/l2cap_core.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> > index 6cdc1dc3a7f9..fec11e576f31 100644
> > --- a/net/bluetooth/l2cap_core.c
> > +++ b/net/bluetooth/l2cap_core.c
> > @@ -7456,8 +7456,10 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
> >
> >         hci_dev_unlock(hcon->hdev);
> >
> > -       if (!conn)
> > -               goto drop;
> > +       if (!conn) {
> > +               kfree_skb(skb);
> > +               return;
> > +       }
> >
> >         BT_DBG("conn %p len %u flags 0x%x", conn, skb->len, flags);
> >
> > --
> > 2.47.2
> 
> I went ahead and fixed this in place since it has not been sent to net
> yet, I did add your Signed-off-by though.

Thanks.

regards,
dan carpenter

