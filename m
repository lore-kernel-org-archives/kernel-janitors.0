Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966D13AD16
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Jul 2024 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721032492; cv=none; b=gRFH6irZqB+VyHnpHwik70FjwLc5iOvCDM4gUqx5SiTC3oqcwzM7jZcb9PG+Y+ktIpbNnpI4FWRACsNpJBBIgp/TzxX14jEXdiVxBjmASCed8fzD9L4Wknu+52260qD4KCbTzak4OO9+apRKZSCgj5UweOek5EPkeFGtTwBhUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721032492; c=relaxed/simple;
	bh=12qK/peWcf3l+/VLCx5d119ICPpq7wBUmlboZtiGZqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpnikp6I9l/DWcdXE9dMicJBrK0i5SRdTRmBZB5iQXQ4x6TaQ3z8rRFCZImuuAduyliR46Eh2Etv4llfy2eRyBk9YwM+yYvjsdbW8TqZwL/hTXMJJL2P9IkfLcp/eJzom1ZjsSYzXGbJ0dSrHpqRjzledARma9ckFlh5wytmrGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=dtYtR+Jo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="dtYtR+Jo"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e994be1abso316281e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Jul 2024 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1721032488; x=1721637288; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iVCqckyW7c8V6lxlB2E2A8uvPDhEx4b9vry7kv1USrg=;
        b=dtYtR+JoDNibGhtqliq2/eBW27cwSUduk9RPqFYYoGuZ3qrh8bIl7Kcz5EYU6B/X3E
         cFuO/Sh7jAzmXr7YmqF9lDhSHnYllwqTqgpEGo6AfkaO4wJbcSbrKPVJmydXdCeJqcEf
         dF9FPIUHePKrwUW8mgfvvmTSv33xzxmHpgkkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721032488; x=1721637288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVCqckyW7c8V6lxlB2E2A8uvPDhEx4b9vry7kv1USrg=;
        b=TijLqM5/Lzl2+GUCellCbI9UcYMHxrgi8jcHGbnlh47WRHnxO30Nrb3kc30KkudcxD
         Rmo2z/tI/rtLyBRIy2HJYwLEyvlkWMeQHi9e5hzAl7VcWxyI3I5RkV7ByzH0Fi0GkMkU
         Ips9O0qVu2A4gixA5eTEtg+eLLgmiLuUBW/fa+0ntMzQyPumA2JWWAShWhxJ5DigSQb/
         xMnpuhlYy1czY/tKb7Dc7lhwTAhb0YLaMsnMDScV+urkVmT61VPskq8DO1mVETpBcw7p
         tEtN2TMWJp8IszUExMhGXNOEc/n0mIMGl33oEQMCX0Tu3426dKodfX/IWtdGNCJ0yI1E
         /Fvw==
X-Forwarded-Encrypted: i=1; AJvYcCXRVFuiWTg5dHVG/3HpoaMlirU32WUhQDRbxz2Qn5nL4zO2ZjVJ9XjhLTzO7rV4x9pM3hsPkhrVBc0H0x/yxe8Q8xfnWuiKAOaRvOxhMTWJ
X-Gm-Message-State: AOJu0YzPM0wTaQnBjkCG0DeL0cOulHdmbnmBnS5gU/5E/asQTQG32QlZ
	QXHXu3C41ZI0lw4Y4a0/QkddssgYkXRqNZ5p/UB4gixybZP84XxAxTokHw2LKyI=
X-Google-Smtp-Source: AGHT+IH5T9YdVXggIpdAzXkSXyX37SMpGlCbN9JJqMdkjy6jqBuP4OMd6gOAeWKCKT6bIEAml4lqfg==
X-Received: by 2002:ac2:5f54:0:b0:52e:9b18:9a89 with SMTP id 2adb3069b0e04-52ec3e53a53mr4484289e87.1.1721032487982;
        Mon, 15 Jul 2024 01:34:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426725597bdsm138545655e9.0.2024.07.15.01.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 01:34:47 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:34:45 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	David Airlie <airlied@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] agp: uninorth: add missing MODULE_DESCRIPTION() macro
Message-ID: <ZpTfJdscoWCjTaSd@phenom.ffwll.local>
Mail-Followup-To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	David Airlie <airlied@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
References: <20240615-md-powerpc-drivers-char-agp-v1-1-b79bfd07da42@quicinc.com>
 <99d6c483-9291-4bd0-8e62-76022abb762c@quicinc.com>
 <7b7e2952-fb54-48b0-93bc-f96c04e5cdd3@quicinc.com>
 <ce7863a7-f84e-42f0-9aa5-54b43edcd260@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce7863a7-f84e-42f0-9aa5-54b43edcd260@quicinc.com>
X-Operating-System: Linux phenom 6.9.7-amd64 

On Thu, Jul 11, 2024 at 01:27:23PM -0600, Jeffrey Hugo wrote:
> On 7/11/2024 12:19 PM, Jeff Johnson wrote:
> > On 6/28/24 20:14, Jeff Johnson wrote:
> > > On 6/15/2024 2:01 PM, Jeff Johnson wrote:
> > > > With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> > > > WARNING: modpost: missing MODULE_DESCRIPTION() in
> > > > drivers/char/agp/uninorth-agp.o
> > > > 
> > > > Add the missing invocation of the MODULE_DESCRIPTION() macro.
> > > > 
> > > > Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > > > ---
> > > >   drivers/char/agp/uninorth-agp.c | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/char/agp/uninorth-agp.c
> > > > b/drivers/char/agp/uninorth-agp.c
> > > > index 84411b13c49f..b8d7115b8c9e 100644
> > > > --- a/drivers/char/agp/uninorth-agp.c
> > > > +++ b/drivers/char/agp/uninorth-agp.c
> > > > @@ -726,4 +726,5 @@ MODULE_PARM_DESC(aperture,
> > > >            "\t\tDefault: " DEFAULT_APERTURE_STRING "M");
> > > >   MODULE_AUTHOR("Ben Herrenschmidt & Paul Mackerras");
> > > > +MODULE_DESCRIPTION("Apple UniNorth & U3 AGP support");
> > > >   MODULE_LICENSE("GPL");
> > > > 
> > > > ---
> > > > base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> > > > change-id: 20240615-md-powerpc-drivers-char-agp-db644db58c24
> > > 
> > > Following up to see if anything else is needed from me. Hoping to
> > > see this in
> > > linux-next so I can remove it from my tracking spreadsheet :)
> > 
> > I still don't see this in linux-next.
> > Adding Greg KH since he's picked up many of these fixes.
> > Hope to have all of these warnings fixed tree-wide in 6.11.
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Dave, this seems like a trivial fix that is stuck, but normally routed
> through DRM.  I hope I'm not over stepping, but I think I'll drop this in
> drm-misc-next on the 19th if there isn't any other activity.

Committers applying patches is very much welcome and encouraged.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
