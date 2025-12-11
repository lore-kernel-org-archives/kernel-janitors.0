Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9CA2D47EE
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Dec 2025 07:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765439156; cv=none; b=irlKlT7rLQ5R2fmTOKGXJLv8DCnvlPHJiTIRPh5SiPyb7nMiw9sC2lMXxlSz02LH7tfQKFawZPLlAr9sfvi+6Q+Dv+D87lEG5IOtMtLMQVZoKs8fnwsmHDMsZ+jYcwCksBzR6i/8NmBNlKo6LaOFTCGL+xkXy2mHcesFibUBR+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765439156; c=relaxed/simple;
	bh=9mvg3H/c8i6Vw6drMjILUPrnDLVQ4fS3OBd1K9POmt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaRxRupIhfjxEPxmaXKTA6qvcF4zXW1otJ9AgybtYdoL6uRgtW7/zRelQJw/0x/wmI4aF3pSAbUiRW02MfIleIv8bcFNAjPJ6b7cS5U0cRlXYhzoQUYb+TrzSsEncI7eTCqqPinSTiFy+gofMNXdh9Jm2wTptxQFGy3QDvxxWsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JHBTkAsB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHBTkAsB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso6241615e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Dec 2025 23:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765439152; x=1766043952; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5PFu97mrs/j5hiZkT9fpEkRD8VCD4PVmKLSzKLxEz0=;
        b=JHBTkAsBs6CLKKp65u0MNvEQmof6eP7cSBEhmIip3P7oBLrJG+h1vgLgipmMeUP+0V
         M9QacK5AksgwkrNtQtewDCaL8GRYlMLEfsjLV1V/0av2J7Cd8KQXi0MpH2k8Qf7LIJrr
         3O49AYU6AN3jjpOMc/dbHnJ/UuW45obE2LES6DNA5A7q6tvJ69v96WSMh2Vwyxb2J+eu
         2UUG7mJ9x5rM5Tq/5K4YO4+B9cOI86whdebY7no8M5lUPJz1mvAE0DRlkmKQutfViEuc
         5Ngdt6aIJx2m0qZPepCPV+n1Il5alkzZxC7oAHe6IAdnmIITLNXMaNQcOS/661q1WYqg
         WJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765439152; x=1766043952;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5PFu97mrs/j5hiZkT9fpEkRD8VCD4PVmKLSzKLxEz0=;
        b=De0FelbMyr7lC9OhsRf7Vn6Q7epo3tnQEzYwKNpkARiyH1w+zy0PE+aPQMLJAzHPZI
         6Txgt1YYyVY5QVY4rzNLmuPS3HVVgXaTK2z5lyh3g0P53wD/qfxIdbvORbQQ/e4w/EDf
         rQv/kLtMqgvpEpsbU+MVG5i5mx8Mw2EPtzXxYAR+JHh/Dq1Bfe1l5pCsp8qxTxu9TD8t
         KDQ6rstiWUvkuByVAfeNoannQ5Ej8QT9Aq8BSRLo8cosnWBqMVrKg+aR+8MH82RScLdI
         bGQBT1W8XFefT9xrdj7G/qzegE6SjlofcKQE0Fh0cXF75qT+DKPjeg0ebHAWLPlP6+ix
         FRvg==
X-Forwarded-Encrypted: i=1; AJvYcCXZc9tPW5PE61VLOulPYRoGR8y46bkqQALHWpeJwrIkf8WnMi4a8hKJHlEVs7pWOYebPz9PHSpenAFhMhvXsc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycriEPmkSie/x/R1V9rwGyWTryPRzhhRfKDvfJ57dON0r2LuCl
	CeyYFbX/f/QJOlQsXWD6Qj2Haaxp5YdSqCDSG6UvbYC1VMO/78WRf2PdkLBv+pM5xWM=
X-Gm-Gg: AY/fxX7h4edqCVUJrQh/NP16lrHYfbxgl6JxcWzO7gcYdhO9la4yUpYWHcqaxVrebXh
	8RsdysehxkV7N9rIyLHIk8iZ91mT67tOfGoIKWtQ5rgHXB9U2HlxD9eY8ElAqLADMoE2L2xpmsF
	RMJMs+4EfSUpJpv+Kjvv3edxyp/Xw9MYjDSmjVj79on7s+InmCaOW6wx+561i+IK0pbQTQ5RAE7
	N8ij4yf+5GwO8Cq8aHWBrxeiAdKB28DjXyPknw0Bo4gBRsVaaLuwQNrop/XDS52hUdHYdjJGsUk
	mq6z0VDUhH3NPZNm+GH5doXN/jD9g1kzFTMnQT2m/nsOzsLWWyBAWO42kPaBKsGJlP5O2e+jco/
	JesZOaS1R99Kw55BMBkJDQMC0gbkWTVErqSu0iX3JAr/npqmkwxXEjFxtN7JsXBajBCP6MkOBqg
	yVCDHjggjQnzPX8g7g
X-Google-Smtp-Source: AGHT+IF7TmgbE+Uw5kfOPicBWaMZFFELImJD78GoXEDw+MdgM7iNhig2tJYwraCIhaxT+6NDNvyhbA==
X-Received: by 2002:a05:600c:630e:b0:477:ae31:1311 with SMTP id 5b1f17b1804b1-47a8375a1f6mr46323505e9.13.1765439151697;
        Wed, 10 Dec 2025 23:45:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f8c145sm19182315e9.14.2025.12.10.23.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 23:45:51 -0800 (PST)
Date: Thu, 11 Dec 2025 10:45:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, virtualization@lists.linux.dev,
	kvm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] vsock/virtio: Fix error code in
 virtio_transport_recv_listen()
Message-ID: <aTp2q-K4xNwiDQSW@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return a negative error code if the transport doesn't match.  Don't
return success.

Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 net/vmw_vsock/virtio_transport_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index dcc8a1d5851e..77fbc6c541bf 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -1550,7 +1550,7 @@ virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
 		release_sock(child);
 		virtio_transport_reset_no_sock(t, skb);
 		sock_put(child);
-		return ret;
+		return ret ?: -EINVAL;
 	}
 
 	if (virtio_transport_space_update(child, skb))
-- 
2.51.0

