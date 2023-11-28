Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmawFOqG"
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A26B7
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 22:06:11 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b4734b975so12304935e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Nov 2023 22:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701151570; x=1701756370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqDZG9xlXv60WjgIbT7jCyTvnkgOn98sFBaOwyS4grQ=;
        b=PmawFOqGjBrJqL8ySoCSsxKShviFeZPzvPKV3mzJhewbAeVzQbFDgttS5xIdXCIXLO
         BW1KI/FBsv9kpdpEkzZTYvzdv6BJ9T8SV7gNicvkD0RRUphJkw1R4sFL3S5OiBYxasq4
         qfRviBKdgkK3ZPQ2R7z+8qmpImmz7HKRNtJKs8FO96OHSlEQYqxLqIWeMKpc+MmLEplY
         EpTVLv1oPYw2BqFCeZTngT8Uvyn0F/DpkfSUUqu9er96XN1XTFMxkjc6nY3RJawolpij
         WMmC+UoGgz1hYwUzwh0VtvuwNjT8FRqAsITzkF05Q1TRfLeFyAEO2TRL9YRXFC8u+QUK
         29SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701151570; x=1701756370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqDZG9xlXv60WjgIbT7jCyTvnkgOn98sFBaOwyS4grQ=;
        b=MKm+s2sxsHLXjSzXpaT9j2pBhtJLhxktmHchLwhTjNrdYBxdN0F5KQM4eglH5gtQjb
         hl18nkBBhg3Cd14e442hG04rvfeSm7MljERwEXwdvXWCy8WK/8gXj+HIPmo+MKgLHoPK
         uyqr3foKk/XYodgXg0ED9a+sJXk6RzAPnYGSg6S4AYDt46/QEGK1qpLnnKP/dn/kf1Ka
         P2P/17DQ452cnFDF4DJuFzelLzBeebf/+bDNmusOXYFweoK49xrgnoO+FZo/twRHW+Xb
         6jfa0l3rGaKJ7FEC7aXzduvNfRzxJaL02aeSQKZsAYYKeLg3nqWyyRem8OwcpPnOZh/C
         yNrA==
X-Gm-Message-State: AOJu0YyS0JWqJ3B6pnEkj+QkFYCZV42ShxZCm/sU+eO43BHj/eG3F9Il
	ZBkKcp8KYbCB9tmK+/gdnf6+a8s7xq7lks2j2cI=
X-Google-Smtp-Source: AGHT+IGff4oeXXsg9qhz9anR4cuTUZrTAHFxG1uxfVWjFPmd1JjYRxLfxrLHr9fsz2t2GMUoCEUvHg==
X-Received: by 2002:a05:600c:310c:b0:3fe:1232:93fa with SMTP id g12-20020a05600c310c00b003fe123293famr10525180wmo.22.1701151569895;
        Mon, 27 Nov 2023 22:06:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a15-20020a05600c348f00b0040b33222a39sm17141094wmq.45.2023.11.27.22.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 22:06:09 -0800 (PST)
Date: Tue, 28 Nov 2023 09:06:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net] net/mlx5e: Fix snprintf return check
Message-ID: <cb12b2dd-5544-45f2-bea4-969c0134719d@suswa.mountain>
References: <d17868ea-cef9-4f8c-a318-9f98b8341f5b@moroto.mountain>
 <877cm3826e.fsf@nvidia.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cm3826e.fsf@nvidia.com>

On Mon, Nov 27, 2023 at 10:46:17AM -0800, Rahul Rameshbabu wrote:
> On Mon, 27 Nov, 2023 16:00:53 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > This code prints a string and then if there wasn't enough space for the
> > whole string, then it prints a slightly shorter string.  However, the
> > test for overflow should have been >= instead of == because snprintf()
> > returns the number of bytes which *would* have been printed if there
> > were enough space.
> >
> > Fixes: 41e63c2baa11 ("net/mlx5e: Check return value of snprintf writing to fw_version buffer")
> > Fixes: 1b2bd0c0264f ("net/mlx5e: Check return value of snprintf writing to fw_version buffer for representors")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> I have already sent out patches targeting net for this on the mailing
> list. That said, thanks for the follow-up.

Ah.  Good.  I hadn't seen the earlier discussion about this.  When you
said "follow-up" I worried that I had reported this earlier and
forgotten about it.

regards,
dan carpenter

