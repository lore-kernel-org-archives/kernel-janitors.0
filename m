Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC017C7BD
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Nov 2024 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323293; cv=none; b=vFJWPqjlfRRVB2f4zv4UPFap6Bo5MEktm6BuxNQAU3JAu3FUaD4T4vt+IWozBdaUmStgtfWftBnBNRwNNbGk0S4z68ocDjQx4KXoLFqUlONuyRzu+Fea67Ge5Oka8Yj1uqFqWyU0IdqHLJXDJBl4Pq5HrzuESmlUwn5f+jup1wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323293; c=relaxed/simple;
	bh=KrzJzC5LjIibjn2LH2QxndnXkbjvaFOu7KX1OY6Y2S8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLexZsX7oKrySAfKyHR6Y57UAEEFtos8cxr97DlgvU5CSF90eQtnJQCUuvickviQrp/8wvZURKkcZelDeFOCbJVhQuwa9O/pIjP8u0jbP8fl/xF6EWig8fgdn1pI0U0ARo9IMt2e0tQiWjACNxgH9ONASKrhFCTcXJU6EovwhVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lsVs5Ns7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lsVs5Ns7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso179496966b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Nov 2024 03:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323290; x=1731928090; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaOpQCnb58xwQNpZJwrt/dM577zB1AHFFgREUTf53Ns=;
        b=lsVs5Ns7v6s2hgGqNxi4GsbiwNcoUmoIQP60jsFv3r11zjG8IIXMXj481uoCNReRBK
         VAYa0LHFURO/l7Ip8fHRNsf1YSSiGUG3RrmhHCmfkY/GBIDJ1Xv/UwijxZFNMVUmsxFo
         93ZctszrjbbKfYKblkvcJNAf82w3MVB9dk67sdPHrvNGXIgbP0vfEgKmv77MgWfZeWjL
         uQ5MDLDQ1XoMGMMJwKpBpocZ63ar3rFTlMSzLjkzTpyseQwF7KzerFTUSES9T9MNnAmL
         YgnYcMptPu6dtMmJrm5YEv1u83Nbowu3DeHAAsXNYL7VERbNNoVRW4eVtXHfCRD6PK1a
         DedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323290; x=1731928090;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaOpQCnb58xwQNpZJwrt/dM577zB1AHFFgREUTf53Ns=;
        b=rEYsX3nGbrVjRStBvRMPzxYifCrfNalR6kFc6Q3m3O+x/f7nCmy6M99zHIa7HG89gk
         liuHrxmqEYDuMmesIwqoQvko5IE5FG9vtlYmJou+qMPSvjOAX2gdOK9tWeK97e0WbeN9
         vLwhsFfW3dRqkXjCqmhc3etRS2OiAgW54FTj+bFj+pd/bTeVk6Y3F0QU/0IDtGoKfmvN
         7XXo5VMMEpkJnNWOP6LBWZV6e2VhKSxAte8bZ2fXxDj/fc7vO0lhdghDVnaEGlcIwppk
         dgXnP8Uzn12UCiKqNUNe5J47e2e0MxRRcnYp6iUkE40q1WE8oZjNrH8jXibwjsdxO7Tu
         Uq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOYH7f+QWjS1+WLfHqVGSchVz+Mw1G2CXP5cvozfdQ29MSk/1Yfqz4QT8O4dSFVNV3y+NjtlheR6ESTSY/coo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCGbbKY3sWh0HZv5oa6EFqv9AOXNhP1p5mJL9vID84k3GUS1Vb
	lWj+tzLtO53qo8exGwF738oJCbz0z44W1lQdRcG06UMwo4hU6LC4eVPP2eZKcP0=
X-Google-Smtp-Source: AGHT+IE8zTmpxJbeHHX6TsTo02EB6CL9dlS72DZFJARMZpcutHBxnoMI2RjnZgYXTYNZ3xGbE2kN8Q==
X-Received: by 2002:a17:907:3fa2:b0:a99:5f16:3539 with SMTP id a640c23a62f3a-a9eefcebbd5mr1287269866b.0.1731323289768;
        Mon, 11 Nov 2024 03:08:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0deef4bsm576319966b.138.2024.11.11.03.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:08:09 -0800 (PST)
Date: Mon, 11 Nov 2024 14:08:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ajay Gupta <ajayg@nvidia.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Haotien Hsu <haotienh@nvidia.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: typec: fix potential array underflow in
 ucsi_ccg_sync_control()
Message-ID: <c69ef0b3-61b0-4dde-98dd-97b97f81d912@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "command" variable can be controlled by the user via debugfs.  The
worry is that if con_index is zero then "&uc->ucsi->connector[con_index
- 1]" would be an array underflow.

Fixes: 170a6726d0e2 ("usb: typec: ucsi: add support for separate DP altmode devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index bccfc03b5986..fcb8e61136cf 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -644,6 +644,10 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 	    uc->has_multiple_dp) {
 		con_index = (uc->last_cmd_sent >> 16) &
 			UCSI_CMD_CONNECTOR_MASK;
+		if (con_index == 0) {
+			ret = -EINVAL;
+			goto unlock;
+		}
 		con = &uc->ucsi->connector[con_index - 1];
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
@@ -651,6 +655,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 	ret = ucsi_sync_control_common(ucsi, command);
 
 	pm_runtime_put_sync(uc->dev);
+unlock:
 	mutex_unlock(&uc->lock);
 
 	return ret;
-- 
2.45.2

