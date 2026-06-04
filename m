Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DBD369D7A
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Jun 2026 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559145; cv=none; b=km9LyQ3/1k1SbvxJxO1HNn41nTozd23+DNupAhUwgFXtyR5++ss5pkkO9VFqUqRVc7jjDrBMsVPeZCCBPGU5vXkp24h7xZjwryYb6ZZ1qJDta8qsJiO9xRt+tYpyrdF4+59pvH6W0/ewzz57ier3onFsHfKvARRSn1tBQHrKHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559145; c=relaxed/simple;
	bh=Dvt4W+Qy7EAGh0/2wIo3vsZYTtfKVjQbzzmSzWu1jsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tS0Dgpqpi7wzS52YitF2NvdWjb3mVndPCRMSh9t6XHWlF0sAibbEYPN1JVIW0JT9Xzi7PSQnMlJgfZwMrM0YsmI85M3RQxxPbOo5FJs9M5NuQRXS2SOrfdWG2Hs1ArOuqdrWT2gPtOT4G3f1R9WUPczgufN80zLQFypa/UcvkzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAgspFg+; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAgspFg+"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9159f631656so34858085a.1
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jun 2026 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780559143; x=1781163943; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kLeYQqRXlh1qJ/lyjnFUyj/UDElKHE/qIYm+8ZoOG5E=;
        b=CAgspFg+mqJL2ubJwFPUAhGcHpHcMNEjz8m3kWH6q7daXlPAbGkmoRNg/MXFU7vrVn
         P8KH5RtGSCJxWo8Q9Yus6dAE6ZBDz37jOHjiVNdQ4SyR7OzlDGk/baEfxP5qTJ7suR/s
         LAZ4eYSR2wSYkJE+rJ4Q8P8G7gFXvh9Glo5i0lB7vIZhwfvKMiX31Wg/1274RneIrzVD
         wl50l8diKtIrNYVwVrLE0l4kYNvmrNV3RxHebrBYeszYka5TenUp4u2gU+X6dXM/yf2A
         vKegx8MSSuvRMCOjm5+A6F3c30PuIbOfPWXSITWshde50j4+RD79tecBCkU6RgaIqBwG
         nmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559143; x=1781163943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLeYQqRXlh1qJ/lyjnFUyj/UDElKHE/qIYm+8ZoOG5E=;
        b=b4TyNDfwP8Aho5ST/r4iv50s7dqBEdgKyouQT5KJdV47LNrrmyPlKMol3fJeTEv74C
         AUPdzfdZ9a+HEBC5J04MFrh2WafUQfwhP1LYyxNIg4J5ogqpGnG2Tkl9IdGwR47NaPxe
         plCWN2DPssPKiI+AIDjiuO4KYlAsopE2rBPmS/VV98rURF5l4HoA0Nbr199TsaYhY8Zl
         TO3VpPieIbc7l4EsPDAEu8ebDEu7kHOlwYlQLX5TraTU3MuVhpWXfMlz0QzmRW+G8Oog
         lb54HkMlwQ2UTNrCZ9Jt1S2U6NaVoqjYU/3Tfvd44tSgaLWz6NDCQHelhC8/rJibaaec
         AVUg==
X-Forwarded-Encrypted: i=1; AFNElJ/QWqVAPE+BZoPVrxDYVuikJkoElUm5DxKygalpzeAaj19PgJDTfq/57k7dXzyDS0AXSKr8p9JeQZD4ThRGT3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxix6ebQ67ZnedpTGZmjlJ7oiRnC/p2XJtILtI91apqhIi1WDwH
	5sLa6N1D4QBwAHSyX9aOTGeL5JGiMGbAG7F8Dce76OUXuGhEvJ/jZrvS
X-Gm-Gg: Acq92OHSYS2tiDNZ7Dh4kyFnlb/3pSjxhhaaqfT7n8JN3Fgt9mqiGzk6VrnORQ3S3na
	ow1mRrBsegngH30aAtt8o+5x+8iA5po736nC9ZY36lA/pUBtgTt38F4euo7tiRJjcjvmhR5bZct
	8zxuVQIKKpblVLxD1BnnoYHpdHAiWjqUL2zZmjhLyVoLXd3cbM1kh8wXuulWtWd2iXuLpGn6hPf
	u9mHyUt2Qrb1iRdvr1aqW7fRIA++9F1HyfUa3ghdRti3BRLAbu1GGIfkhgXRoOr7/rMpSmrIn1v
	R0pwteH7W4XBtP+wZHKDjlIO0zI09t04XeKm7LilIwxWbBct5bSL/P6JlZIpl+pGGXR4/CjIAvC
	J1vyQ55LPkd+5TshjEIbE3mm7T/CgQ51Wm47Fg54d+I1Ku5KwsUO0h2eVVjmk26c979OODLoIRg
	pk5iDxQBP1HGEW4WIbsffu+pBPtpQ=
X-Received: by 2002:a05:620a:3727:b0:8cf:bad7:20c5 with SMTP id af79cd13be357-9159af5890cmr400348585a.25.1780559142818;
        Thu, 04 Jun 2026 00:45:42 -0700 (PDT)
Received: from localhost ([149.40.50.195])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37c4e6sm505365785a.26.2026.06.04.00.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:45:42 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:45:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
Message-ID: <aiEtIGOFhF8AfUCT@stanley.mountain>
References: <ahP3O2tQdu4dNx_c@stanley.mountain>
 <CAKqfh0En4pHqSfxfd2FHSDTxfWx6BfJLfeQ3xup4bwfLSTrZRA@mail.gmail.com>
 <20260526191946.409160c8@jic23-huawei>
 <aiEpmqKwFuIMRfdl@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiEpmqKwFuIMRfdl@ashevche-desk.local>

On Thu, Jun 04, 2026 at 10:30:34AM +0300, Andy Shevchenko wrote:
> On Tue, May 26, 2026 at 07:19:46PM +0100, Jonathan Cameron wrote:
> > On Mon, 25 May 2026 08:20:31 -0500
> > Maxwell Doose <m32285159@gmail.com> wrote:
> > > On Mon, May 25, 2026 at 2:17 AM Dan Carpenter <error27@gmail.com> wrote:
> > > >
> > > > If the *ppos value is non-zero then simple_write_to_buffer() will not
> > > > initialize the start of the buf[] buffer.  Non-zero ppos values aren't
> > > > going to work at all.  Check for that at the start of the function and
> > > > return -EINVAL.
> > > 
> > > Commit message is incorrect, it looks like you're returning -ENOSPC here...
> > Tweaked and applied to the fixes-togreg branch of iio.git + marked for stable.
> 
> I was stumbled over these patches by Dan. Since the file_operations for the code
> in question do not define .llseek, the seek is not supported and will return
> -ESPIPE. I'm not sure why we have these patches to begin with. Dan, can you
> elaborate on the case where the *ppos is not 0, please?

The simple_write_to_buffer() will update *ppos so partial writes are
supported in that way.

regards,
dan carpenter

