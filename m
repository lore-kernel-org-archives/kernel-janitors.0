Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9B92B9B7
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 18:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723487737; cv=none; b=o/UI+gZeI2Ari06K80UASW/qi0N9aTGp3cVQ0L8nfPJuSdP35xYPFCuKNYNk8b39KT0/TVWeKUT2kPsqVdpNK2GJ7wXEHB+iqY+v2X4udNE5ynCGkqy4hhnwT4DxF/bMRteULlnz+Bsk6E+dfv0OB53gDInEBK/3vlFKe9hY1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723487737; c=relaxed/simple;
	bh=sN9bFBft9az88rK/e4asHzZ0Pxa62fN5KIwS/zbjp1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lucC402q3NTUghD5G5mHEPkk62OGniI1Z1G9r6UoM5+h3OkY6eVpeY5MhafqX6BBmESn0BPCzGKKX+wzY5DZwVyb5JEYl8kl7/hl9hotXXvubN1wsYBTltmetXkfawlK8nopMI9sIS77FXF5d6KR9Z5EUTLtSO781g7P4cHq5Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lw6tKo9Q; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lw6tKo9Q"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso72889891fa.0
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723487733; x=1724092533; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nWxDULdi4PjkmBam0QUTGYnA3lUNvr/zud1G25PtSZM=;
        b=lw6tKo9QsYYJbKuDYEraqdGI0AM+pJSRJp2avij8A2cc6uCGMigE4bYfhNPMbyTKvb
         I78LFf8mT0f39jDzyVl5wc7mTq3tQRrbHxieMi3S9GvVnZ743Ro9TqHROLhfWRN0vevA
         uz3WK5TnHa2ipkDwchdlIyanv3eeuGEVyHK2d5Qd/S/ZRCHUq2vo2rrV+7UKWJGfEcd4
         yhI/zwnV0lnESV9xrYvtTIPCiooDXIiM1Y9pJEKGJS1xbhruHdmX1hPvSbo8i1P29sfc
         kRBFX/gaSbZu6j3oUwlE49bRMKvCXY28ErFuMcijePQoIfT9arxGsgH6osyE+WBtkxKS
         gy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723487733; x=1724092533;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWxDULdi4PjkmBam0QUTGYnA3lUNvr/zud1G25PtSZM=;
        b=qap4dUAGh1Kcv9Bo3Xmqk2taqul2Us3WZ1/Xd9b2XfhddVKf7VfXgHJDZ8LNnWZN8F
         gji7J8cryqfRP9UGodqzRzqjELBimwIHiX4DAJ7tLDdsMqrH96tNnQZ3sYtHEGxSfYTu
         VmyohWyRC6QV8EXZbAUIRMSgomY8QHQktBx+B2AVED3SHTV/xcnWQ13bmWqGK2sWskEx
         j8OzSPOpK25rWH0I94ddzpXEPEcFlYgEKEPC1KybZDr5oRnK3jj1NeRjrfjw8Zd+/JYT
         fm1V0UPWVD+Vrzy7FpCZFiSOElP4xSsneNDfkXEXan8msby0ggsHJRMVKuCR70qGBV1O
         8JQw==
X-Forwarded-Encrypted: i=1; AJvYcCXB4qU5VfRjl5PRYW7VGiGQ9hhT2rHvLtWrM79JSrG55gHNdtYuwIKTrUrOiZ6H5g/YkxzeJuda7FTowvKFQJpxd4RxNBL4kanNGaCCFXkp
X-Gm-Message-State: AOJu0YyQMsOa6nj6pug6RAviYPyJBke7uSWYjmI5fEJylRQAa5cVf8NG
	Na6I6qcobZTW4jfzeYE/eZ7anrM0oI44VCHReX6+2y8HzSy9PMFRUhrjsQZ1naCQFUiFph8GVC5
	V
X-Google-Smtp-Source: AGHT+IEjjBXUUYaxJbp4Zdb9brbeSxg0X13yfn+eDULgilMje9S/0QDFNKVxe8kgcHN7/k+SP13XIQ==
X-Received: by 2002:a2e:be09:0:b0:2f2:b7c4:45e2 with SMTP id 38308e7fff4ca-2f2b7c44689mr9196461fa.20.1723487732911;
        Mon, 12 Aug 2024 11:35:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3f47b4asm790066b.36.2024.08.12.11.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 11:35:32 -0700 (PDT)
Date: Mon, 12 Aug 2024 21:35:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steen.Hegelund@microchip.com
Cc: error27@gmail.com, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: microchip: sparx5: Adding KUNIT tests of
 key/action values in VCAP API
Message-ID: <ee22da5c-c947-4c65-b59c-075070dd64ae@stanley.mountain>
References: <7bffefc6-219a-4f71-baa0-ad4526e5c198@kili.mountain>
 <1b78ec2d2ff21991048f61f667d70acb36e38065.camel@microchip.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b78ec2d2ff21991048f61f667d70acb36e38065.camel@microchip.com>

On Mon, Mar 27, 2023 at 07:08:59AM +0000, Steen.Hegelund@microchip.com wrote:
> Hi Dan,
> 
> I think for now I would like to just remove that line, and then I will try to
> come up with a better test.

Basically all the references to "rule" are invalid after the
vcap_free_rule(rule) line.  It's weird that the run time use after free
detectors have not detected this bug.

> 
> Not sure about how to add it to KASan test dir? Would that just be a reference
> to this test to avoid bug reporting?

KASan is a use after free detector.  We include a bunch of crashing bugs in
that to test if we're detecting use after free bugs.

drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c
    1442         vcap_enable_lookups(&test_vctrl, &test_netdev, 0, 0,
    1443                             rule->cookie, false);
                                     ^^^^^^^^^^^^
Rule is dereferenced here so it can't be NULL.

    1444 
    1445         vcap_free_rule(rule);

This frees rule.  When you free memory, it normally just gets marked as
available.  Unless something else allocates/claims it, then it's fine, it still
has the old data in it.  There are build options to poison freed (write
garbage values to it) so that use after free bugs are easier to detect but this
is very slow.  You can also use KAsan to detect use after frees.

    1446 
    1447         /* Check that the rule has been freed: tricky to access since this
    1448          * memory should not be accessible anymore
    1449          */
--> 1450         KUNIT_EXPECT_PTR_NE(test, NULL, rule);
                                           ^^^^^^^^^^
There is no need to test whether rule is NULL or not.  If it were we would
already have crashed.  This isn't a dereference so it's harmless.

    1451         ret = list_empty(&rule->keyfields);

The list_empty() will dereference rule so this is a use after free.

    1452         KUNIT_EXPECT_EQ(test, true, ret);
    1453         ret = list_empty(&rule->actionfields);

This is a dereference as well.

    1454         KUNIT_EXPECT_EQ(test, true, ret);
    1455 
    1456         vcap_del_rule(&test_vctrl, &test_netdev, id);

regards,
dan carpenter


> 
> BR
> Steen
> 
> On Sat, 2023-03-25 at 10:35 +0300, Dan Carpenter wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> > 
> > Hello Steen Hegelund,
> > 
> > The patch c956b9b318d9: "net: microchip: sparx5: Adding KUNIT tests
> > of key/action values in VCAP API" from Nov 9, 2022, leads to the
> > following Smatch static checker warning:
> > 
> >         drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:1416
> > vcap_api_encode_rule_test()
> >         warn: 'rule' was already freed.
> > 
> > drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c
> >     1406
> >     1407         /* Check that the rule has been added */
> >     1408         ret = list_empty(&is2_admin.rules);
> >     1409         KUNIT_EXPECT_EQ(test, false, ret);
> >     1410         KUNIT_EXPECT_EQ(test, 0, ret);
> >     1411         vcap_free_rule(rule);
> >     1412
> >     1413         /* Check that the rule has been freed: tricky to access since
> > this
> >     1414          * memory should not be accessible anymore
> >     1415          */
> > --> 1416         KUNIT_EXPECT_PTR_NE(test, NULL, rule);
> > 
> > Obviously the comments say that this is already free so it's going to be
> > "tricky".  :P  What's happening here?  This is to test that KASan will
> > crash properly?  Could we put that in the normal KASan tset directory so
> > that we can ignore those deliberate crashing bugs?
> > 
> >     1417         ret = list_empty(&rule->keyfields);
> >     1418         KUNIT_EXPECT_EQ(test, true, ret);
> >     1419         ret = list_empty(&rule->actionfields);
> >     1420         KUNIT_EXPECT_EQ(test, true, ret);
> >     1421 }
> > 
> > regards,
> > dan carpenter
> 
