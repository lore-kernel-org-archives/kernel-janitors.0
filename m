Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945AF12B60
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2hH8erk"
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C9C111
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 03:00:57 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9c3aec5f326so366092766b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Nov 2023 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698919256; x=1699524056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u0LcGLJp2nUFTt1mQ7QkcQWl/m98DtGflVjKV6EHC9c=;
        b=K2hH8erkD+CVMbqrhIf679PSA044P/V/5hSnCs8XnOWRTVBSAW8m+o6NKADcaVOPyE
         Tieq3A2sLcCcwTmcUXorDclKZ2pJS/jXusoP9/jZOBQA7K3NHPcXRsvNIW1gPRl+6/N3
         XqMtVssIkt9NUtiBNpsz01WHsg0eo4zGr0Qqwdqi2ITl37nRFLljq/FYaXBnj/BOMBLs
         bgvyX2JbRC23GJE7QN07Tq7uAwZFa6wkxqWE+XbXaWXtTOloGH1paZPWL/xRxt6WRVd3
         4Qea1zsQ8dIEmTwG/H4NzapQsgM8n1EDnyClCTWvam0NBCUWF5FnWAu0WeNSliuujKRV
         zrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698919256; x=1699524056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0LcGLJp2nUFTt1mQ7QkcQWl/m98DtGflVjKV6EHC9c=;
        b=AaIstBZKXUxX6qDvol60kvnVfMhBt+ajyxkNZRZOoyOHsUtQUipfAbf8F+yP60CdTe
         U2zfPuN1mp6ibTcZMkvKF//M/Q8SEehAchGpBzXZGrb72I/cgnGIqbQTEO8/4zKiOAKA
         Nx0xqfKVKMuFyypUdaMbA13g4PgGtkc6YLle9Mi60tfqLxXsJrMBoRVbpeHMOPN6qtzd
         BGfvk7MVGDYVeYKkCaCv3cnYAepPRzPKYgkUL5j1kd8mTQ6gpMbMjwQ3aJkUDqTiWlmm
         SHj1FVEONW0ReiA9FsVKz5M6t8MsAs0b1jfY94XXNApqrjzG1b7cbrOjX1DFmQEseQay
         tD7g==
X-Gm-Message-State: AOJu0YzOYEul5fAIb9fPCCdxtHWL8ES0yEr0Mk2qQmv3BroWPhH6coFI
	MvCyA63wnF9WJ2bdLgHmtfKEMFdC9Pga0kbdDow=
X-Google-Smtp-Source: AGHT+IEpU/ej3CYQUe/o1DvbFvmckpjAshkofsBTRaetWyZq+iS8hdM8yD/H6kzDdk6QF70Ds0Mvkw==
X-Received: by 2002:a17:907:868d:b0:9b2:b15b:383d with SMTP id qa13-20020a170907868d00b009b2b15b383dmr4786608ejc.11.1698919256473;
        Thu, 02 Nov 2023 03:00:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id qh9-20020a170906eca900b009c762d89c76sm934607ejb.0.2023.11.02.03.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 03:00:55 -0700 (PDT)
Date: Thu, 2 Nov 2023 13:00:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Fix an IS_ERR() vs NULL check
Message-ID: <eb4591d3-268a-4590-a0ca-a8a12c8efe5c@kadam.mountain>
References: <ee0d1f92-b0c3-4f4e-8e16-2aabd47a3447@kili.mountain>
 <536d621a-19fa-4d2f-8bc1-ca7747de7921@arm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536d621a-19fa-4d2f-8bc1-ca7747de7921@arm.com>

On Thu, Nov 02, 2023 at 02:01:44PM +0530, Anshuman Khandual wrote:
> On 11/2/23 13:22, Dan Carpenter wrote:
> >  	desc.pdata = devm_kzalloc(dev, sizeof(*desc.pdata), GFP_KERNEL);
> > -	if (IS_ERR(desc.pdata))
> > +	if (!desc.pdata)
> 
> Although this might not be applicable here, given the input size is always
> valid, devm_kzalloc() might also return ZERO_SIZE_PTR as well.
> 
> /*
>  * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
>  *
>  * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
>  *
>  * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
>  * Both make kfree a no-op.
>  */
> #define ZERO_SIZE_PTR ((void *)16)
> 
> #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
>                                 (unsigned long)ZERO_SIZE_PTR)
> 
> Hence should ZERO_OR_NULL_PTR() check be used instead ?

It doesn't apply here and generally you should validate the size instead
of using ZERO_OR_NULL_PTR().

The ZERO_SIZE_PTR is actually a really kind of magical innovation
because it lets you allocate zero element arrays successfully.  So
kmalloc() should just be checked for NULL because you normally want
zero element arrays to work without creating a special case for that.
If not, then check the size before the allocation.

The big problem with zero element arrays is in strings.  People do stuff
like.

	str = kmalloc(size);  <-- size is zero from the user
	copy_from_user(str, buf, size);
	str[size - 1] = '\0';  <-- crash

Better to do:

	str = strndup_user(buf, size);

regards,
dan carpenter
