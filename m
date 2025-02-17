Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7F199921
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777618; cv=none; b=ZKYbGFPkz06ESM9zj469F/Z40YAv2QlatmDb81a6Dq4P+Tt7rH+IrJ0d1oc5Gayv88MWxMfQYUYIpKe5PpgEB9hDeZUCejoi+dwtGATj8l+edn+lY3dkbiXcfWHPKeM0meUuOm/hHIRPF3YMY/RLBGR8H5go0ulA6YsPokk8aFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777618; c=relaxed/simple;
	bh=zcM0c0V1GS3TZJGed3LcwXT+koAZctVBP1JWt1wC7bs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G6u48Dc656R6matR9VISJbdaBooraRuO6z1+J9hc4TAmF6brdxBH3VpXSfBxaywTx8GO5sEGVX6wKbFnqFXYTi0uO9SdSj0+q2VpBtuZNOTh9ZvlUdQ2M6s5HR47yqlCpga364SSb0+XpWc0/e29ITQBFO4SeXRVuIwIznaeWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAIbeN7y; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAIbeN7y"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb8d63b447so106301366b.0
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 23:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777615; x=1740382415; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4LcgUMXB/Wz2DoEL+bbrP94KZi1QyVcM8jrNwIU/TI=;
        b=DAIbeN7yi3FYa7O7TITI1BtUZEFdMsSqQR7IT8S3AuisRtxSU6zkig4Rh9LsplObPi
         fsJ8qNAltGfR0KqX0P56PX8aBqBh17uhah8GcPd3JSuLVvbRnBaG/CMsHFTUYThZAtGj
         kWEjb0FTaqcUBd8nEHSEck3dP8ZpMU+gPrEoFinQWt5Vnx8mn6f+1rB5O+Zv9g7jLDlD
         Y+EzHiOqBU2eQ+SMl8S7jBAUyBK6rfPAcC96G90bvh+Yy/Yy0aWc8yqTOwVMIMEP9yjx
         neKrFb3d5+nGNBG2CReMURnD0w2BPWmVG00dDbc5ZG0MVm96ur2NcmAUWXSny6QCQs4v
         9WPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777615; x=1740382415;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4LcgUMXB/Wz2DoEL+bbrP94KZi1QyVcM8jrNwIU/TI=;
        b=Me1zALdCSpoHdtYIP8O0gJ6yo5UaGqE9clghyIUaJf2UOb8ZtUMGFV7d6XvDfZZIVz
         /osl/hKYRbf5479M6xbeG9dm1GF2cuNs5RLIOcR/84n9Mwocb2bl13EK7JHgcbA/A7UQ
         i2l1pPan77zQCHWEMTfo9Tnt3gVBxH1fAJsOQD6nFQ/YAEGPNoQk+CUEdzdOFPt2ywGZ
         LAYGgexB/iRcER2cXk/+w7/fLwCHKTyNpJAo35+O9fkqKCXjHkeBaQ3/cafL1g9QToD4
         KfW3W366SXJiT/OBKk7sxfCDH5KUe/RtDZgpgFU8r6vfP4LbQf98eWdSd7gWO95Fv/c5
         bMsA==
X-Forwarded-Encrypted: i=1; AJvYcCV7/TMW7HpwerLOREJ9xNMD7bcauP394Ic26ucKrrfCznNkSU3bHnLvpfrruQlrIRSLa9uUfQJahqid1o15m1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLlvTTONJEEA9j9N688t9vMEIAePiQTsON3+kghDaJ9dn53JD
	x4fu0DcpqaUGYXlx1l/DiBKU7MvYn0/x1+L+L+JRgKpZTwd6OGYGZr3kzOHmE78=
X-Gm-Gg: ASbGnctPEIGPoZIuLatybGSoiZJ6n9GOnlh3Ek3Xnufc2lpqEGCdS+RaKP41oCBO3hy
	vS/D4YW8ybG6Qgf8Q1esrUdcTcT1dg+XqJOYl/CBvHbUriVipXq7rwZXg7YRevChm4nlzm1YdTz
	camq553r+4ImQ/OZtzZZKCofgWkRB1WF9G6QDSN912VB7yzAB3su03ZL2fgcPUflo2q6q5bIrsZ
	ZCWYB5nU8lUoIO/3Cx5sRxcFkStHjJtTc2EW6nFw0MvJF2yObffiBWtomPeKM4juhsyrwEaHtx5
	uEpM11ZTe4HZyC4O7MZA
X-Google-Smtp-Source: AGHT+IF7SQDPhS34NSoyAyl0oz3XF6hgO/dLFCbg4PL3cGhqcXdyTG7Koy72X0FHVW9/sFD79dcHNA==
X-Received: by 2002:a17:907:9802:b0:ab7:bcc0:9067 with SMTP id a640c23a62f3a-abb70dd72f8mr973363966b.40.1739777615128;
        Sun, 16 Feb 2025 23:33:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abba9657249sm41281166b.38.2025.02.16.23.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:33:34 -0800 (PST)
Date: Mon, 17 Feb 2025 10:33:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Olga Kornievskaia <okorniev@redhat.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
	Neil Brown <neilb@suse.de>, Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] nfsd: Fix a WARN_ONCE() message
Message-ID: <39691ae0-124e-48ea-8a1a-1a7f26423236@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The first parameter of WARN_ONCE() is supposed to be the condition but
it's missing here.  This WARN_ONCE() will only print the "xcl_name".

Fixes: 61b490d48618 ("nfsd: fix management of listener transports")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/nfsd/nfsctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
index 2cd540b26965..ac265d6fde35 100644
--- a/fs/nfsd/nfsctl.c
+++ b/fs/nfsd/nfsctl.c
@@ -2027,7 +2027,7 @@ int nfsd_nl_listener_set_doit(struct sk_buff *skb, struct genl_info *info)
 		xprt = svc_find_listener(serv, xcl_name, net, sa);
 		if (xprt) {
 			if (delete)
-				WARN_ONCE("Transport type=%s already exists\n",
+				WARN_ONCE(1, "Transport type=%s already exists\n",
 					  xcl_name);
 			svc_xprt_put(xprt);
 			continue;
-- 
2.47.2

