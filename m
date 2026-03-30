Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878D92C3257
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903737; cv=none; b=XPSspr5jBVbf6C20oZoiCyeHpaiJ6vtr2RFHY2YVcub4fQfluSGr2mlQhFYYeiOi/XV8YLyWCobiEs9Vq44+jpxqwfjuEJvPFCZ1HtGxFLuwW9LTTDdZpH/oSNlaJWe2D0Ql9wBFgPoo+waQNHI4S+AY8UESA4ntTVvPGeriSTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903737; c=relaxed/simple;
	bh=juoGQL/47plTvnGt5GOhG1+jLB/9C/G5XxLodMSXQPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKz4+f81oP+pECDGQrtrLR8iNjS30ntm1VBD0hIUkabBnZKRCmyLVXb2clv8mVPE2QdiV+JSt2hKv28pKZiBD5J5bshwDbgciYVswzW58iOtlj284fbpzYybH/5CgYCmQaeBnRVFmHy8CyXM+fouDaDQhzid2d9QuFIHWPEUAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqlBc6Bm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqlBc6Bm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfa33a983so1113812f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 13:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774903735; x=1775508535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=11nRDkJPS6NiBur1Y1D/t6MQlNhT9+VUgwnRNXGxUvc=;
        b=QqlBc6BmXh7J+u/u6xeWysC8zmCVuQXMMgRrwbb93PIpaVSl9HHa10dReAHDyZo6wv
         exeXkxMMxpLBxn7aqQu5CuXDg/gzZU9hrgVmgiv/gSKeXB6zKmEppS2894Oq2piAdbF+
         5Wl8Wz5CNMTp6CjUCatsy8e8xU63mDkDX6EbxrWh7k+b5Hnk4JOBPdTZCARJoefrcbD3
         oDNxD6SehADr7+XltsqNRYG+bza3WFk2DZ3qKKsJUsgXSvelNuSQfxI2ZRj9vUl8gkJr
         a3r8xUm/MFEM6+wcn1C/2bIWMjbYtjMEhALiSv8hlT5bGUhlWTT4X+qrBiFuH3i2rPy9
         tJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903735; x=1775508535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11nRDkJPS6NiBur1Y1D/t6MQlNhT9+VUgwnRNXGxUvc=;
        b=ly3ppU36LVcSZfdEHUO2v8lWMReqpYZaag+/m6gxNDkWAT8/uL6CBc0Ba5OVFIF1CL
         VyYCsFel673w9v6KtlJoMJ0XJkPimiZzpE/LFligWRpK8Cq5ZRvAkcMEHjHB5SM+HePB
         nUwU60SVTFRmbsCXUL7oCkksTGwXqgYgjnTGMj77pEzxdxh+ROafUyJppfXdGQHeJicp
         hA42zher8ekv5qsoAD1g8EN8NqQp6MLM44PrhpJYMkb2GHfAPAZLjXvGu/XrvNpulun8
         jFNqe/Y4M60+uyW9xmSdPcNTgru9NYu9T059hCYiwSVcbaxsnicln7E5Mri85CJayTDh
         LJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGvMfVqfTP0Ujl6gwZqlFySDJY/3885/5eTW1HKJvPXmXtwS3DCZ+0v5DFBMIBAt3/JKfzZKIXjPw2k4rnOBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrHJ2rzqBs2iZn4k66oVuHppqM9skqebXA7du0fMJjpDJbJoE+
	VJTtmXTgBPnnWToylkk2s2TCILS/TuSkLnS3O2bW9Isx2odd57+tQCOi
X-Gm-Gg: ATEYQzyfLDnAkty5R6xJwIznbJudFZM87Okcu873ixJKbk631yqPxpsekNUmYf/ILWH
	KJOSXWjoGVaus49mh9J4Ksp18gzJk+S7/Bz6MxrtkakTPpNMX4cniBWHeqDkmOfgRlz9MdHjA0G
	5bt7V6O+Kx1Bvm2+yRZUEWrwxBFncFTOEpbacDq0guirYr8vEwuG0pgErExDMkesCOdqiw7MxHm
	PIVZXZ8N5jAu2v6LKf4ePHG5P1nCYC6bsGvblFNfzw5pEYgl/0v30K1Q6lHTU1IYMU67yEug4uy
	ajAZ5zFgxsWv8VtWkTtsupPgdQij1b3hlveWb4rEaaUntgQy25fEn7iEQxYpYTC0Hq+nHpE2fN9
	d+HCGtK85MMaP7UZDDA1FDo469QW2183ZTX4mh1rHa2khPdnuDwvjml6mOuGDxxUkKNk9sp4DJe
	9dFgUbXSGG8aA3NlQWj+o1TyVanf9GJg==
X-Received: by 2002:a05:6000:1449:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-43cfa96ddffmr12528441f8f.22.1774903734779;
        Mon, 30 Mar 2026 13:48:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm19715896f8f.17.2026.03.30.13.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:48:54 -0700 (PDT)
Date: Mon, 30 Mar 2026 23:48:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Linus Probert <linus.probert@gmail.com>,
	kernel-janitors@vger.kernel.org
Subject: Re: Status of kernel-janitors?
Message-ID: <acrhsqvXp4R-egW4@stanley.mountain>
References: <acpeJQEPtDKQ68uo@mosquito>
 <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>

On Mon, Mar 30, 2026 at 09:27:25AM -0400, Robert P. J. Day wrote:
> On Mon, 30 Mar 2026, Linus Probert wrote:
> 
> > Hello,
> >
> > I've been a long time builder and fiddler of kernel source. Running
> > self-compiled kernels and pulling in patches before official release
> > etc. Bog standard for most of you I assume.
> >
> > I'd love to dedicate some spare to help the project. Like so many
> > others.
> >
> > The kernel-janoitors "project" does pop up in various resources such as
> > kernelnewbies and I think it might have been mentioned in one of the
> > Linux Foundations free courses. But links to potential homepages seem to
> > be dead and resources are sometimes dated.
> >
> > I read somewhere that this has mostly evolved into janitorial work in
> > drivers/staging. TODOs were mentioned.
> >
> > So the actual question. In my mind janitorial code work is a good place
> > to dip ones toes when starting out. Is this the right mailing list to
> > ask about such things? Any suggestions to find an area where ones
> > assistance would be welcome?
> >
> > I'm aware of checkpatch.pl but for many drivers diverging from these
> > rules seem intentional and just blindly fixing checkpatch warnings are
> > not helpful to the maintainer.
> > Open source is a lot of work so the goal would be to be helpful while
> > not stealing too much attention from concerned parties.
> 
>   I mention this once in a while ... *many* years ago, I wrote some
> admittedly hacky scripts that scanned the kernel source tree looking
> for what I considered "obvious" cleanups. One of those cleanups was to
> abbreviate the numerous calculations of the length of an array
> sprinkled throughout the source code,

There is a coccinelle check for this already.  I don't know why it
hasn't been done to NUM_ELEMENTS().

scripts/coccinelle/misc/array_size.cocci

regards,
dan carpenter

