Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662B351C10
	for <kernel-janitors@vger.kernel.org>; Sat, 18 Apr 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776512658; cv=none; b=Q06B5zWxDKTg68u9voAtFKPgc5ivOTgIEduthOWESJxncs9latEv0s8UD5/GLnmUbwTmd0strRYe+Z/juZMPmnKxQ4/Yjx2rnmkIvxvk8sBwjEHNV6Fp83D13Uuhh/sKCZduPVVge5Atd26EFilyUno/ar50NsqaA8R6DpMyfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776512658; c=relaxed/simple;
	bh=DTtC8NxB4D5X346ZQ8nuFBJ4c5G4OQ30co4kBHhXhtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p62GkzRWZWYauW8swcHgVG0yx7utaz1339AMQpZATf9OuR9C8FIAX0edMJi6XSiNoQfr+cOkJy0d+bVbmMDatc0UtJGioelERj1UchMzpXCZCOwBXrPao4sCgwiLQ70kbR8I3wNYl/iJn7Wh1ruQN74j7P4L8NmWmL6s2oZBHAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcPX994F; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcPX994F"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so11127595e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 18 Apr 2026 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776512656; x=1777117456; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iIJ+Ah9Hw1cuV39d17Fs4Sjoe/KtvVS8yFzsHhldbSk=;
        b=IcPX994FEW7v0sSeBEriLLSQ3RnWnfy640OhJr7qzVhLbZQU2MQUsU4vuUBwV2DSaP
         Xzd5dr5w1+jqfMGHOyxtwFbrKLUvtf4lyu6u+hrR9u426M1mA+Hu4ZGUK71lA6SuHqnH
         KFhoCbQi3Zyy+zsvS48Oo3h/TVrKRoiprPwKltSVQYbFsz2AbK1ZxFzOxrG33AfZkSmk
         dpzMtTqtrGrvG7m0KcSuuxnoEVIYeefEjloyg0DXybA02LLHD80e5VTkDnqIMrXb6Ipx
         dhMXQW3I5UI72b1p7UcADCOH8D3ArvFQ8zHpsSR22+r1+vxNN8QSUJ7MrOkRtJW/D85C
         arSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776512656; x=1777117456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIJ+Ah9Hw1cuV39d17Fs4Sjoe/KtvVS8yFzsHhldbSk=;
        b=P283KOFWfuvJ/nwGBwG+7wh+8BG5PISq0hiv+y0icGaOdCTxPuBAjPReij/LHy1wVw
         Lhw9c8QyIzoK6D7tx9i8+Wgooxbf0C7S+2QjCvtAetsCFAaQrV8jP4Hn8Uk4RnH0NkrX
         XOTR/rUXLFli7Ldg44VlLiFTvKYR2mHnA0nBuc9vBAWiloVq/j5lDUsOSHX0uFxBZfmg
         wW7jH+LdJ+52NKdp+dB6Nwf1nxw4zudyxTwzINEA+g2dKjYfvuxZgsHAuDDAuBjipHSS
         WxTyW7rCge/mtNATrt2KV8lOnM9zQmlqJ7ZGGwiDfGlfZCMWg+p1Px8EHkiNI8k+FCpW
         35Rg==
X-Gm-Message-State: AOJu0Yy6SAgzA0x7oCvfKD9fWZuywpvttFwfOfDTFmY4Icut/sqtmCpH
	TWyq0eAUdExX3UHUUo5C8bcNRZShQHirOKUn014g6KZbi4iSiB9uDHvn
X-Gm-Gg: AeBDiesdDh2usEtruCjSdE7JsCZLeCIviJ+iplY+0l8iTOfAxvBW/q9hdNqhmWdJKZB
	/k/AcZJ5JsARVZ1Wfmx6t/W7hNNd5ExbqH6SEAvNGtQN9eI/veCVEYIFwqBpTWj7sQeue8j7r6A
	NZ1cQUJ/wUFSHTwlFJgL4otFPdSLTCua18w5YIQ2Dqq1LJ/udMX0aHQ6LNp9JRwfqXZ9tlAmerV
	RTp4EdzQaLgMJbRZNUP8iJCoQYGJZxBXbryQ8VaLbDOiv3JeZgzAj488zvTSIBYzNsiAx9goOBx
	p2faQVF8CzT6vA6v+MAxIl9WRv44D6QZr1v7c6WMTRjDe1PVTYluWHCnStQ8Inx2vqBl7rUN8ME
	WF5gGLvtbE7gtiGoHz7rpGQOn3Gv/rfOy7W7uCyofEnEybh/DU1QUMVrTq8K3DyWOZ2uYRLv6Xf
	XVnI9jcrgdKbQjWrR+jvWsiZffigIq4A==
X-Received: by 2002:a05:600c:c0d8:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-488fb8838abmr61301985e9.1.1776512655419;
        Sat, 18 Apr 2026 04:44:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1070bfsm120135555e9.7.2026.04.18.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 04:44:14 -0700 (PDT)
Date: Sat, 18 Apr 2026 14:44:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	linux-newbie@vger.kernel.org
Subject: Re: [PATCH] Documentation: adopt new coding style of type-aware
 kmalloc-family
Message-ID: <aeNui4yhFtLnIvSI@stanley.mountain>
References: <20260418093101.130335-6-manuelebner@mailbox.org>
 <aeNcgSu8kVEyWbzY@stanley.mountain>
 <980be93ce680c831c37dbeeb070135b2fc8f4fb8.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <980be93ce680c831c37dbeeb070135b2fc8f4fb8.camel@mailbox.org>

On Sat, Apr 18, 2026 at 12:45:19PM +0200, Manuel Ebner wrote:
> On Sat, 2026-04-18 at 13:27 +0300, Dan Carpenter wrote:
> > On Sat, Apr 18, 2026 at 11:30:48AM +0200, Manuel Ebner wrote:
> > > Would a patch like this one make sense?
> > > I think i need help with the change log. Is there something to much or missing?
> > > 
> > > ptr = kmalloc(sizeof(*ptr), gfp);
> > >  -> ptr = kmalloc_obj(*ptr, gfp);
> > > 
> > >  This one is done. The ones below are not done yet.
> > > 
> > > ptr = kmalloc(sizeof(struct some_obj_name), gfp);
> > >  -> ptr = kmalloc_obj(*ptr, gfp);
> > > ptr = kzalloc(sizeof(*ptr), gfp);
> > >  > ptr = kzalloc_obj(*ptr, gfp);
> > > ptr = kmalloc_array(count, sizeof(*ptr), gfp);
> > >  -> ptr = kmalloc_objs(*ptr, count, gfp);
> > > ptr = kcalloc(count, sizeof(*ptr), gfp);
> > >  -> ptr = kzalloc_objs(*ptr, count, gfp);
> > > 
> > > change log:
> > > [PATCH] Documentation: adopt new coding style of type-aware kmalloc-family
> > > 
> > > Update the documentation to reflect new type-aware kmalloc-family as
> > > suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")
> > > 
> > > ptr = kmalloc(sizeof(*ptr), gfp);
> > >  -> ptr = kmalloc_obj(*ptr, gfp);
> > > 
> > > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > 
> > Yeah.  Fix up the commit message and that could probably be merged
> > through the documentation tree. 
> 
> how do i fix the commit message?
>  what's even the issue?

I just meant that you should remove the stuff like "Would a patch like
this one make sense?"...

regards,
dan carpenter

