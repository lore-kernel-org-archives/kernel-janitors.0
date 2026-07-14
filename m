Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC963EC2EF
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013560; cv=none; b=DVcPvQDMQYd6/nFqNEKUKPxYtxye3MsPSuuCYqSP/zcMmuILNKcDaIkazHqXYeYmg2BLp7vaA/v/Et5Bm9cob7/zhyY+iZIp4XGOsUs57cor0OtsLvmOBhyqPXQAO2v7NzADp37vkhtwDLIZ1QQeuo4+mZwamcHO8WBf1ULBVG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013560; c=relaxed/simple;
	bh=kIERie8dbqx2+eAvdsr037DRwXWzmtXALWanJlNJzi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7ubf4miLvLUW9dwUDe8i0410DS8jHSJiOjmWj3BxEd+/KYdib2vjYdZyINkQ4JWmX4Gi6FelYwvGjQFyXZ9RE1zuWRq6jARP9fPfoz20FXM8Ab2/MGf10B+NQpTuN779pyp7lYEuYnepe26gPaBqEtXKf1vUj5FIngmv6KSbD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9Ty8bRM; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9Ty8bRM"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6a375ba035eso386466eaf.3
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013558; x=1784618358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lycI0z8Y1t9+PubOdFL76Fa/oKSxmR3LtUe6RN9X5A=;
        b=l9Ty8bRMZ40fguL72C53R45aZma+3XUfdp1+oyWyLdLSpl6D4C19CO5zGNDenqXBA6
         BJFBTqlnwiQDe2FZZQEI+7POWvE/QpgaJ1FVcxqoR5JwpKq4hpWIMgDL2RVl5NTZwQtD
         FhySSE6dSng+C2FsveUkpRjryk2W9p523f9Jf2s2GtNcV8i6NxDR1dbviFrnE4dCc6uV
         EAONsTw/CJyvOfMrS2OOF2uzbr3/uCExtYIplMQ8/CLOknMYtaZHhBBmcSriFVVDvHgZ
         W8rkDjs7oieEilvbNCfz+YasMoZrTdAGQlerxfioFmE7PTPKHf5kelbKLHDbF8yXQO32
         UiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013558; x=1784618358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/lycI0z8Y1t9+PubOdFL76Fa/oKSxmR3LtUe6RN9X5A=;
        b=RUIBMqcvgPfefQ4lMOH53TXZf/dbROHOcoI62COkEWceESij5WJ3/X8x2FV1ERfAUQ
         mWhqU9Ej89MZZj3VeyAGFJkiJ2CkWzhSPCA9gALzpv2D/9tPznM5P2GPUF60gYWtUr2v
         YY1DhCQ9Ex3ZIopMHgljFHOWjQ/A87HGqO7/EoJ3A6kLmbVvPyTPyualPbCUpGuZ9JYD
         cL5KAXOviI8lLQrIy9+rE99swwzf2RGBly9c84aRElRQyAHzPfllRL1SeLydOK8ixJfr
         QR/FnXDn3O5qTEyuezqbrYi2tnTr+ZVjBH9J5Nfol8I2CNheyx7QWBS0Gq6rz15RT2MZ
         vDSw==
X-Forwarded-Encrypted: i=1; AFNElJ/yX1a2mcOkSnTE9m5NgXB1+yt+2boqE0Kfjw15XlTja4R/X9weQ2RNVmQYGXU3y+8Cb5m3w3Q6b5MO5DTiUyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8dnSWzrAWkxBvUhvnfd4PbTrKMXD+92EneKDAYG6AL2Vo3/l
	ytqby4fQmWgO78RB7PrsUVJ2TubW3dUQ06qG8S1Kb7iIlAHnJnUsTjuq
X-Gm-Gg: AfdE7cncv7Lsi0KJx1rzb2X/DN2WQj95s/PA0lVj2FgYd+D4NE3R9GF6e2PJcm1maEJ
	zLK3On2YkedXl4MnhaFn60gcu5x8YegkY49AFNW/tvmCa4bqKVG5VJYqGyWAtguftBxpxJNjocz
	4CrxGb4ei1uTeUJKZg1JH82HKacOLZFW40x9T/udEKqwBpiFGGBuHVdA3r2URAlyF2wdry4NNPw
	ACo1FeHmaR90aJyc/p4Xi/iJM7gaMolXYQDDftSKFFHzuzNCvblTX3aMuKvMpxnQPMJVccMGdhI
	papDRMk37E6sBDB3kdngmfIOYgkaHNbjWpd3Pf4v5aN46n1WFj0aTA3G8yfROvI6iGcsR+EJPxu
	HJiIpFiYzlolRa2KWB8PrD+kFzkRNhS2EfNHDTkQ1bmuQ9zU57xxQk0lk+aSfFK+vfo+OL9C00T
	834Xuq
X-Received: by 2002:a05:6820:4cc1:b0:6a3:916a:1d26 with SMTP id 006d021491bc7-6a39a8561bemr7965231eaf.61.1784013557982;
        Tue, 14 Jul 2026 00:19:17 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec14489139sm6783167a34.5.2026.07.14.00.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:19:16 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:19:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, ceph-devel@vger.kernel.org,
	Alex Markuze <amarkuze@redhat.com>, Helge Deller <deller@gmx.de>,
	Ilya Dryomov <idryomov@gmail.com>, Kees Cook <kees@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ceph: Move a variable assignment behind a condition
 check in __ceph_remove_cap()
Message-ID: <alXi78mFuDLaVQ4b@stanley.mountain>
References: <5010d7d4-e321-4999-aca6-1caa040f3037@web.de>
 <bd15b4d5ccdcf01a8730380c4d974afaab2c782a.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd15b4d5ccdcf01a8730380c4d974afaab2c782a.camel@dubeyko.com>

On Mon, Jul 13, 2026 at 03:10:40PM -0700, Viacheslav Dubeyko wrote:
> On Mon, 2026-07-13 at 13:35 +0200, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 13 Jul 2026 13:21:29 +0200
> > 
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the function “__ceph_remove_cap”.
> > 
> > Thus avoid the risk for undefined behaviour by moving the assignment
> > for the variable “inode” behind a condition check.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Fixes: 38d46409c4639a1d659ebfa70e27a8bed6b8ee1d ("ceph: print cluster
> > fsid and client global_id in all debug logs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I have explained to Markus many times that these are not dereferences,
they are just pointer math.  So the original code works fine and does
not need a Fixes tag or a CC to stable.

And then Markus responds, "the C standard says we are not allowed to
dereference NULL pointers"...  Which is true, but again, it's not a
dereference.

regards,
dan carpenter

