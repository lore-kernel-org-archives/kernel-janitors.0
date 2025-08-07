Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A72237173
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Aug 2025 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582415; cv=none; b=tXdSydfXpx+hQBJhB8YTOdF50o4M6V3aajwdFf+k6wcKQi4WAHvXQagBHDRDtrmruYJZcKGqJCGM1/craRW6RTxWXsqj7ONyw9oYgn9KeBnhjoDcmmEOHv/VhdIPRMEQBeCGjUWlBCiIT/36My9eDT63Eg5e8FTY/a4yCWOBn8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582415; c=relaxed/simple;
	bh=RWSUFmutF5H1/FKjQyNBNp48243c4XWd/AIkBJw9FHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D5xg/4WQi8bljJ0VLRkn/tVmrb1w5THqC4ElY/NpkqgX//C/qz1/GDuTknBp8iG1sudLMMFEDSY55tG7H34oZ4bjUMzzase082CS4rpopOWlL56m8myV7z8JnBpRfEajqufwoTnA0lbd+hmn3SiMPF0B+A0vMYVA/qrHaZJWzB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jd/wzFIB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jd/wzFIB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b78bca0890so567456f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Aug 2025 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582412; x=1755187212; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRVbxceSq1is4jn4wAx8DYPbwe+MFMCmmpw5YmLXyFc=;
        b=jd/wzFIBIyiDQrAICEEFDuB5ED5mPFrxuLjMAqAuz9MXnmUlkn47rdQgBiuP0ZqabA
         Z5l0NRIZBYDA5guoZCM2uA0QxH53FJdUpHbbBFfKXZtCGIJszun9irEyD7VYH8US39ZK
         xugDx787JaCnqpW57lZkxd1nUYYlsxuM4ifc2hoR5lEbvwtOs/D8pHCt6tBkzgcG4RmU
         uV1jwcriQuvhsmGja6E7sfqm2Q5NUU8N8LH5AWv7Pi3wsFxx7SKcu227czOfTMZk2xbZ
         qSL63VuLMmhLVYl/6bNX/CvfK7zC6HxiF8UPyZNNH6gnT1vqQ4unVweRP+rhZnKtanB+
         isFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582412; x=1755187212;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRVbxceSq1is4jn4wAx8DYPbwe+MFMCmmpw5YmLXyFc=;
        b=I/KAX56TdVckGpTjeLPvXepyBZnukIhRHpOwqmN19oc0OUjYCKeAOvR6fzg38B52xm
         RZR7AJy6LouD/zzQFp7WfWKz1MzXg7DMQe53F8lcNdR/95hlmO41oQueWIVYLwzYRAf+
         o+7PvK4H83FyVWPIMWYtgV/UxPkVKlexn59LntrwlpbDVkN+HWTC1tXyprn9b+GuWzQn
         d0Xc/f3dYjvD4Mwg2Z0mBSBkBQ/uK6khSqLuMXrOqVo69o4oI3qycOlFLUb6BAVgA5N5
         GPPD44FVnYDdWC8h7T7c1Xj1cNgZIrik3DyTkK5B5/ve12vTiRpbDxFL1rweGXJmCyCh
         Mdtw==
X-Gm-Message-State: AOJu0Yz0C9IJAAmCCHqaxQUsyOg6mmrjwfuWTE603ft3+p7LysWBC/fj
	YRxOtI1np4UcXxHoCnABRB8eACIhwCHFkXgKl7u2bq4TusGiOn7n9IYCaV05OH3LDlH+F+ltt2a
	Km7sJ
X-Gm-Gg: ASbGncviK4vgo3J+h3Df0hYAbbmxW6CTef6bvjDWx+GevadldLjmoU546KH8fp0U+4j
	hwaGQHqfliGLimvRG3BdxW+55XntH3OCN8pNEyy/DY8wS/Ls9XGXD2VcYYavknJoTgC2M4AfK/Z
	xI9WlhkQWlugvv2y899nRCcNssOgva53pWqko3fajNekyC0JaX3nGJavZt9832GDDVQJ4tLqtcy
	c5z5aoYtSDV6T2Q0r1j1xWQ199F4uJpbgebvF+hZEZnOQb9/8tNpndPvrjgVyHfYZm75teoiQtT
	J0UicvQmwfqaXcGLYiFzhfzY5h97orUZwIZ2PeOwUxktC/7/iYLkb7MlQHnfZ4RBcOUj4NFPvoW
	S7s2nIbmdeWeBMu9LgGRECK2BPYQ=
X-Google-Smtp-Source: AGHT+IEaz7bsBu/Iv74Glpb4rsHBLT5TI5TE3+FhvC4lsTHipEyTshLjeB0czUpcA0bGF+jsXXj1cA==
X-Received: by 2002:a05:6000:26c8:b0:3b7:8c83:db1e with SMTP id ffacd0b85a97d-3b9000c3407mr152713f8f.33.1754582411618;
        Thu, 07 Aug 2025 09:00:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3b9074sm26677573f8f.17.2025.08.07.09.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 09:00:10 -0700 (PDT)
Date: Thu, 7 Aug 2025 19:00:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alejandro Lucero <alejandro.lucero-palau@amd.com>
Cc: kernel-janitors@vger.kernel.org, linux-net-drivers@amd.com
Subject: [bug report] sfc: add mport lookup based on driver's mport data
Message-ID: <aJTNh2A3i7JazSet@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alejandro Lucero,

Commit 5227adff37af ("sfc: add mport lookup based on driver's mport
data") from Feb 15, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/net/ethernet/sfc/mae.c:1035 efx_mae_lookup_mport()
	error: 'm' dereferencing possible ERR_PTR()

drivers/net/ethernet/sfc/mae.c
    1024 int efx_mae_lookup_mport(struct efx_nic *efx, u32 vf_idx, u32 *id)
    1025 {
    1026         struct ef100_nic_data *nic_data = efx->nic_data;
    1027         struct efx_mae *mae = efx->mae;
    1028         struct rhashtable_iter walk;
    1029         struct mae_mport_desc *m;
    1030         int rc = -ENOENT;
    1031 
    1032         rhashtable_walk_enter(&mae->mports_ht, &walk);
    1033         rhashtable_walk_start(&walk);
    1034         while ((m = rhashtable_walk_next(&walk)) != NULL) {

rhashtable_walk_next() returns NULL if we get to the end, but it
returns ERR_PTR(-EAGAIN) if the hashtable was resized.  I don't know the
code well enough to say if that's possible here.

--> 1035                 if (m->mport_type == MAE_MPORT_DESC_MPORT_TYPE_VNIC &&
    1036                     m->interface_idx == nic_data->local_mae_intf &&
    1037                     m->pf_idx == 0 &&
    1038                     m->vf_idx == vf_idx) {
    1039                         *id = m->mport_id;
    1040                         rc = 0;
    1041                         break;
    1042                 }
    1043         }
    1044         rhashtable_walk_stop(&walk);
    1045         rhashtable_walk_exit(&walk);
    1046         return rc;
    1047 }

regards,
dan carpenter
