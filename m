Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FE7210EA
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c1iFOr9T"
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989A1171A
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 08:01:07 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6779fb43e5cso20147926d6.2
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 08:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699891266; x=1700496066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qoo4HeqyB8XJlWsHMhO4dBiMIsId95k48Rfp0Zw5T3s=;
        b=c1iFOr9Tf5P/IiChw+9CHyFh3TPN/IwvTuYeJ0wp323FBnklPygAmCY0YIZVHhDQ1r
         ZxKpTBNLPDpk/EdIHk35UZ/ObgxvnUDRrnXFb6Jr2HjcBM3NNg4LaYBk6aTK5IaNZZ8I
         AHqHGENhQK8h9CVNhY0cvyFWPJd6yZhQMuiYDKXa86gzVl1TN8NzCT1I03B8p4+aUc+4
         1FmRIVMbhD6O9Ey9XWE4nKXPuRutEU/UyC4KVUVhTZ0g+uDPsvpXi3Jmy3uDUQoUVRjf
         tozwJmXqVOL927wzy4w49tDmOfaN4mmMSxaf67duGUDEe94dDSE8tQvNa66myU4+g9xw
         W5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891266; x=1700496066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qoo4HeqyB8XJlWsHMhO4dBiMIsId95k48Rfp0Zw5T3s=;
        b=SCL0m7UM4hd+8iZ4D5eZKOKMgGu0+FnssotLZzC6b1N9TphI5ic6Cr0RCGLB+d627H
         ECxtqOX3zRN/aAR1h7zvu6DdzR8JtdiO36yqz/Wut6H7+ftIEkNC1yCiBObLjWEAL//B
         TspUIa0qVlFShXdHjW444ctvPLMDdkYz1ZUh4exSS6C97ix+xh4H5f7sDWL0W8FHqm+q
         npkReeUj7aVoP4fOfzFL03zab/VJe1wAKFg6feXcOXBIjsOzuSWWVTvrwdRIM8LHPfOF
         FOZ1Cl5FGBaupUMNJrb+nfNGZat3vEFGPECcaxiJR6vVdeF5vVKusxGQvO3jFm0YY9hP
         D7qA==
X-Gm-Message-State: AOJu0YxOHWrdxif713OBoaVcfaoS6B2xKzahDWxdBTO5HgIEyVwY1Wbz
	9SDj+QaARHxH5ff2a2vdcISLkA==
X-Google-Smtp-Source: AGHT+IG5zJ5b6dVPypoKcfuICu/un+SYe6KNcnPElYEe5tHaxVY9lQoNx4dz5v0y9ZW2DHWkXiOg7w==
X-Received: by 2002:a05:6214:a94:b0:66f:bb58:c150 with SMTP id ev20-20020a0562140a9400b0066fbb58c150mr7312476qvb.56.1699891266772;
        Mon, 13 Nov 2023 08:01:06 -0800 (PST)
Received: from localhost ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id cy20-20020a05621418d400b00670e7ae4964sm2153685qvb.91.2023.11.13.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 08:01:06 -0800 (PST)
Date: Mon, 13 Nov 2023 19:01:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, error27@gmail.com,
	vegard.nossum@oracle.com, darren.kenny@oracle.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/4] platform/x86: hp-bioscfg: Fix error handling in
 hp_add_other_attributes()
Message-ID: <bd9e80db-a80f-44d1-bcb9-a14ec0abc64f@suswa.mountain>
References: <20231110142921.3398072-1-harshit.m.mogalapalli@oracle.com>
 <20231110142921.3398072-4-harshit.m.mogalapalli@oracle.com>
 <211e6c1e-9bfa-ac29-b6ba-e198c4f36688@linux.intel.com>
 <fb97e3ea-1bee-4d7d-a8d4-dd76107f75ef@oracle.com>
 <1b58df2d-b444-ddb7-7533-9911d35f8f7@linux.intel.com>
 <c3b821fb-5df1-4c58-99bc-f3e99a6d1d94@oracle.com>
 <a0b5d36a-aad8-eaf5-7241-85d1c874ff8@linux.intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0b5d36a-aad8-eaf5-7241-85d1c874ff8@linux.intel.com>

On Mon, Nov 13, 2023 at 04:15:50PM +0200, Ilpo Järvinen wrote:
> This relates to the 2nd problem (missing kobject_put()) and will be 
> covered by the other patch. Don't try to solve this in the first patch
> at all!
> 
> There are two indepedent problems:
> - Before kobject_init_and_add(), kfree() is missing
> - After kobject_init_and_add(), kobject_put() is missing

It's the same problem, though.  The attr_name_kobj is leaked on all the
error paths.  It's just that it needs to be freed different ways
depending on where you are.  To me splitting it up makes it harder to
review and I would not allow it in Staging.  You can't fix half the
problem.

regards,
dan carpenter

