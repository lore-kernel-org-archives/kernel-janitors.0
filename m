Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0293BE148
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943600; cv=none; b=s6Zd/g1kfXnSprHUNmSq8VWK/AXYUJiIDg/sLa88YcGfh5ZR42Dj60wgL4OhQzl8zF/C4RoJEynzBP4u0q5NqfHX63TbFqsW0mejp0a27Q/WGzCTEht09yoDAJkfQ3LxH5qVh8y4fOmLFbjW8nkaaZkYGT0jbFThV4BlYTkVA3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943600; c=relaxed/simple;
	bh=dU9xNgFDbx2kQ2NQXvuHFDuKaeO8ZHmpz5PoVlN6u3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoIQtTl+W1Cu8LjrTEbE6uCUzjA+UJIngnVJtJEjG7IRHykGf1Uf+fpqAkrSi2BTTeXmNxqvetKL17+Wvnago+0GbyneFyw0J8jGdbwovJaCcTEEWcJQT6uUfu/eIooUfQXaqoBeUCPn1gvIDXYy9gcOTGmum//+kMAsCuDUNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oO2cN6mq; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oO2cN6mq"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-650789b22e3so7535546d50.1
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776943597; x=1777548397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvXLdkmJR7FtJxo7bxydgohDlS+pxyJJHlXN3C0yd9c=;
        b=oO2cN6mqcVkXope/R6niVk15HKM8gy/sfOpexhcCTUF8xgrRFlUqf0bONgWfow0A0v
         qMAjcrkBrMQQekWsvalvR0HgzKgq/kH5ZQ2Cra6N2qfFv9M02a1zPntt1TT/MC1aEgvz
         ST5fBBObeKqsv7g/lolr19BYXqgRtG7pufJpju1xEpqzjlm3zGO/e2ZWcw7YBU4OLGKs
         dpLqZtiRuocFIICJzHuNB1VSLTfLO7DC9gpejIcgJeIqYSaLXiMbU61HtMiltOPS0WT1
         voZq967J54rRKo9EPlPXQuy34A9OC9iRr3yi1Aq9oU7SEUqgOivXLbokD0Mace9X5TV0
         /XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943597; x=1777548397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvXLdkmJR7FtJxo7bxydgohDlS+pxyJJHlXN3C0yd9c=;
        b=Im5aBOtLPrxNfSvMfdltnYYrHG/8HOOcAF+kdr9WUhgx2ZMw9Z/lXMMoyCZ7qjnMDo
         rghqj0YSSdWpOaUgSTVIruiJKFVC+a249dJl1rwuUPBlrhTmoCqLFzax2z7huKsco0LK
         FHzX8Gn6Q7zR+2PCbvSwrmzqp9m4qWqRcFpQRyNL4IjqfedjrZ7bU/g07DIPnMQHyAj4
         RXhZSisqbbU6GZCrdEXNGMEqDFjHVwEH3NYIAHz6cfCAU6q285JFo6EbxfIAS4R7wm0T
         83OzBG1PA5frbuv9qa3nRQN5AaYedQO2wTu+0npFu0mXj7zhrR9+GkkvlV4eYTbLp1un
         CKIA==
X-Forwarded-Encrypted: i=1; AFNElJ+FkirBN1QpH+T6fafojmZAGZjLd2QE8xjZ7R2PoUwmW0OXVKOp5OxceenAkTeL54J7Zf5T00A2CTlJ7s4FvSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEyXNWM4hKY6jv7vJibX62siKR44BWEcJkOD+IYcvkEmELWYpM
	3kWmvTtMMsIozEpAGYci5lOTB1R+MA/WW83X7j3s9wAy/fkN1hw+SLJo
X-Gm-Gg: AeBDietdtRRPVbEotgBTJinSUSjoeUnUDxrSvzlMdENoQNOMhh2ZYq0PRTuyepYDRN3
	cvjSSILhjmzLQ4EcKAUKQCO3nT5LgcgCidb7+PppXPAH1t/pFiyglgpckYHDrqrWTxc8mgeFY32
	eL8HIKOjxv5t3ZEa2oanIiIqjImK7aTK1jn8mKhmhDQ4cSJrvcvgz0elh2AGuvaPZrWeZb+Gu9y
	5qAB+ZW5oUzUhIGYokrVIJRSIq/9rxjFXX6GtTQwws7bRmZGlg6NMw86QlG5+G+NclEf1p+QFLa
	llTH95J4p4Mkqiz6yk53vlcJTjXNAubfErsr7034Iadtrv0O6jxnQWHEHvYSJ/yB7+W9AGTbtvt
	rDU3zBnZlFNmrHWoxq2IxvC9NYls81KvXvrh7gKRFQTxPzzsBoKPbFQ6n2DR/Hwq2eM008ow0bO
	WwiptMMw2agrFJOrmig3idLWGUDyq4rVQaZ7X2A2E=
X-Received: by 2002:a05:690e:408a:b0:654:2882:42b8 with SMTP id 956f58d0204a3-654288246a1mr16369040d50.35.1776943596702;
        Thu, 23 Apr 2026 04:26:36 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6541a84063asm7486713d50.0.2026.04.23.04.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:26:35 -0700 (PDT)
Date: Thu, 23 Apr 2026 14:26:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs-amp-lib-test: Fix some NULL vs IS_ERR() bugs
Message-ID: <aeoB5h-VPs1Oaebw@stanley.mountain>
References: <aenFqUC8X2CucQwb@stanley.mountain>
 <63c18e33-b2bc-492a-8879-3e298ca81465@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63c18e33-b2bc-492a-8879-3e298ca81465@opensource.cirrus.com>

On Thu, Apr 23, 2026 at 11:09:35AM +0100, Richard Fitzgerald wrote:
> On 23/04/2026 8:09 am, Dan Carpenter wrote:
> > The cs_amp_devm_get_vendor_specific_variant_id() function doesn't return
> > NULL, it returns error pointers.  Update the checking to match.
> > 
> > Fixes: d70fa6b569a9 ("ASoC: cs-amp-lib-test: Tests for reading SSIDExV2")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >   sound/soc/codecs/cs-amp-lib-test.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
> > index 636d0f3198b8..bb0cfd9d5db2 100644
> > --- a/sound/soc/codecs/cs-amp-lib-test.c
> > +++ b/sound/soc/codecs/cs-amp-lib-test.c
> > @@ -2360,7 +2360,7 @@ static void cs_amp_lib_test_ssidexv2_fetch_invalid(struct kunit *test)
> >   				   cs_amp_lib_test_get_efi_vendor_sysid);
> >   	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
> > -	KUNIT_EXPECT_NOT_NULL(test, got);
> > +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
> >   	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
> >   }
> 
> No, this is incorrect because we are expecting to get -ENOENT but now it
> will fail the KUNIT_EXPECT_NOT_ERR_OR_NULL() and not proceed to the next
> line where we assert that we got the expected error.
> 
> The asserts are:
> 1. It should never return NULL (because it returns ERR_PTRs)
> 2. It should return ERR_PTR(-ENOENT)
> 

Ah...  Ok.  Thanks.

regards,
dan carpenter

