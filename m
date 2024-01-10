Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E58047A7C
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="loUTok8X"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40d87df95ddso41797945e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 03:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704886172; x=1705490972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7YcUyivaArKNN7P3cpT7zTW5LfFylXidvbcNKW04c4=;
        b=loUTok8XGdWBTQf8ZbLrJbAuquN+QJoEjscbGSFuda+9l8XuQCm+AyEClF+KVvvu7U
         CL0v1SEceZMHCiP6hbKtPnoHBCTknzxVkf/C3gkX4LuvvtXPs0tcTGXHX8A2A1notEd1
         +u0/PX9Ke96oAYAQTw6URuFBqzHsovs8aPvlvHhLqIzYpidkEm1l4HACYlBR6MH1Q8BM
         F+OSplJJmj5Ty0P+ideAXkGGEiQSpsKz3pZW/FXS1NkChVUNDMzgnJxDV/P+4r21QOrz
         ykEbV4SCYu3KCjNXnoxIBNLlSPoYlKlwIUdaxQ/4qTOTjgswH0NF39lgdGXT/csRWpOY
         kf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704886172; x=1705490972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7YcUyivaArKNN7P3cpT7zTW5LfFylXidvbcNKW04c4=;
        b=jIvrNVgOYUGAOZMp8l0BkHNt+4NbxoJg6No91cjRZYxQ3pJctgbReRFDW1ceBj0+9e
         9tNdUur8nWn22z+/ZiJgwFLAaqYxaBrizQ79QYKd2b/MJF/VJU415Qa65aDghFH2yMeo
         zwnS5nYHuAUlb2Is0i1fA0UyYPEq0/7L8N5bycfzLBaahEEC4ZaqJ+nOCWbINgk78LCN
         vZ6lUyFOSLvXSASoN5GSW4QUecD+nrgEK8vIAYP27h4HDHBqsZ0KfgfL2I1zaoc0wSGV
         ewu3GvQo7m49bV1i0TDdVqxBSU57tEwPn9asqD8uiBZBO9Go0MOWC+qs4ARVBYc8OLit
         Z6aw==
X-Gm-Message-State: AOJu0YxfBEVs2uBVTkHOwtiktv4g25Q1rrYxNt4Jsu4+kyEZqfWI6QCS
	IpChSTERXndFgWd2e9QVoYoPYa8s4tjPZA==
X-Google-Smtp-Source: AGHT+IF2nJ1xq0LDh1t59DRO9W33WNdLdKgnpYcZygX3CtNk5YRiVYl99gmUl7qgzZajS3alVpAKTw==
X-Received: by 2002:a05:600c:3113:b0:40e:532c:7cb8 with SMTP id g19-20020a05600c311300b0040e532c7cb8mr249857wmo.40.1704886172500;
        Wed, 10 Jan 2024 03:29:32 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id az10-20020a05600c600a00b0040d772030c2sm1882105wmb.44.2024.01.10.03.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 03:29:32 -0800 (PST)
Date: Wed, 10 Jan 2024 14:29:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"cocci@inria.fr" <cocci@inria.fr>
Subject: Re: [PATCH] Drivers: hv: vmbus: One function call less in
 create_gpadl_header() after error detection
Message-ID: <f3c9e97b-f348-49b0-b9fa-9b519d99d2b4@moroto.mountain>
References: <6d97cafb-ad7c-41c1-9f20-41024bb18515@web.de>
 <SN6PR02MB4157AA51AD8AEBB24D0668B7D4692@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157AA51AD8AEBB24D0668B7D4692@SN6PR02MB4157.namprd02.prod.outlook.com>

On Wed, Jan 10, 2024 at 05:41:00AM +0000, Michael Kelley wrote:
> From: Markus Elfring <Markus.Elfring@web.de> Sent: Tuesday, December 26, 2023 11:09 AM
> > 
> > The kfree() function was called in two cases by
> > the create_gpadl_header() function during error handling
> > even if the passed variable contained a null pointer.
> > This issue was detected by using the Coccinelle software.
> > 
> > Thus use another label.
> 
> Interestingly, there's a third case in this function where
> "goto nomem" is done, and in this case, msgbody is NULL.
> Does Coccinelle not complain about that case as well?
> 
> As I'm sure you know, the code is correct as is, because kfree()
> checks for a NULL argument.  So this is really an exercise in
> making Coccinelle happy.

Coccinelle is a kind of tool to search code.  Markus has created his own
search.  It's not a part of the standard Coccinelle scripts in
scripts/coccinelle/ or a CodingStyle issue or anything.  It's just a
matter of Markus prefering one style over another.

regards,
dan carpenter

