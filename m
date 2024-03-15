Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8E3D39A
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Mar 2024 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710515997; cv=none; b=oQPGtyevDWdDGVs7IQ/VS9le9mMnG0iVgbYocg6nKy08kneoWpD8zLOC2+WX77FQ7gZZV4ub+Lys181qwiUHrQAOO2RDCWZf9484mmO0wGjYetJ+vgZyyLpewJmuUjCuJzZ4+7k6RXTamjJ6/LuyCVKKc0vh15i74Bkop/jAa4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710515997; c=relaxed/simple;
	bh=QaC05tUrXNC1Ur9YtjvRNtf8LqxKxw+oAPglWAz8tCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ug6yCQ945bV9lG2CTw02HnjU9PZR9MqUysPZrC3NWNlkligKO2POYm/bSfuo2sIF9Syh+iezYJu3fsOhXpjshaCPC7Nv03WSjJLGBzV0enNbThtrNuWdJuOu6bGpDpf6oaae9PzGSkHtx8skQqnwXKmgt1eIxwt4R0HFi/+6LPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQ4TnUlJ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQ4TnUlJ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513a08f2263so2616664e87.3
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Mar 2024 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710515994; x=1711120794; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAvpJQRpeJXAQjzDt6UdJaEuU+2YQ9PxUCMhKYDwpY4=;
        b=uQ4TnUlJ2+Bnxx4rLuDpS+ClfUvs8uwKouJ1hfcy+/InzkH+LePNGoFrLHmm2t0lDM
         8XOj6psaiGq8Zb/m12oo04kdPqy2OC/Z+IuIhxal5UWnASPhV3gcx4KWJxqF16QTmJ3P
         whlr/BN+yV05LlkF7L1xCtaAQ6s4kOKtRzqPgLl0AvPe6uGGJBqK5z27o/1fNVaVWtAL
         fVhYEGgzuu7qMDI1fqxyIplCJOWUqdIJmI30vQrRUU6ul+t/PjyXk6XK6DxPc9vLZzEv
         fhNHCLVMcVn1w4+B3CD7PLX5I9UoulXRWmW7yAhEqEop9LnW5W4jEJzdAp5w70xm1TOp
         kBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710515994; x=1711120794;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAvpJQRpeJXAQjzDt6UdJaEuU+2YQ9PxUCMhKYDwpY4=;
        b=P5AyrLkGz7Zt8DMuy9h17w1/S9dnBWCEm01kAzOYGIxrDOQausXqOzTN1VG79y2uUO
         zP2uQb5LDzluybqBCv0l70wKLVQbm+e8c9GFt/xmjUFVxlkkLaHsJUBHzS2hw4ti2OZe
         k85MgwwuCPYBFdScly6qhL93QAc7XJiL4fIlr2YcrvJtBWVQkHU2+scF6o9UNj4X3/nk
         EegEzZrlRHpj0nZAW45I5HzIAg50/XoLCsKVPDK2wW3riF3spciYVvDnLVt7AiP+7GQy
         6XzzdhzOIsAPYtPBGD+qLIHEaUqD2d40T3nblK7xmc3r7kKv/qoJGOy1eQQMr89vaeOa
         YYkQ==
X-Gm-Message-State: AOJu0YwfdSUZ0JUa0lpPHMaUC8Yi/xI1A68D7+q8Ya3bUjabi+lHkCaP
	2FudFyRoFl8dc9KiS0SIFPe0irZKCbk0qAHUWr5lPo/XFK0Mvm9yRea90FW4mGI=
X-Google-Smtp-Source: AGHT+IF9vBI8OiDIGxYV57TQOlLNi1zeSJ5nAUwzpiUCGhLqK/xZM0BAmf62UP9QL6bIha70nxy3Uw==
X-Received: by 2002:ac2:5b1d:0:b0:513:c6d7:bc3 with SMTP id v29-20020ac25b1d000000b00513c6d70bc3mr3560307lfn.11.1710515993898;
        Fri, 15 Mar 2024 08:19:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p36-20020a05600c1da400b0041401ebb6bdsm2129698wms.38.2024.03.15.08.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 08:19:53 -0700 (PDT)
Date: Fri, 15 Mar 2024 18:19:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tariqt@nvidia.com
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net/mlx5: SD, Implement devcom communication and
 primary election
Message-ID: <84c44ab9-46de-4380-9e24-c0841ed3db52@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Tariq Toukan,

Commit d3d057666090 ("net/mlx5: SD, Implement devcom communication
and primary election") from Feb 14, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/ethernet/mellanox/mlx5/core/lib/sd.c:221 sd_register()
	error: 'devcom' dereferencing possible ERR_PTR()

drivers/net/ethernet/mellanox/mlx5/core/lib/sd.c
    206 static int sd_register(struct mlx5_core_dev *dev)
    207 {
    208         struct mlx5_devcom_comp_dev *devcom, *pos;
    209         struct mlx5_core_dev *peer, *primary;
    210         struct mlx5_sd *sd, *primary_sd;
    211         int err, i;
    212 
    213         sd = mlx5_get_sd(dev);
    214         devcom = mlx5_devcom_register_component(dev->priv.devc, MLX5_DEVCOM_SD_GROUP,
    215                                                 sd->group_id, NULL, dev);
    216         if (!devcom)

The mlx5_devcom_register_component() function returns a mix of error
pointers and NULL.  It's not done really done correctly...  Here is an
explanation of how that normally works:

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

mlx5_devcom_register_component() is not optional so it should only
return error pointers.

    217                 return -ENOMEM;
    218 
    219         sd->devcom = devcom;
    220 
--> 221         if (mlx5_devcom_comp_get_size(devcom) != sd->host_buses)
                                              ^^^^^^
Dead.

    222                 return 0;

regards,
dan carpenter
