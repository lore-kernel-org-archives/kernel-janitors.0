Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5A379C6
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yrKrg8I1"
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1197DDE
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 01:01:48 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9dd5879a126so14369366b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Nov 2023 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698998506; x=1699603306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1zXBFSyu+yIRikL9eWtsBybNrF9k/ksn+RKfXyjT6o=;
        b=yrKrg8I1m1FxUp9kerXUIEpYp5S2gt8R8rOFzYOXlwX44TI9RgFIRQV0sypL6JTTTr
         VADWr5ojJP0KjW5kJkYfElQxky2iV4zkOZcMm1AhAoAp9J/GoJjSY1hTc2JAVlnDaRAh
         I59ZXPyppZ9fjC25Q4xI2rWOQoZabbn6Q6wbVgfIBay5EtD4X1S7tXzLML1WpUGto64d
         gjxqIKCelKlHSjUdHhdu36EGppY/HtOJSysjHYo3Zo0Qb5wbikAuGxnC2XS2tn+XeZ3q
         Hcqx+Dh1y6rJxIZEfqcRv9WSk2bpIE3noXYzLNoiOzzW+n8gRJsSCnEI1/o4ae719Ew6
         jzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698998506; x=1699603306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1zXBFSyu+yIRikL9eWtsBybNrF9k/ksn+RKfXyjT6o=;
        b=ngRUnMpbpdaUCL1C2nmbec1mVM/TaIHtYxfH5qopG6c5rYSqISFzBYOM9NAmM8xeMi
         aZSCkwIDpYym9eE/Ch7wBIMAEBGbrptNjMXeUF7t5EpayhGPzKDsUJ9Y3I4MqJDa6HoH
         mXaxNybA5ojPMbfUWX0TzMcfRPErpjW6ZDbWreAWd54vC7KN264IiVEVBTvBSH8EQ4We
         Ik/dIbKZt85NTAfYtqb6Rk1YIwUrVu3BDCPU9XyUK3MsoV7YjT1FQASlCkfD34VVvvR2
         DQt859EjckCTwG59hJ4q54GCViA8OutkvvwLRymgQ07/m/piWp97D4pFqiWZMtoOxmGL
         9uvw==
X-Gm-Message-State: AOJu0Yy9LRS09EhFnPJBT7HUlHQEfKrO8OwsRX/z5r6jYURROo3JF/JO
	ccm9ZjwDMT/ksDryyBI43bk1eA==
X-Google-Smtp-Source: AGHT+IHtBtIBc4diGeeXXxfuX1ftRm66frX+bQqPktKYCUcVsBXOS7oNLF6/Nzvh10NM2WjmBK1GEw==
X-Received: by 2002:a17:906:fd81:b0:9be:bf31:335b with SMTP id xa1-20020a170906fd8100b009bebf31335bmr6353605ejb.73.1698998506306;
        Fri, 03 Nov 2023 01:01:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906595000b009ad875d12d7sm611511ejr.210.2023.11.03.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 01:01:45 -0700 (PDT)
Date: Fri, 3 Nov 2023 11:01:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <c4d15d2c-8e15-43c8-8f61-e5b3db440d32@kadam.mountain>
References: <b9b0c0c8-6ece-466a-99e4-d49797f69957@moroto.mountain>
 <54940dc9-dcdb-41a9-876e-646a9810a22d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54940dc9-dcdb-41a9-876e-646a9810a22d@ideasonboard.com>

On Fri, Nov 03, 2023 at 09:46:11AM +0200, Tomi Valkeinen wrote:
> On 03/11/2023 09:39, Dan Carpenter wrote:
> > - #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
> > + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1ULL << 0)
> >   /**
> >    * struct v4l2_subdev_client_capability - Capabilities of the client accessing
> 
> Good catch, thanks! One would wish that the compiler would give a warning on
> cases like this... How did you find this?

This was an unpublished Smatch warning.  I have a comment in my code
that I didn't publish this because Sparse already had a warning for
this.  But that seems not to be true.

I'll clean that up a bit and publish it.  Thanks!

regards,
dan carpenter


