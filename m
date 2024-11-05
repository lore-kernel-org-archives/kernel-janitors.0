Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC39BE4E
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Nov 2024 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730825144; cv=none; b=rjkQlSZw5RjgzIdQgcHt+BYsomOxvd6Jh54oj97fv4Q/QoXkC3+BogIxAXHR51TuOlUpz6GyFCG+0HLeRF50wxPvfgiAW71poVYmQUazDxJhNTFO4L/CNO3yQ7yOSFF1p2fX730Tz1RpUuyprmRM34kCsFXo46wFcKP0ueeUURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730825144; c=relaxed/simple;
	bh=GqxkKxfCepw+WI0L9oUkhsjWH1YFkyvLJN/ydsnKHRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVY2iKVQSxvEJgB3TkcHVbI6ZrmogUhj0jI3Aj0y+MyrACqEUUEqRXK8Vr/dLinUAAZTC4zVE8Y+QQX1YABsN9WTsic0ob8SoHTj8iDpDS7kKX5xvjZNscxC9mLV25i87zAnMDYKvYWcwWr6R8PsZc+B5PNNAUNIqyBRus4s7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4TRtE0U; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4TRtE0U"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f72c913aso9207552e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Nov 2024 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730825141; x=1731429941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eO2Rc2ylDy//zWsYbxaCN7+Jb/tGlO2igB2V28DpRFE=;
        b=g4TRtE0UaQxF3cXKTIoQnEz6iL0ZsjO1SmYLbveO8wd8Z7EZLGDpB2TA8D1jjMmovA
         fXiLo5KOZfGWgxRSNE0SBXD1sMkijhX6MTKYYF/IAt7vaFsiElaujhn9CxKqCfiZJVMA
         oBTV7NifJEoo0GidMxUe6Zwrv7wVTWqPCuqOx+wU7zOsm+AxdehwnvXhsYV6pk0+aRsI
         wGmlUS4M+gh+ciIJDyUp92M4rz5RnhH1bHWY7F5h3Fvl7i5nf6Ik3c5gejpvMeNJKS4G
         zIxyeYy6seDk9XuVIRa3E6nH+EC6uMuIHYP3sqMxEO7O45PN/A7O4KBQw2HwdcCeQpwR
         SdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730825141; x=1731429941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO2Rc2ylDy//zWsYbxaCN7+Jb/tGlO2igB2V28DpRFE=;
        b=GxUdpxZukuCxfGyt1ZUeKcqjSgHUI5gOohpZFw70DMGi7U1K3v5WqM6gV1lad9uuKY
         Lo0yegYBfxEnPGvd7ifIt+pl7WjpENcxzlrzkQkKzIYbtVKp2K0Pc7UU7JYQehkqvW8K
         e/bs/QqgchNim/TJYtNkL3rREIQk/7vUVxLB9M2CnHnsKLB/OfzRc86CgENuje9AXFKG
         34ELjtGJTK2xkFR4kRrITi/5zwRWtilAXrk/NorCkXk1UK3xdWLIqp+W+T36TD5USBXv
         7dtWr9+2fMb+zltWNtDzj7kcB8W8FOcJvhFtwjfhu+8NAv33LtDvuX8SceXtyvNctEIW
         /CHA==
X-Forwarded-Encrypted: i=1; AJvYcCXK9oowuaJTuKPNKZyN8hrDP2BDw4ineVe1M48PEwP5YiaKvxaxGhoswl/baIpuHODEDlH/Y6iotfkF/1NodI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSEcqTb/68+5naTxjS9oadmkNhrYGU3sIkVfyqCUgHgMt6AVD
	tyNNpwgi+IakSnhktx+/TcjHPacSvsu+fipjNJIIHFYZAdfUJsWW2MNvNN1YjAA=
X-Google-Smtp-Source: AGHT+IHbbL60OFoSRKrDaKJLcmCLmCs0FTzW4o/g/NDSmkrMXRKBjyIAqB/wjh3gYIeBgf3U9lFeTQ==
X-Received: by 2002:a05:6512:1307:b0:539:f886:31c6 with SMTP id 2adb3069b0e04-53b34a18f24mr19234091e87.38.1730825141265;
        Tue, 05 Nov 2024 08:45:41 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d698055sm195385765e9.40.2024.11.05.08.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:45:40 -0800 (PST)
Date: Tue, 5 Nov 2024 19:45:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] media: xilinx-tpg: fix double put in xtpg_parse_of()
Message-ID: <372abe0b-fd67-4498-883a-7139632ed43c@suswa.mountain>
References: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>

On Mon, Nov 04, 2024 at 08:16:19PM +0300, Dan Carpenter wrote:
> This loop was recently converted to use for_each_of_graph_port() which
> automatically does __cleanup__ on the "port" iterator variable.  Delete
> the calls to of_node_put(port) to avoid a double put bug.
> 
> Fixes: 393194cdf11e ("media: xilinx-tpg: use new of_graph functions")

I guess the CI system applies this to the wrong git tree so it says
the of_node_put() calls are necessary and it can't find the Fixes
commit.

regards,
dan carpenter

