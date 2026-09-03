Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B9E4C9006
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Sep 2026 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447959; cv=none; b=lyjHv9QjG5fDyChiJl8404LECVB+pft3vKF56AhpSVC8nafF3fsbXdctIUmGlPNS33a/q32EIP7QBnP77z3/eIcunxCtmldVN3cOnC1AExK+fG/CV+6EtAbvizcyJH+2Tx5z1E3QZwue9MeCcvlMRJM8OiY2thA7cpgXqUXpQkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447959; c=relaxed/simple;
	bh=w92MawKkkHyqj+j4V9THNwhrPMydRPMGaLtM9WLIOwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fAdB7/Imb09Ps6LStfgDXymTFBZruq9sTZ3tK1zOz4VGxtUR7k4aS20FhNvSGbIcHkSqvFoIgHN8slWhvt85nBRI8PXVWLPifkwoLQM8e1NI0p+bXC5dPCrgyFy7wL7bCKwLRvEya1Vhh6VuHHB7gSW8GDZR6lqn9lxUyK+Ac2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mpt/RDc2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mpt/RDc2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso19172995e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Sep 2026 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788447956; x=1789052756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jJG+BikQhyyhKOerozrYKC8uiImTn5ykntBkDa6aSc=;
        b=Mpt/RDc2EGK7IZHG7V2yXpIlibUlc8G2twPQedcB+p25HDMYpWCYwstgLHM/XsCkRY
         IHgIIQmNO+7Z5rCjyyLpGwA4KC3UtcV0zOyVFAZEK7mncrvIUPm0UpSB80BjE3C05ZuZ
         TGIuWxe0L8GA1lGx/SScaznL+dlGTiXBcu9DR6qUHsXPts0PbP+7cIUhaGaw1XUQQsNR
         8WewNcfpPBrAVGfyYc/JMU7E3hQm46gtmmmDK5GfBxXMBx9mv4Aw6a770FbsOOFnGjhS
         i1eoFYQaQ/yY86+cDIOgGy1+mB5k6rgYE4BdN85kAnVoFocbY/4oP8v7brufw5JEGUsj
         UJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447956; x=1789052756;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jJG+BikQhyyhKOerozrYKC8uiImTn5ykntBkDa6aSc=;
        b=hJqMdyppe3zWsoXsG8qZ8KJh37O9VNi7J/X9lmUDWBwmt9Sj93FF+0wtij0pI2h8aL
         thmQPg0dSnr7AAh/2ZWIrLn7UgLBaBziTxz7DcTOpVq+QeLwXWWUonWAbfcFvZNPjN8E
         VVlhn5Ia5RR94ZugWfPYdjR0xEuBWlEkCG/9bsinCPujdhsNN6xJizhQEnTS4yE/qUg8
         2/JX12YDiLpDdRbBnBrGT1EUjisTITb24W3UgU8oBnHsNS0eH+uYFWUcrPofnuU3KXnF
         OJmkhu263TAm+hKEMt0QiMYLANwmAufKyVIb6IkBOdCEzMkT/jeKmWNeEO2HP3Xlygqm
         Jsuw==
X-Gm-Message-State: AFuF++nB+O11jnsTnPQ6wBN4RU4fd0iB7kHBoC33IaxcodN9errV7eJf
	bBzm/4ZjteqHMhy9n4g6XaUUliR9lXtLwdIUxmVU/EdCXBcpOgXFqFqn
X-Gm-Gg: AYBFou2rmQRF2xaVfa6B9IOhfip1epZbjTKh1h8VEawZXuQl0OviVy+ua4KcWQR13GJ
	UzNufEXsMx9WnwyLfRiJ+4yR409HZsborwoRwTcprb/9otlUIuFLFiqUJP6xdX3N4HlaebTbtrK
	K7QI8HGkzADgUFwaAdgT6PJpJ0jxOykGVwh4jezopMElFqTg/rLJWH7wA54KZ7GNPY4GMhyZxdN
	maQaD0jO5SBASCYLUtS0nfX3yIbg3qwexNaKzdVaBlxG7idKliwb+9J0O1PkfsxbtosN8IadbSO
	mrRbab46/U34GsK8zrPViUacq92hj9Vdcn4r+PbPawCjhdjfy3nqgQ/+97rEmxO16jJAaUu1Akf
	9oUWLj+w1qJMN0RpaCoYSmAd5IPJHPwcBlKpelIvrXXvr2yqSLpLOY/MXy1ySqLrUK+E+4l+EEq
	0bhmvBCSIl94FHfQ5HHtcvGmqpxOgoWhA1ejc8IpMH4W1q8gS2R+XBW1BVog==
X-Received: by 2002:a05:600c:1f84:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-49cf5bc7986mr8421325e9.5.1788447955968;
        Thu, 03 Sep 2026 08:05:55 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm14353038f8f.2.2026.09.03.08.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:05:55 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] selftests/bpf: test_xsk: Fix spelling mistake "conigure" -> "configure"
Date: Thu,  3 Sep 2026 16:03:51 +0100
Message-ID: <20260903150351.12725-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in an assert message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/xsk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/xsk.c b/tools/testing/selftests/bpf/prog_tests/xsk.c
index 6e2f63ee2a6c..772f3dd7ce64 100644
--- a/tools/testing/selftests/bpf/prog_tests/xsk.c
+++ b/tools/testing/selftests/bpf/prog_tests/xsk.c
@@ -75,7 +75,7 @@ static void test_xsk(const struct test_spec *test_to_run, enum test_mode mode)
 	if (!ASSERT_OK_PTR(ifobj_rx, "create ifobj_rx"))
 		goto delete_tx;
 
-	if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "conigure ifobj"))
+	if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "configure ifobj"))
 		goto delete_rx;
 
 	ret = get_hw_ring_size(ifobj_tx->ifname, &ifobj_tx->ring);
-- 
2.55.0

