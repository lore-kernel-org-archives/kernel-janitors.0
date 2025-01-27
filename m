Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB48B14B06C
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Jan 2025 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737965340; cv=none; b=WnTKZTllD0k2DDCnJfAt3Gi9faC7jPNLazhq98x5kzMmM8B+5fo9W5/3ua/O/MnhhGs5uFi4ToSaRd5qX3SVlXGDit0Dpcjrm/6jzN/UUt5KCNk92jyC1Q/wn/7+gAELbBttgFowpv6K6CydHrXIDfhxtOTFMRh2RXd+ehyyJnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737965340; c=relaxed/simple;
	bh=NutEGv7ydMEgZ7DYV/Wtfx9HWAPrAkHT94s5gX1eTcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTc69Ltu/ySoOOGdPmjdExxTx1wWfMdMsdMVlxJ3u4R4Qmw1q9ztjro7myJQDFvRLZVS8G2Hu3RPzVclI5wYDGY8hdLgETHkES/4fz37AcpmgAtjMKj2y+MEFUTyhwPQFY+DblcZDeIv6kiFxo/feapgrE65M80MAlkzr48wgF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7W64YOr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7W64YOr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso25640975e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jan 2025 00:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737965335; x=1738570135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWYiXgsLvVV1e1orODSh2w746KPmUGTOQuQSDmIPR+U=;
        b=a7W64YOrp37Lx1t++aEdYtqbEJrySdcUT4ZFS68xVzYS+0POnTw/PAdZxKg4wLBLFC
         58Ndwkv/qTr1e0z5BNmiXkpAxI11Vc4Hdiimy8WrPthUN5ReVmukA9In0Qz0y4Ez1sn5
         kuLj61sAZvPBICDithkoDFd66QSdmXHxgwvfXepU6lwm4Z405tO/Ttrx0freg04r7RlZ
         ksR5XSznbU58z7gULBbhiXDRUB3NawS+q/twL0UehPhIO6q4A9yiIR6pcYvIL4zD8mMp
         /ZftoJmolwHLbK9Wtl+OVDXNkIadiw6pdenUlj7uL3HRQdUoZRUJrygHX2wmQ3ZuiqJF
         iuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737965335; x=1738570135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWYiXgsLvVV1e1orODSh2w746KPmUGTOQuQSDmIPR+U=;
        b=uHScaFYTm/5oMZ01X+sRQj2ELyB2xnVprxPlVKyDW9USTTiuXumaXdVOp1mwVSoudF
         INnCCj/8PzZgN2a9QDBx+sxDIunYHTyADS94qUZcAhYV1VrV3UDNu0mr9VP4XSvl8t37
         Uk26mFgmSyTC6V148sEIoURQYwGQne907Eclb2fi9yftjETnaQm+CnpbzH7GrEzYxEjJ
         FQtqIesb3uUP4UIBEuOakEAFVXJAlsRGAX1rJXriI6TjVDId4AIvuD3K5yQhlJrrAXHe
         ex6PEANuEZ7+lWckDZoRZ55X6M0H7AtJMyDzEYNBhDxCP2BVcNru/S0YFPyYWQvLEFe+
         vokw==
X-Forwarded-Encrypted: i=1; AJvYcCX2/w9CNvHBd9RkywP8qwKOWGowAlQBISpqQiknSok9J9liP+OdJz4xYZ348gIfzDx0N91FZzMH0YJQjzyAaaI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5mEZfG+zSsgAK/j59KJYfgUJiWrrYRTPLQ//B5b0O2yEHB5eD
	fzTayRdTrmXajMkgRq5Jr7wkOZeHZKlfKxhckFc5oB3RVcFSWn0q90R6Y+pACEE=
X-Gm-Gg: ASbGncvUo1gOpKZmWz1kXU+hMj6JJKCBKhHxW9fKwWGLs35wPtcXVQGyR0AKnCFxhrF
	pPkJ9eumbjRHuaNPIR73DCw9NsTAtIetuM4fV9UptLWcQ/3I3CtmmY5aL8wK0kEE3RsfpoP30bK
	19cIm6Tr3YngK8CpAzGDoKLfkMK60A6j4GdIRA+A3SeBUSNOe7ywGVapct0aGBpjTNgKJuaHBPD
	C5HF1wmS3Ue46OCzdlxSzvJabTFIeWHeNdEwPa7/y01TYpUO837kG9JCUsWtolbP7zj363/bDrF
	Hwoe3rseaA==
X-Google-Smtp-Source: AGHT+IFa1hKFQp3e/RknXB0728kIXUNC0R5l3qxtA53+nqYfrSq+qB0VtOMbJK3E0jCXfUAKaJNAnA==
X-Received: by 2002:a05:600c:3b87:b0:436:2155:be54 with SMTP id 5b1f17b1804b1-438bd052e25mr102079065e9.1.1737965335251;
        Mon, 27 Jan 2025 00:08:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd502007sm121370695e9.14.2025.01.27.00.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 00:08:54 -0800 (PST)
Date: Mon, 27 Jan 2025 11:08:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aaron Conole <aconole@redhat.com>
Cc: William Tu <u9012063@gmail.com>, dev@openvswitch.org,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [ovs-dev] [PATCH net] net: ovs: prevent underflow in
 queue_userspace_packet()
Message-ID: <740fcd03-9c02-4911-8165-a912a97a6556@stanley.mountain>
References: <4d6d9d9e-b4d9-42f1-aa78-1a5979679b2e@stanley.mountain>
 <f7th65nhggd.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7th65nhggd.fsf@redhat.com>

On Fri, Jan 24, 2025 at 07:42:26PM -0500, Aaron Conole wrote:
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> 
> > If "hlen" less than "cutlen" then when we call upcall_msg_size()
> > the "hlen - cutlen" parameter will be a very high positive
> > number.
> >
> > Later in the function we use "skb->len - cutlen" but this change
> > addresses that potential underflow since skb->len is always going to
> > be greater than or equal to hlen.
> >
> > Fixes: f2a4d086ed4c ("openvswitch: Add packet truncation support.")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > From code review not testing.
> 
> I think it's pretty difficult to trigger this case.  'cutlen' will only
> be set by a TRUNC action attribute, which does a length check there.
> 

Ah.  Yes.  You're right.  I assumed that since we neede to do a upper
bounds check on skb->len then probably the lower bounds needed to be
checked too but that's not correct.  My bad.  No need to do anything
here because the code is fine as-is.

net/openvswitch/actions.c
  1402                  case OVS_ACTION_ATTR_TRUNC: {
  1403                          struct ovs_action_trunc *trunc = nla_data(a);
  1404  
  1405                          if (skb->len > trunc->max_len)
  1406                                  OVS_CB(skb)->cutlen = skb->len - trunc->max_len;
  1407                          break;
  1408                  }

regards,
dan carpenter

