Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028DA51122F
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748166; cv=none; b=AcWw5NjMdC2NUXlJRKeSe+QUvXlit6LBYrn+GUVxB0VRIbeVGevyGArVX0GVLSzp6XEMp0V3MBBAsWNk2+kYgAN4iBP2bg+a9Jubp541uz3feppAO0L4BGB3NuAAsgEvlAEUEEGvnAL203CVoaxzBCt7PiKK2miFvMLRKflj+10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748166; c=relaxed/simple;
	bh=BgZt53WCvRUv+SYL6NxC16PIrmwhlpA/RGPQ9pKg+mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDADo4BwyR92EsmLIcOInNl8FZJQxbYJNAFhkiS4VOKd1cIEiBaycpcYyJR27aDDTNb0nt5YtZihugSAragSbuoxqtfz3CPU+/SJhvIGv0/NfWi0rGGBPOWvo4lxBS9D3BKyxE53N36s6d3FkeRSajPzXIEZNwIQmDkTqEkxn90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6RhnrnQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6RhnrnQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso5095795e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Sep 2026 09:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748155; x=1790352955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6B8E7hz6GF/wCS6O+Kavtr2HQK/zZKBI71HK4pF7l28=;
        b=W6RhnrnQlYRgpKI8L6tX5vifGm9N/jUjaw+bmCd1h12VFiVZIfbBKVPLLvL4LD5zj8
         U9W8IdryhSqBLxVyzd3imBwpMHkisPgHz70W1+VXZrXC+hXX5YXkzNw26IbBbVJlLJJE
         6YVtV1Fjw/ylXwaFDAj1NVKiiUCvfFpdHcouunB4iJ/Qybus7crwxAkoZMxJP27tfVcs
         44lDAp4T0LL0mWu22PeadWmMjLn/RRaSPKFz/6eoLHO/d/LHzFP24PMNO42ZmN+UfAkM
         ySPMgPny54Xn7oLoA82lXwoVVaVQ33lLLF+57L44+E0ZpF13faK+zVApJbzhWrC3POp2
         SEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748155; x=1790352955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6B8E7hz6GF/wCS6O+Kavtr2HQK/zZKBI71HK4pF7l28=;
        b=BlK7GxDwkUtOsgVIurJ3qUDdP03062FOwcLZt1f16QnqrzNX9Kr0jIFywlcNB8LtY4
         HTwntdDOJfpsd8S3kCBcg/2mqMEEx0W7vDurw/ANwMRHudYPETOgKjESmcgwxkYplHD6
         Ns1F7Mij+u/Jge0nShqNYlY1AsmwYkwwb61TYgFgCQXQlEKKTOisJNQHac0wLOHbyTeJ
         59bpzFwrQF9h0ObTGwWwwXq4EB8eITIxIH8X7UvIqJd0OVHqJGG3z43DwdmJGMGDN1Zq
         lQm2alpdmQNuR9tW2QucmPXiWnRbDf8WT/ZtghSskciNKCC/dez8SNgHMmcVtAypdXbE
         ws6w==
X-Forwarded-Encrypted: i=1; AKwUvBxtSmO2buQO0KLz+K+SShA5k/bRuHK9wfw0dmXD9KIWxS/u/dG74mnQOGGf+dKXfiYhQyTfLgiHeypsqAC46BQ=@vger.kernel.org
X-Gm-Message-State: AFuF++muTLfNRfpJMKMkl/xJNFPyU6TBrQyzhy+vPpHRX1zq606FApWE
	ZvmrievQvMt31TdoFcgxWyjQ5HdifBZqJyNSHE8+5+gwjYVNc03jle4/
X-Gm-Gg: AYBFou3PoJCspBYCX68okGdMKjR3iqJXx7C7NuYMjcllnNKoW+BKTEf85h5aZIuUmSn
	3+XpgQiOu8itanuNL14TOgFSj0gXMUtAle8smQ0OtxKsadiAC8lXdq8Ehu1aGo0ykJ8pQu2E+eb
	J+fH/CFYlHnPOmuyqXVZBEF1Gg8JgmqQV3/RU3mQi3UxpppXdzlbgRB2sREm8EFzBlZVwE6u9Jm
	m/K/lQpFnzP6tR5gnsTjFSuFJsO313DgUFuoEO0Be8HzuZkIwUcN7n/deq6IKjuQVgKTbyAh2dO
	AXomoXb5V0mkh/RtptgQ59c6zXEHNAFtvB/29y9fu80U3xsX2ndp/eliqSnb0dsEk3Ae7ReDRIM
	S41twnj1UH3RKANLapTBE2RDWtTgRnMc3hvFICyJBzlCqSKl/ryMdDQYRv2Bh/ZWkci2GNUCKBB
	eI1NcdoKcsFvRAbkDhPXcUXlDRVqEOAjw7rJdw0p6ygqnqPBE2e46UEd3OBQJNFtWd0pSk7LXCm
	YdSbw==
X-Received: by 2002:a05:600c:354e:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49fc57226c9mr37347285e9.12.1789748154818;
        Fri, 18 Sep 2026 09:15:54 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ec1e63sm44136965e9.0.2026.09.18.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:15:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 19:15:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <aq1jtSc_7Ad4v4eN@stanley.mountain>
References: <aq0siVcghDe6x9cs@stanley.mountain>
 <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
 <aq06Kq-3n2R79YZL@stanley.mountain>
 <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>

On Fri, Sep 18, 2026 at 03:46:11PM +0200, Ricardo Ribalda wrote:
> Hi Dan
> 
> On Fri, 18 Sept 2026 at 15:18, Dan Carpenter <error27@gmail.com> wrote:
> >
> > On Fri, Sep 18, 2026 at 02:59:29PM +0200, Ricardo Ribalda wrote:
> > > Hi Dan
> > >
> > > I believe that for all the uses of uvc_mapping_get_menu_value we are
> > > already doing bound checks:
> > >
> > > index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
> > > value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
> > > BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()
> > >
> >
> > The problematic caller is uvc_set_le_value().
> >
> >         value = *(s32 *)v4l2_in;
> >
> > Smatch thinks that is called from uvc_mapping_set_xctrl_compound().
> 
> uvc_mapping_set_xctrl_compound() are only called if v4l2_type >=
> V4L2_CTRL_TYPE_RECT and then v4l2_type != V4L2_CTRL_TYPE_MENU. So I
> think we are safe.
> 

Yeah...  I have reprimanded ChatGPT and it says it has updated the
warning review skill.

This is difficult to silence.  But I'm going to ask AI to create
an tool to automatically rebuild a second temporary database which
only checks the problematic call tree and points any impossible
constraints.  That would have flagged this warning as a false
positive.

regards,
dan carpenter

