Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47D62727E2
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Nov 2025 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763964359; cv=none; b=bDSO0dhP+pyAwBmxnuXfxw6mNBEipsl8cYeah9HKWRFO1pJH/IvvOlVn9ZVWnonr8SyPOrMVVbFkdQFack3uQLAUc5kTxL8XpDgAZ5EumUe8xVAVt2Yo4MPZCzFnLhrpyG43QWKKOha5GXYsMxGuQFMhWLLluE1b6pfriWW8TP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763964359; c=relaxed/simple;
	bh=2CbeR8ntenQ/udtVhShMbURQAzej9vCJiC0LEn5ddxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMpAJTh9oGEDPFby+JPq5qQy/OoC+sGxlJFYWEQ2D0roy3AfcdmA054ipB3A7hlYXgYn3CIvYHWwlW/cBO1/Wn02rS8I2MncPT92Z5sUeC53vdHW60jbXZKWXQcjoyD74duwEjSY/H66wGELQD/Zj9mx8jejKbIpg5dLLmdJCmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bsI5Eq7W; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bsI5Eq7W"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so2369685f8f.3
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Nov 2025 22:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763964356; x=1764569156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rZqOLfNt4NNjM4szCLBdWh2M6zRj7620Z1ksv8HS62c=;
        b=bsI5Eq7WM5o1MsHflC2TU+27GoNjGqfn0Eon/PYJCuPpTIZ0SnJadfXFw5+ecFqxFo
         lzEdbaXh4/SMIUxxyKRqnW02RLlrS7u4i3GgxTqFYB+f++jS8r0n0nMHpA2RzzT1J0Qq
         mHtANDl93/eAjZbovv8E07DKM8T6VtE+2Z2pX86cWNw/DmicO+etSkVntzJ1vSlPq/y0
         HQ1qkKcPvygHyShiT7kPbmeyBRe2IVcqpLPFl8CpH4ZETB1jkVEkI3I0pKoh3nDOwT/5
         htUJ3GFB42+SvhWNmw1tRWejCaPFhal3CgSwj/AhO51YJ0k+avBcSmSzfQvEfe/cuFG0
         jFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763964356; x=1764569156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZqOLfNt4NNjM4szCLBdWh2M6zRj7620Z1ksv8HS62c=;
        b=t1QEVJe2YkxORBa2R0QrkFVjAjerlOB2xbeuuDTbSj4YiFuKyurZT4I7g7oABSfey8
         ufpBHxmU2EA/unuU1rf7Chz7TYmS5QNH3fwxhl6o/xrc+cEI+MGOErvkZ2WJ8BCRQJJB
         pjs+xW+wtnQasVSpuIN+1ayzXXdIvNs6WYLy+Ip3gMNedzBaHB3kYdmsGjSvX/LsBvEJ
         SHtcD7CUUw6bMs6YNrhGsk06IpKRkWKIFivmaY0ZsvUqhySKNWk7rzodP/CtBeTDFBeP
         f675cwne+GddUDMPWRscFIy1WXbPGSN8Xm72ZCC+WQFQJ+xkupzSMnrZ1V3gzcZEN7Q6
         jrLA==
X-Forwarded-Encrypted: i=1; AJvYcCUEKLm2DoNhnfHFxEoFZ9WFMKhWHQa6V1UXGCh043kyMZc/TjSKuZ+n2OabQaBNlPaojY43CksMsI+p2SfKfMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YylC250exIKKlsQTZTFVM1E5DWYUlhfDGdNBXAbFu/Bmxep/lGk
	xIbZPFTwv2Xaq1+RCkXwMGwCR90TFOPutpV7akrmQ2v69u2DQI+EHwk3+YZgXG9LgQTn5hsGOlj
	YaXp8
X-Gm-Gg: ASbGncvfq7QDsvtMt38VX5UwRDRtaT1BJVK/I/AjflYzMk3E8Qb0+TRuTKntrUNAXSs
	xXpAbTSFBgaWTMTRbmXvK9X/uB8bo02waCv4Tl0+Yz0YR7SZn83vVd0AkEgKMP1ercd0C9NYnqn
	wGptnMpWrTMqGRn/7aAiqKxjtUWHymkcFdUki/ni1tmRy+7CcXfFfoxJ+C87mNupl4E/I9yNX0+
	tpW6fP00cesaeWcGFh+k6r1nW23FDzw4DKTiXP6cW2fzW2+d9Mi/+OZa0jF7r0EJ6IzHIqJu5qS
	THGoXSiJvabJBhmjohLxsAW6AmTBrJ044MJ/KOrxMe7O1sGRhWr56kD+FzrhWYogrI8NRChPjEe
	aA/emNly1krBCuPI/6lERFukhhmjMhWfb8oHPi85SYBp4CiZPBVdwgDx7pSluvdxVQP9BD5YqWa
	556Hc2ggEd8rSWfGQp8dmyKCnXNQY=
X-Google-Smtp-Source: AGHT+IFTj6UXP07vA5yQa/8SUGDxXg+ZGMMepdyy1bTa4eJm35XddA65LTq5vpooyvG9kjtwauYocg==
X-Received: by 2002:a5d:5e01:0:b0:425:742e:7823 with SMTP id ffacd0b85a97d-42cc1ac9401mr11186194f8f.12.1763964356070;
        Sun, 23 Nov 2025 22:05:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fa35c2sm25166281f8f.25.2025.11.23.22.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:05:55 -0800 (PST)
Date: Mon, 24 Nov 2025 09:05:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] fuse: Uninitialized variable in fuse_epoch_work()
Message-ID: <aSP1qs4SOHrDE0tO@stanley.mountain>
References: <aSBqUPeT2JCLDsGk@stanley.mountain>
 <873467mqz7.fsf@wotan.olymp>
 <aSCkt-DZR7A8U1y7@stanley.mountain>
 <87ms4ez7q4.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ms4ez7q4.fsf@wotan.olymp>

On Sat, Nov 22, 2025 at 10:23:31AM +0000, Luis Henriques wrote:
> On Fri, Nov 21 2025, Dan Carpenter wrote:
> 
> > On Fri, Nov 21, 2025 at 01:53:48PM +0000, Luis Henriques wrote:
> >> On Fri, Nov 21 2025, Dan Carpenter wrote:
> >> 
> >> > The "fm" pointer is either valid or uninitialized so checking for NULL
> >> > doesn't work.  Check the "inode" pointer instead.
> >> 
> >> Hmm?  Why do you say 'fm' isn't initialised?  That's what fuse_ilookup()
> >> is doing, isn't it?
> >> 
> >
> > I just checked again on linux-next.  fuse_ilookup() only initializes
> > *fm on the success path.  It's either uninitialized or valid.
> 
> Yikes! You're absolutely right, I'm sorry for replying without checking.
> 
> Feel free to add my
> 
> Reviewed-by: Luis Henriques <luis@igalia.com>
> 
> Although I guess you're patch could also move the iput():
> 

Yeah.  Good point.  It's cleaner that way.  I've sent a v2.

regards,
dan carpenter

