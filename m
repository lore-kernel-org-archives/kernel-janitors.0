Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8F1481AF
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Jan 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737729332; cv=none; b=ofaSTCZLKoclZZ1VFPfN09/mGf3zDHukDSI2l6Bwweogi/qiXMtIKbEnXN+ZItNHn8nRQUGUivTjTazxDBIB2Xb2JgzC4KuCG+zpSwhC7d921Ops/LHG5rL11RiMph4zmGG6J76jSyNlRVJl7Qe5lRRjirQcLcH0ijGW5O4Zb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737729332; c=relaxed/simple;
	bh=tqw4o/GKPnNWOqSfm3i27RdtSC64h3bApxEjgi6XcSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDOtlwKKhMaYRAGRGxb9lpYqsDqt5Qhyld7TTe3cVzvZ7J+5P05X1QOijmu5ngAjfAdqBs81PQB+yo5rXu+0ldF7DZtK4b9UmgPa1xaeeLzC2Ssr8W3hm9yzKCo9Lp8wSvfnAd21lolVMdD7zr7DQMvPv2aTFvjv0phD1iVDumE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hyg2MW6r; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hyg2MW6r"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43675b1155bso24101905e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Jan 2025 06:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737729329; x=1738334129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+Qt0Zoq5UL6Qxp/U1x4G4wPdwvA0OwIDNPcXZmcPws=;
        b=Hyg2MW6r347ZppOcntFO4BlYEkJgnD3M5tzCz0YKEAjmA62CXtgxFpMgq+X/tqbN8W
         hui/BuRvI4bCnESYzfRHvlrz1WXSm2UNljbd+YDqmoILdiUM2tD0JvrZOjImaj6qv7Ig
         MCoLiC6Nlv3z99kWOXDCJG2pMKP6D7MGKXRg8dciMCjYUo2DO4K364/ssknyXPMwtNyt
         xm4Gu+m4k15Ej5INKP42Ap5FdP63A0ZGlHRAA4xZUK2CucuXOtHAYAMYarGmCauu2kJ1
         NZ5Nk/OIZtJn4oEmOMMbg4GpoaVMP4ItqGHLnIP/27rd5SLUejFQjYnmcqo6OC8oQ9Ms
         oqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737729329; x=1738334129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+Qt0Zoq5UL6Qxp/U1x4G4wPdwvA0OwIDNPcXZmcPws=;
        b=LTiHdCM0Y8E499LbFASjkhNMgM1U5KNVFwr+oF0jwtLqqVrnMPjv35WtyK0CBXGhd3
         AAhe+lYvqL4cwX1WYyZvGocfn/k5ICDqCBVOkPXISaD1FiyOyT7Bm3/QWwjUycfl0Odp
         0Q/41+HCN0H3QDrhYzdou2t6q92twdjeLRMdJzKGI5T94wEX7fLXcBsgKRCbELajWip1
         P3D7ZOc3EYSLQ0ob66dUuD9K07A40JSEgfo3s/xGWZDVyzySyuGEP+MVNVXA0zFgwu0G
         rqTLWkZ9U9Fz4Ggpmztae8hUlBAWrIyxlpJA3AvAOodkVEJ8Okyc08dmFrj9DTbQGvlp
         6y9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFXOZFTMKwiE2Io1glO1nAb3oaRJ7ROgd2MiEdEbuSVbbdyoBzXjmKupGPUf63i0S1e7lJwcLOjWCTaNx9I7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWL1Scsj6/sVYCO7zskWifTlApaHhs1iYqHHtBjIqom13Eefgh
	c7T+7ma992d4qpmo01NNW5sY29NYChG7pNvVDdTh50jVb7jR0kaO11q1EYHK/ek=
X-Gm-Gg: ASbGnct5ZVFO/IOz0PbDd/txa9XzJVnt2cAvT688fvFkjUnpSM4RX6exOWCkAt/uDpU
	wXN1RnxJDDHiyAo2oReRLWECyTe8VCcUsaleycjaDrk8bdDDuZHVHX49FccMsgqIjpRQ63q3Sg8
	ywl8NGWEWJgESXX8qfMwBNPEmxpdCtiTRiJo56ZzocAxniBR8rF+uyHLlO1w/6PWCnfUoRS+oys
	8a7wIDO5BsZxEOElfNMolsPE60wYEQ0I/8hDoTz9Rvy8T9LXKOBV0W8hv1uQP9JFcsmp/Cx498v
	5ZiaqjtYag==
X-Google-Smtp-Source: AGHT+IE7bMiyF9uAQFEhqau5Ih7ib6+HwTAas1ruEAGeXxqf310qPqqB9zQqihGd3kSjbGxBaW0kew==
X-Received: by 2002:a05:600c:6b18:b0:438:a1f4:3e9d with SMTP id 5b1f17b1804b1-438a1f43efdmr202842085e9.9.1737729328670;
        Fri, 24 Jan 2025 06:35:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd54bfa5sm27898335e9.25.2025.01.24.06.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 06:35:28 -0800 (PST)
Date: Fri, 24 Jan 2025 17:35:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thomas Graf <tgraf@suug.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: netlink: prevent potential integer overflow in
 nlmsg_new()
Message-ID: <04dbe1d5-51e8-42d5-a77d-59db4bc13957@stanley.mountain>
References: <58023f9e-555e-48db-9822-283c2c1f6d0e@stanley.mountain>
 <20250122062427.2776d926@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122062427.2776d926@kernel.org>

On Wed, Jan 22, 2025 at 06:24:27AM -0800, Jakub Kicinski wrote:
> On Wed, 22 Jan 2025 16:49:17 +0300 Dan Carpenter wrote:
> > The "payload" variable is type size_t, however the nlmsg_total_size()
> > function will a few bytes to it and then truncate the result to type
> > int.  That means that if "payload" is more than UINT_MAX the alloc_skb()
> > function might allocate a buffer which is smaller than intended.
> 
> Is there a bug, or is this theoretical?

The rule here is that if we pass something very close to UINT_MAX to
nlmsg_new() the it leads to an integer overflow.  I'm not a networking
expert.  The caller that concerned me was:

*** 1 ***

net/netfilter/ipset/ip_set_core.c
  1762                  /* Error in restore/batch mode: send back lineno */
  1763                  struct nlmsghdr *rep, *nlh = nlmsg_hdr(skb);
  1764                  struct sk_buff *skb2;
  1765                  struct nlmsgerr *errmsg;
  1766                  size_t payload = min(SIZE_MAX,
  1767                                       sizeof(*errmsg) + nlmsg_len(nlh));

I don't know the limits of limits of nlmsg_len() here.

The min(SIZE_MAX is what scared me.  That was added to silence a Smatch
warning.  :P  It should be fixed or removed.

  1768                  int min_len = nlmsg_total_size(sizeof(struct nfgenmsg));
  1769                  struct nlattr *cda[IPSET_ATTR_CMD_MAX + 1];
  1770                  struct nlattr *cmdattr;
  1771                  u32 *errline;
  1772  
  1773                  skb2 = nlmsg_new(payload, GFP_KERNEL);
  1774                  if (!skb2)
  1775                          return -ENOMEM;

*** 2 ***
There is similar code in netlink_ack() where the payload comes from
nlmsg_len(nlh).

*** 3 ***

There is a potential issue in queue_userspace_packet() when we call:

	len = upcall_msg_size(upcall_info, hlen - cutlen, ...
                                           ^^^^^^^^^^^^^
	user_skb = genlmsg_new(len, GFP_ATOMIC);

It's possible that hlen is less than cutlen.  (That's a separate bug,
I'll send a fix for it).

regards,
dan carpenter
