Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27023959E
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Apr 2025 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801798; cv=none; b=N8suPldWXOOblhf1RG75q6GHbWUz5s9V02Q9vN1E91upX5kcQDAxePLpzng7cH3Xe7mwSJZOZCotZGMUbnkk+Vl4egKno+w4uffyafixN3R2IQe3BqA5ineGw5sG6tE7qE9sy/oqcjNSHO/ctbkaGg7u4AaBKW+GYIDVYDO2Xqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801798; c=relaxed/simple;
	bh=N300ZpabVRj6F4flL8Lfrs8xgF7O+jgFOpCvVDz4jH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uYpJaLqYJwn2e6KLtXsGz6rqBXXr4NbV2Yq/OQooekq+X8YdXs5OWxcvbzGLx1PZfe9NcZZ9efE/XG/KiEUhG8iTjPEm/b4S34ezlsGWbqnEw1hafIvy4v6ofos0UUcFLVxHJV9mJJakOMszJkhhY/HD2Xbf7ZaHzE+SmdcnJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DuDwEREC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DuDwEREC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so5879116f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Apr 2025 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744801795; x=1745406595; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUVn1E+5MASZtQAbRE/tz2lbT/kj3f2AwNu2uqycOxQ=;
        b=DuDwERECZX0nUED+9+NujIw+A2beToU3fyaa8eXcft6lO+jp+kPOgPq7F31HXa7l9a
         XPM93rbFlwG16nQAv/+ng4suDAKiSkD3/CfNow3+YYjUmY3JJVEN80pfjyk5lDCkBwkK
         G5Qu66G70QhKi4ttbcbHWFbyuYWtfHnezgWcSU5EjNpog0Y01QyLUhfkp3O8Ul8/m7PE
         FJy56mZiZIO8SQ7ZbRrfrV14fpvHVcqrGSm6bvdAJm0Iv04IXkQlaWAew0RhDd9cg+yU
         AaVx7M1b2IdhxLZBTfWYXtsOxB7PTy+uXaRxLqQqDZEL5cXj9e7t/mzNQmFVTskO5Z2V
         L2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801795; x=1745406595;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUVn1E+5MASZtQAbRE/tz2lbT/kj3f2AwNu2uqycOxQ=;
        b=wGv+BMKEduAWFSlyV9FBDahUPhwAWKYyYtxfFTi3Te71QkGaVJObM0zHyoyCZWLe1m
         mFuxnvqCf5AGN1YS4pdTLukaSAznCRS/TEjbS0CFSjz8g4OgmAp6XXfLZe/CpcBwbD+m
         XmAiGjdylYxZn+Ugr24Rx/ocq7rUBnKfuZj3czEHf3BXH6GtfXDgwLqppp09uKRQhTdE
         4so5Z2Nm+w6fskKB9tu2asWDCa5Of9TrU/+dCNMO8Z+vY8Ej9fQfcpElg4qoC6Mfhp7B
         JmQOqlsocLwlHWMN6HMbq6EXKxmUlCd2myxIiSV4iiezQnHcdlUR7PxmQik3lLII8D61
         AWNw==
X-Forwarded-Encrypted: i=1; AJvYcCX+mr/gW+0dzl8c7yeqWgSsIDkg+oqSQo2WMQc/2+TBrbr73ZKSppXCjl0eJBB5bLsx8XSUaeoO4x8P4em/Ooc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Y0toCpLkAMnmFXX5NbQI7xulgU/u4rsczCYSLhkjYK7hJTWt
	tZnmaJUFE84zUxsVUQzf2Ugy7ul03/Ts8qh0jcdjtuCYhW9WLGPHP8V8ou0HXkg=
X-Gm-Gg: ASbGnctlEdHAldgUAriBxeXHG+gIzWcBbKzEgS12xvgRRCum64TQNpEyuWdVYJuYxY8
	UPd8Qf4EBPYs3J7VD8ua6KkDXK9QBiuC+NhmAn3XNQ3FnQ7LLz9lFeqOxkCvzVVEhLeunpdD2B8
	/9sdplYUf2BK2t2uiyQpeXXPGTHLPotmTeYuM68fjBXpn7pfay+mHh2zzxLBBtVjGJfxm9Rlz9s
	IE6v+RIAlKMDZs+lA91KAVq0HNz0jiAEmagXibc2Rt3DiOJyEvi/nYPUq33CxO39bI+xs/50e7i
	425a5LQV0L6GQm1cSNkJheLmXbjybZTh+TyvT4P8P0zduw==
X-Google-Smtp-Source: AGHT+IGnbNlOdz2yVZBXGlqvERaHySPWwtoWVnzqqpbftBIEbIEdovohdZb+YF7/4pgI9k2rY2uGfA==
X-Received: by 2002:a05:6000:248a:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-39ee5b10fb5mr1551778f8f.1.1744801794634;
        Wed, 16 Apr 2025 04:09:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf445742sm17013298f8f.95.2025.04.16.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:09:54 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:09:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] rxrpc: rxgk: Set error code in
 rxgk_yfs_decode_ticket()
Message-ID: <Z_-P_1iLDWksH1ik@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Propagate the error code if key_alloc() fails.  Don't return
success.

Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It's not totally clear if these patch prefixes are real things or just
a cat walking across the keyboard.  "rxrxpc: gk: yfs-rxgk"  Really?
We expect people to believe these are real?
---
 net/rxrpc/rxgk_app.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/rxrpc/rxgk_app.c b/net/rxrpc/rxgk_app.c
index 6206a84395b8..b94b77a1c317 100644
--- a/net/rxrpc/rxgk_app.c
+++ b/net/rxrpc/rxgk_app.c
@@ -141,6 +141,7 @@ int rxgk_yfs_decode_ticket(struct rxrpc_connection *conn, struct sk_buff *skb,
 			KEY_ALLOC_NOT_IN_QUOTA, NULL);
 	if (IS_ERR(key)) {
 		_leave(" = -ENOMEM [alloc %ld]", PTR_ERR(key));
+		ret = PTR_ERR(key);
 		goto error;
 	}
 
-- 
2.47.2

