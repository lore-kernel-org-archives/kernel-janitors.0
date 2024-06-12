Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9061C2D
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 05:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718169328; cv=none; b=iWJ0wev8oE5VCPCZpcHdhvroslyPVE2r9OEYm733ytilOHKTZYT5h5ieGWjQz3a9GfmWHFyJixpQmOsAaEArDCZi0xf9/q/XQVHjcQq8+s32obCYhEPfPpk1ekqeatGfGLpTWBjzahz3sc0uo5Zx2y35UT0pDCUlPPmHivBTz54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718169328; c=relaxed/simple;
	bh=J2OeQjaH4mI9m0kePz8+0552aToqUmZdlzTjOeX4qOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9gry9txIqQZGYT/fYwRoYShADUGkYUN4QEXG1MPIcnHrP1XfNdhdu/w1cUEzvuvR1/oCti5ZvndZOeKf9E4bkkY48SBG5dXatwlTcYqfhNe1f/q49wBhZnJthIQfYYYmRYApH8ynGGctIvctIpLcktRNCC8oMeyRkzhOju+lRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZp2VxYI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZp2VxYI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4217f2e3450so35097275e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 22:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718169325; x=1718774125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1jHnLs3tlSqmjoWiOcApOLhuBytH4bw7h4RnPZ1Abz0=;
        b=nZp2VxYIXYhx7sjgAxMcSHdNUKiTt1jPmZFkhehG5TMLyOrvIItiS5ms0rLmQUkoPz
         VjjjY81Oj6dDAF1pNyYNlZQVTpBjQ1hGXFhncsgvm4vwX5l19vBsCucZjmJ/s59ffYpC
         d5pXqCM5+bkKILYNPYB3iGrvfWX0Mdi9GaDBweQQ+VJ1vdTSJ8u2CNW771ExOVbdDAfY
         C5yPu31FkFiP3iSkaQK1BUAQQZjWCNKcqE9yDqbEBIQojGgrf4S2AI4E+wal/PkiNQAF
         iqMTcUp6DbanQfixP+yl54Cfd8ozX6l00w7obtQ8ErxlEiS/DMRT1pcv5uPOrQsNY2vH
         z12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169325; x=1718774125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jHnLs3tlSqmjoWiOcApOLhuBytH4bw7h4RnPZ1Abz0=;
        b=dFto303YI2gz1NdGaustcQBkkp9NjE096yyrJHzdYYxwo4L+p68wIfUMtCUTqGk+Wu
         yRD9G4W2BGQBdJZicGIKarvpw5LS0QUqmeXuS7dbMRV6Hdr94Bz2eFNW1juUlaPNxmDm
         ZpPVL0CN7ayh4pxuRhHXRLIPCSQgDgpNlpkpzww5Q3PL/0180uCuPEIdw4i8KRFrf9UM
         NZW/5Pm4/Ok46P+fOu6U/sigQxKoy4WqK0cZO6OdYsYTimfZfR2Ufspit2hHunl6DER3
         s9XSsmViNuiC0Euk8ZMx+j+Jo8u91YiK03FKoLzfiSo5qR0J5ni0tAj61wMUT/RsEjod
         +IPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhjVuscLVwO+Ue3RuZWbFFyhosmnw5x/eIpWd03QTGiJibBMXICnFMewXSkSM/9xBCQq/+J4F46Y+xXq8orVifjLlR+qhQIQhtxnnGpuYn
X-Gm-Message-State: AOJu0YzbcYduPiaAHoNjXeyqofnrBm59XJg02nrJ/WtT8/0KP2KunqWA
	tLsKiXSWVDRtalLnO1QwNAXbPnYDm3xbDScu1qHRDOMwXTCwIi52DJH932Jfnr4=
X-Google-Smtp-Source: AGHT+IGlIFJM3AqkgXoGMTmfk4udTWHaHCwWFLjaUlCR/Gyt/GPa3LkXWgqJAZgegqJt3xVRHjFWyg==
X-Received: by 2002:a05:600c:314d:b0:421:7c1e:5d5d with SMTP id 5b1f17b1804b1-422867bf846mr9874815e9.35.1718169324472;
        Tue, 11 Jun 2024 22:15:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e71dcsm10374195e9.44.2024.06.11.22.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:15:24 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:15:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] bitops: Add a comment explaining the double underscore
 macros
Message-ID: <df85a7c0-714d-4cdf-ad18-63bca4f75d9b@moroto.mountain>
References: <5a970f32-25c0-4955-b480-a4738bf86153@kili.mountain>
 <Zmi2oUOjh5elr57T@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zmi2oUOjh5elr57T@yury-ThinkPad>

On Tue, Jun 11, 2024 at 01:42:09PM -0700, Yury Norov wrote:
> 
> Applied in bitmap-for-next. For the next time please make the subject
> prefix [PATCH v2], then [PATCH v3], and so on. The motivation is to
> avoid sending emails with identical subjects as some (not mine) email
> clients consider one as a reply to another.

Oops.  Sorry.  I meant to do it that way, but I messed up.  Thanks!

regards,
dan carpenter


