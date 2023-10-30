Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB916D262
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="news1VHO"
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47955B7
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 01:02:53 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5090cc340a3so2529476e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 01:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698652971; x=1699257771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CM1rafXiEjQh9z/wcIlVdv+q/HuJ7vkzwzwaa1ZRZv8=;
        b=news1VHOf2NTXGfMZSrI/mHvLiAnDd/jcCakw0LR9zjZglEp69pWPErNd4HWkxsHJ6
         DCilwNYC+FaAOqEa3akq2xf2XSrXaGfdVNZmrQUSQVZXRKnUOxyvf3+Kg53IeL9yHvcK
         CXsTMw17S6NeOiI2nV83fN6NrLbextcL7rxy6u2Spn9SSmvgT6NcaCfykf9URytaA/ww
         w0jWffNCjQw6R0qVOZPUbl4pTuLVFs/26IZ2sl0KzWqdUUyfmK7wD6YYBx+vNY+9upyj
         3LpRr4ru6XnxHwyPaa+5LTeScO5nkJbnH35mV3Zqn58vYa3Jko/MWONcO+i61hs5RBOk
         4gVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698652971; x=1699257771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CM1rafXiEjQh9z/wcIlVdv+q/HuJ7vkzwzwaa1ZRZv8=;
        b=NY0sa6sl111+kLpAmmaOay2tczhU4lF9DtvC+iB8MVNVRv8QK6nIc8EdORrS4jIyYw
         A55jcqroFEb2FDIeKLhcvJPlFu9lyZLuujDrbl/1GBAqD30VDmXHBzD7NC3UonUAZDxY
         /x7toGopQxztuXdINfKpSs06Ob8XbtCcdoagFwlN294s9BlFbJgeJxBJMtoDwE8wfkPJ
         og+gjVcaLKMsLil5UYmvhpe5nh2CKCn7neEr4T5OqWstVZPQM7RXxE5Q2W6u9ikKhPSG
         J5yJOV+bw8n9kthUq9Vsix54oh1t90uvmJVMvlwzYM3tAZuSaXS+cnIF4q9VCcSWgJXh
         sTPA==
X-Gm-Message-State: AOJu0YxzZpV/23CQMPCnkwpVlq/9WEFd2+hdXG1cNljcq1N9yYOFERUT
	Le9cAknvcolfYmw+VVy4gAJx94p7CGP7TwbMPqs=
X-Google-Smtp-Source: AGHT+IFlBT2lR7iH9+vrdj4AlOxYlwFWHp9VTaPuLj3iPhDeJHG5WAxcmSAqXVR9wa9A9YtSw1Cj+g==
X-Received: by 2002:a05:6512:6d1:b0:508:19be:fb2e with SMTP id u17-20020a05651206d100b0050819befb2emr8246693lff.58.1698652971461;
        Mon, 30 Oct 2023 01:02:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b003feae747ff2sm12070916wms.35.2023.10.30.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 01:02:51 -0700 (PDT)
Date: Mon, 30 Oct 2023 11:02:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: ti_sci: Fix an off-by-one in
 ti_sci_debugfs_create()
Message-ID: <1a85d4bd-7e90-4a1d-aa55-4d9070fdfc16@kadam.mountain>
References: <880aeea52f3bdde5e3e8843bbedb7fd068a58be2.1698565938.git.christophe.jaillet@wanadoo.fr>
 <6fa05bc4-55ad-4173-9af0-9db713b4d148@kadam.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fa05bc4-55ad-4173-9af0-9db713b4d148@kadam.mountain>

On Mon, Oct 30, 2023 at 11:00:59AM +0300, Dan Carpenter wrote:
> On Sun, Oct 29, 2023 at 08:52:36AM +0100, Christophe JAILLET wrote:
> > The ending NULL is not taken into account by strncat(), so switch to
> > strlcat() to correctly compute the size of the available memory when
> > building 'debug_name'.
> > 
> > Because of the difference in the return type between strncat() and
> > strlcat(), some code shuffling is needed.
> > 
> > Fixes: aa276781a64a ("firmware: Add basic support for TI System Control Interface (TI-SCI) protocol")
> 
> The fixes tag isn't really required.

Ah sorry.  It's an off by one.  Yeah, that's a bug even if it doesn't
affect runtime.  I don't know why I didn't read this commit message
better...

regards,
dan carpenter

