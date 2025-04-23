Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626322749DE
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396752; cv=none; b=SX6jAeMUMBRh9DeAPD0ZMwbi2h/qS8CANYjKtw+TdY71uzQqGIRLnpLiHiI4+f+PzE7cwU/xAA77+sEtPpAh7XJHTW0zAtBGf90f4qStOG9kqePzmaqGAYG2E9LbE4KGEjrPYPRcuzF3yuwBdAJ+CvorYimTkWngG3wMmLZDJaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396752; c=relaxed/simple;
	bh=wQUGCqIwRiCAJNXe0S9/0jDLS0hUb0JxM7vV3/rRgZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I16sathtDmXNTQNY0uTKF5LIURZYNrQm5tnC024fITXBngMDPDRzTzKowsR4+lqOzb6FlyG0N78mRBKUUQKDPZbx0KcQ9RtWOVfhBujo97QMC7uGalRGmFLgN49SLMRkLAi6NzfdYcZeXxFL1oJgluAGrIPSZDrev9ZrozlU/PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BAsvJnjw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BAsvJnjw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so29548965e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 01:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396749; x=1746001549; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cumGuXXvzB6S1IWSanPpei3FWjhooa/wauPws9AXZMY=;
        b=BAsvJnjwzoAkxcuLXHA1BM0GCT/wHzvjFhm8BZeZ/YQzJMPaMBFFDQbnHVFb78dyHR
         CUhalt6fOqeehz5J1vIvEtvGbaurhcd958BHjTRaX32stVNFggwVrm7RX0tba6Z4DyJm
         5p6coI2CS4uN06MHhi/60r9Imerhsexv3HxvinrgcxnPbDqpVyeBEVEkgNEd0O7O7z6f
         lwPzdMVRCTqh8Uo8P5JHkM+1aXxwHYI+cUdJKnZSmHXeFE+gZwDgDtw4o5wM3E9jIQ6x
         wh9V+tC6E26Q+fxEW1UzAPQxjmDUf5+lZdOw7zuMqtzG+B4IuQ4z3LhwCN2Qniyq/IAk
         1uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396749; x=1746001549;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cumGuXXvzB6S1IWSanPpei3FWjhooa/wauPws9AXZMY=;
        b=v0djt0Om7cQDWpQwmbiG5HXV9ZD1t12yqrppEk1GMne5YiJkWcrEjTyw87gVS0QKRr
         zNYvLrf3gWtmqOi1wCv4WyYs66Mq6RTdnK+AirmBJzF4x8OCMob7i6CU23u+jvmuxLqm
         wDlIJ2nlB8sd2pIGWCTtToZI+Y5CpCN2k5wYjdrvyqA2qCYK4sbq3eLXLgyPqDIUzWuX
         Jq6WyhmaXXYYI2Bcr9RKY7cwsNSKtUuIJJyaDM5D6TXwxD+3IjfdoCZJB2O/uh096ItD
         nkL6c7St0dlfMY2u8PvHN9sL/gsljlQH4BJ0cbPAUPQwtJbvKrEF0EqGdC9yqduftkhq
         W1IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeGFqQUaDQTiUfh5vPWXizl3OIM7aVGOs//aKMt9ccVDwd0VMfvyaWhvbgFOb0NFfy27nKxvh6qCWVpcqTkho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSsQVcbER6ovxB26uxZkxnRMsMiZU8PeVn0wN1tMsTMjMrM251
	k/RSGFn2516zqX0osEdd7N9H/bcQXgdZiIUfLvleLRgV3PWTQPXCnqAHa7DrlAw=
X-Gm-Gg: ASbGnctd83XFRLc2p8IN0eChWE2oiMcfz9Ja2TG2rxjNP1q8Z5v1fQEcjVlMzgwOm39
	oU4VpW1NZo3m0dO3ULRm+BmRHE03ffdGeHJjU/NH0j3XYoASVl5rdqEmeexSP6AIvgqqUyZDejO
	ckF9/6O7l0ifhSdhw4ziCVhOtT+Uip2nTfEk3ISjNHLXqZqCPERDP/ahZwYbAr6hXrtNJsNy1c2
	zMEYIJ6aZz835WwFP4a0h5ZVm8rSwsMFW+GRt8WRjP+mmeCXgRUq5dWczWQ8R5cQRWVvnCEIQ5S
	hQIVaRhqQes0JQx3qZFOWJCn3lFWgrw0QuITIbnNQmj2EQ==
X-Google-Smtp-Source: AGHT+IFpRv76nP4pFCeRNrK8Buzz7/miJML9dPdQu84BHUP/kQP8XSQQSLgAkC4W9foMctxFScbIbQ==
X-Received: by 2002:a05:600c:3c9d:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-4406ab676fdmr165779985e9.4.1745396748678;
        Wed, 23 Apr 2025 01:25:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092d179cfsm17268355e9.4.2025.04.23.01.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:25:48 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:25:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] rxrpc: rxgk: Fix some reference count leaks
Message-ID: <aAikCbsnnzYtVmIA@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These paths should call rxgk_put(gk) but they don't.  In the
rxgk_construct_response() function the "goto error;" will free the
"response" skb as well calling rxgk_put() so that's a bonus.

Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/rxrpc/rxgk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/rxrpc/rxgk.c b/net/rxrpc/rxgk.c
index ba8bc201b8d3..1e19c605bcc8 100644
--- a/net/rxrpc/rxgk.c
+++ b/net/rxrpc/rxgk.c
@@ -440,8 +440,10 @@ static int rxgk_secure_packet(struct rxrpc_call *call, struct rxrpc_txbuf *txb)
 		return PTR_ERR(gk) == -ESTALE ? -EKEYREJECTED : PTR_ERR(gk);
 
 	ret = key_validate(call->conn->key);
-	if (ret < 0)
+	if (ret < 0) {
+		rxgk_put(gk);
 		return ret;
+	}
 
 	call->security_enctype = gk->krb5->etype;
 	txb->cksum = htons(gk->key_number);
@@ -483,7 +485,7 @@ static int rxgk_verify_packet_integrity(struct rxrpc_call *call,
 
 	hdr = kzalloc(sizeof(*hdr), GFP_NOFS);
 	if (!hdr)
-		return -ENOMEM;
+		goto put_gk;
 
 	hdr->epoch	= htonl(call->conn->proto.epoch);
 	hdr->cid	= htonl(call->cid);
@@ -505,6 +507,7 @@ static int rxgk_verify_packet_integrity(struct rxrpc_call *call,
 		sp->len = len;
 	}
 
+put_gk:
 	rxgk_put(gk);
 	_leave(" = %d", ret);
 	return ret;
@@ -594,6 +597,7 @@ static int rxgk_verify_packet(struct rxrpc_call *call, struct sk_buff *skb)
 	call->security_enctype = gk->krb5->etype;
 	switch (call->conn->security_level) {
 	case RXRPC_SECURITY_PLAIN:
+		rxgk_put(gk);
 		return 0;
 	case RXRPC_SECURITY_AUTH:
 		return rxgk_verify_packet_integrity(call, gk, skb);
@@ -969,7 +973,7 @@ static int rxgk_construct_response(struct rxrpc_connection *conn,
 
 	ret = rxgk_pad_out(response, authx_len, authx_offset + authx_len);
 	if (ret < 0)
-		return ret;
+		goto error;
 	len = authx_offset + authx_len + ret;
 
 	if (len != response->len) {
-- 
2.47.2

