Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1310F13BC02
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 19:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723492689; cv=none; b=LwXUxwfRLLlbotaFpVP/Molr3IVDPu+PRD7LJWnKPRv8fNzgmHHAFzydO+udh4vW7fwWYHRb/PT1d2OCxoxPstukCArDbH+pyxZjpAmnYwSHkNHJpotGqI6fV2R/2O6F/K/uZJCGcIULVpJTLXHdLZ50powy6C2/qGXzSArGheU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723492689; c=relaxed/simple;
	bh=argvqLetc3qK20ey+Xc/kT7sArMmfhcHeQMan/I4Bqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZDwiHkO9o4F+xc9bYztn7Cr8zRHMWPr1cYHLcks/fiTluM78sznze+xeLKEhkTIgFYk/wCmYnL5iU48JsKQa5fnw26QkZjgezGtJGbwXvVsMCQsdwpJIJGIz15a3VDhJpZNcZq9Zb2wgjuRbeBPjFMzxNkLdVBFHw+MmRKSuB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nl8WOwJL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nl8WOwJL"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a94478a4eso924668466b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Aug 2024 12:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723492686; x=1724097486; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zdYSOf+lxxFqAJqNWylBFcf20bjLrXFkb3U/1r6+r6M=;
        b=nl8WOwJLgTUo0LtD8DKfu9zUkeDPJZGRUinaXBSuhsECaHLNbvnOoAvOdpoL29HfhS
         lJM1NFN7xtZuyFAcSqzrToP4mTHqom40gZ9O7zGA3+SQBlw0fkdMiXcpz0kCfnNmVHiL
         LfaiE+LJuEjn1k00IYn60JDp6qYw8BHIJD2WmI731h6Yk78Z3Wcv8GFQjrE8NIRRN6Ei
         lo09GSCM73yD3nT4BFfLF6S6Jt9e/soCJwj9YSP3vPz/PJMs2Vhh8eXupQaoW1ZIZpUv
         QYk/BsM4lHi2PMRNMdFwXuKCJWlKfJ9oZIZKYftSYvrRDvnL+C4cnVcx0sP/s2dRaVKW
         O0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723492686; x=1724097486;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdYSOf+lxxFqAJqNWylBFcf20bjLrXFkb3U/1r6+r6M=;
        b=gZVaXHSR5tcZ+PEb0sjPtAa0Rt4b8KFMLV6rXGVWDMEN8aFeqMPEcrZPUU+8DTHc0j
         gXAER7Bn3iL20PkdJuxwcml07Fm7kfWC7xJ/zN7o5qOt14lyyZiIu4Xz/MoFPdwd9Opf
         qiR6RcraPABrYlOB5CTuvpifbYr0vxMbreHADLlUX/02M9OW5yF8kg3x9N4Y+g31qTyW
         0KP+JAooA8FtLVGMDgZFR6hsPPy9tihSKU28suS5iQBIu+UTX4/kUYpi/Kn7JW7+CpLb
         IvB/IhOF5KmNdnZD9ei4ZKx5P9rvEJexWIi3YyKitt1/iaFOjkgSlOM5b0HUKR8cVYJN
         W4eg==
X-Gm-Message-State: AOJu0Yw3cAlzeKXNzmE1RHzs48JARvmjPLH3LkElzXwaos+2Rp7/6ABC
	9c8xbd5H5AOAUP+O/9DGj6BOdmklzxPmPbqKndW7G4McBrVjNcDeQbGG5+O1MEE+UnY7TP7GQaj
	9
X-Google-Smtp-Source: AGHT+IEYWoTsfeViPnjtb6DxiVeHEIMn6BkzfrSLGfyRLbGnLxnKkAe9wHuFs6wC1mJ5LbsaS86sEA==
X-Received: by 2002:a17:907:2d20:b0:a77:ce4c:8c9c with SMTP id a640c23a62f3a-a80f0aa2383mr62721266b.8.1723492686224;
        Mon, 12 Aug 2024 12:58:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f41502d0sm5434166b.185.2024.08.12.12.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 12:58:05 -0700 (PDT)
Date: Mon, 12 Aug 2024 22:58:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] mctp: Add route input to socket tests
Message-ID: <f8de2605-e21c-44d4-af5a-2fd139830ae2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jeremy Kerr,

Commit 8892c0490779 ("mctp: Add route input to socket tests") from
Oct 3, 2021 (linux-next), leads to the following Smatch static
checker warning:

	net/mctp/test/route-test.c:369 mctp_test_route_input_sk()
	warn: 'skb' was already freed. (line 365)

net/mctp/test/route-test.c
    344 static void mctp_test_route_input_sk(struct kunit *test)
    345 {
    346         const struct mctp_route_input_sk_test *params;
    347         struct sk_buff *skb, *skb2;
    348         struct mctp_test_route *rt;
    349         struct mctp_test_dev *dev;
    350         struct socket *sock;
    351         int rc;
    352 
    353         params = test->param_value;
    354 
    355         __mctp_route_test_init(test, &dev, &rt, &sock, MCTP_NET_ANY);
    356 
    357         skb = mctp_test_create_skb_data(&params->hdr, &params->type);
    358         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, skb);
    359 
    360         mctp_test_skb_set_dev(skb, dev);
    361 
    362         rc = mctp_route_input(&rt->rt, skb);
                                               ^^^
skb freed here

    363 
    364         if (params->deliver) {
    365                 KUNIT_EXPECT_EQ(test, rc, 0);
    366 
    367                 skb2 = skb_recv_datagram(sock->sk, MSG_DONTWAIT, &rc);
    368                 KUNIT_EXPECT_NOT_ERR_OR_NULL(test, skb2);
--> 369                 KUNIT_EXPECT_EQ(test, skb->len, 1);
                                              ^^^^^^^^
I wonder if this was intended to be skb2->len?

    370 
    371                 skb_free_datagram(sock->sk, skb2);
    372 
    373         } else {
    374                 KUNIT_EXPECT_NE(test, rc, 0);
    375                 skb2 = skb_recv_datagram(sock->sk, MSG_DONTWAIT, &rc);
    376                 KUNIT_EXPECT_NULL(test, skb2);
    377         }
    378 
    379         __mctp_route_test_fini(test, dev, rt, sock);
    380 }

regards,
dan carpenter
