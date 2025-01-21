Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3521C07F1
	for <kernel-janitors@vger.kernel.org>; Tue, 21 Jan 2025 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458170; cv=none; b=gU+uky1UoEUzr2HLwY6xemGN/AU/gODgNgecV0uC4usbf/unF9HHtlzRzkYo8I6ZRUfRXYBN3E6cq3uqaYkE3kEpY6n2ymXU4Bk2VnHt8KHJ1ImUDllqbFzfxAA43gQ1z2cZhKajvPYsCxNX5RCQK92gV9egVEJitP1xuS/vQ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458170; c=relaxed/simple;
	bh=8NXyXgmj72dOMTLLbd9mQTnaEflcGG11z6lNzHOYKVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iGLuPue7Zg7QUDsSkKQYuoB08vmYPlfnd/c7Vb+hHQSgbBrYj4J0LUA+kVvu7+Q3wbZkIfLavjLy8d49MuEI3fGC5hjehcluknBIIF+9rD4MLSHivaxoTMXr43yYpAvOEBCGeC9/sf2H4lCpABNjCAVNPNG243mXNm8utFbyUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxnD8b2s; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxnD8b2s"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385df53e559so4223280f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Jan 2025 03:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737458165; x=1738062965; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQ9/vKCvteNP1p+2IIytP3er3wI3McGb3ig0DvAbV/A=;
        b=rxnD8b2sFy5BtQlee0FZhFWmMH5kSbc/m7enZK7/ywjRzVPMq3b+w3megC7VMNGKOH
         OC9R5rxae8hnECyX8b5pUvZHUoRUOU+PvYOqy2+e5UIxlsdatQCT8JldTH4noKFmr46r
         pcpG+J9x4JFDe62mvuU+Csdh4iwMVvfkbGL/aVOJugcaBvmhijeI8g7Arl6bhfUMn4nW
         c3mq6XuFiVHBtpgTFmyhgox03sgG8YgswRiz95zbzI0PbOXWmud5feZVkKDe5Q3pJc9/
         ZblwLtgzea4YuC1PpPMYWe5TjWn+JqoNIJwLHPvG90s6/56qqcqfRYpLJ1+sIMO8ofL6
         3z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458165; x=1738062965;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ9/vKCvteNP1p+2IIytP3er3wI3McGb3ig0DvAbV/A=;
        b=RDOrCV478U8amiYDRWeJTfhoJfhNRiSDNT7fJAeXWmm+UpIsAkM0JC21YluMpN9PzV
         oYDHp+IQBhy0P80wlECTK/3bhcyz7OHYAhiXVUfJ7ZZfK70EEn9reuVp890i4hj9lj4m
         TYWW5wKRHRXpGvIlbHJvf7HtuoUgcCmUs3gCIFDWBw+WbRzJGQyq+/G9wR8VvnWQFAOr
         uno+fEpP8imaFprZgFsuYQaRTojtIGjE4BY96BdAUGwH5HckJ26oa0wcs8j9FwDaYosw
         5M7LFTc57vVdO90ZqtflLiZRTsAWQG+Pdp8TWPcTxsmiCLtma51iXGkRotw828j175Xp
         KOxg==
X-Forwarded-Encrypted: i=1; AJvYcCUTDgdpEqc6ze1ceWc3/Iie9w4NorjQojEG/pQEF/ABsN/SCkLBJ7PxHX3wlZ2WApiRE0G3rnDBhNsszBgpGEY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Dj3o610VMrMO2dLfSFjK77ud2KXzG6peUoj8Cv8ZZ3/xfWwr
	WFaONefbDZu9Jsh2D95CNnYeTm7M/dIl4uYmaTea5X4sUeXZ1l/A0xmRvvgOvQQ=
X-Gm-Gg: ASbGnctY7m/iyvXn5IK4fqCKU77kUHyp4iJ42lJ1X2MUR+FZxcX6sj+g8wSf2Irnkut
	IPBgyN2YIGb0wewpoY6XECLegSOh2lckvN0CXk4qH/SMcW4CsajUJ5wWfu7Sz6liQQ6XWW5PFje
	wYpp51goKqck3S5fOLdMCwtf3zHWwbn2Y3FSl+EB15/PXTfMB/L2UYqneLf72P7xINoEnMtylZ1
	xSDA5Az4e08qm2lCy5/JLiIan0pnQAgaYCdOVltVuWddGtCXERedrmULrU5B29EdkkvnCh140Y=
X-Google-Smtp-Source: AGHT+IFu5iwWBJlfMKb2qqPgPYEgPFg5JRSCPVWEsRxn/dai+wPHA1OMBL4MUFjUwRffREHT3Asyhw==
X-Received: by 2002:adf:e404:0:b0:38b:f074:214c with SMTP id ffacd0b85a97d-38bf5674039mr9683425f8f.30.1737458165132;
        Tue, 21 Jan 2025 03:16:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aa0asm13269386f8f.50.2025.01.21.03.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:16:04 -0800 (PST)
Date: Tue, 21 Jan 2025 14:16:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] xfrm: fix integer overflow in xfrm_replay_state_esn_len()
Message-ID: <018ecf13-e371-4b39-8946-c7510baf916b@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The problem is that "replay_esn->bmp_len" comes from the user and it's
a u32.  The xfrm_replay_state_esn_len() function also returns a u32.
So if we choose a ->bmp_len which very high then the total will be
more than UINT_MAX and value will be truncated when we return.  The
returned value will be smaller than expected causing problems in the
caller.

To fix this:
1) Use size_add() and size_mul().  This change is necessary for 32bit
   systems.
2) Change the type of xfrm_replay_state_esn_len() and related variables
   from u32 to size_t.
3) Remove the casts to (int).  The size should never be negative.
   Generally, values which come from size_add/mul() should stay as type
   size_t and not be truncated to user fewer than all the bytes in a
   unsigned long.

Cc: stable@vger.kernel.org
Fixes: 9736acf395d3 ("xfrm: Add basic infrastructure to support IPsec extended sequence numbers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
The one caller that I didn't modify was xfrm_sa_len().  That's a bit
complicated and also I'm kind of hoping that we don't handle user
controlled data in that function?  The place where we definitely are
handling user data is in xfrm_alloc_replay_state_esn() and this patch
fixes that.

 include/net/xfrm.h   |  4 ++--
 net/xfrm/xfrm_user.c | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index ed4b83696c77..0a42614d7840 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -1981,9 +1981,9 @@ static inline unsigned int xfrm_alg_auth_len(const struct xfrm_algo_auth *alg)
 	return sizeof(*alg) + ((alg->alg_key_len + 7) / 8);
 }
 
-static inline unsigned int xfrm_replay_state_esn_len(struct xfrm_replay_state_esn *replay_esn)
+static inline size_t xfrm_replay_state_esn_len(struct xfrm_replay_state_esn *replay_esn)
 {
-	return sizeof(*replay_esn) + replay_esn->bmp_len * sizeof(__u32);
+	return size_add(sizeof(*replay_esn), size_mul(replay_esn->bmp_len, sizeof(__u32)));
 }
 
 #ifdef CONFIG_XFRM_MIGRATE
diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 08c6d6f0179f..4bfa72547dab 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -151,7 +151,7 @@ static inline int verify_replay(struct xfrm_usersa_info *p,
 		return -EINVAL;
 	}
 
-	if (nla_len(rt) < (int)xfrm_replay_state_esn_len(rs) &&
+	if (nla_len(rt) < xfrm_replay_state_esn_len(rs) &&
 	    nla_len(rt) != sizeof(*rs)) {
 		NL_SET_ERR_MSG(extack, "ESN attribute is too short to fit the full bitmap length");
 		return -EINVAL;
@@ -681,7 +681,7 @@ static inline int xfrm_replay_verify_len(struct xfrm_replay_state_esn *replay_es
 					 struct netlink_ext_ack *extack)
 {
 	struct xfrm_replay_state_esn *up;
-	unsigned int ulen;
+	size_t ulen;
 
 	if (!replay_esn || !rp)
 		return 0;
@@ -691,7 +691,7 @@ static inline int xfrm_replay_verify_len(struct xfrm_replay_state_esn *replay_es
 
 	/* Check the overall length and the internal bitmap length to avoid
 	 * potential overflow. */
-	if (nla_len(rp) < (int)ulen) {
+	if (nla_len(rp) < ulen) {
 		NL_SET_ERR_MSG(extack, "ESN attribute is too short");
 		return -EINVAL;
 	}
@@ -719,14 +719,14 @@ static int xfrm_alloc_replay_state_esn(struct xfrm_replay_state_esn **replay_esn
 				       struct nlattr *rta)
 {
 	struct xfrm_replay_state_esn *p, *pp, *up;
-	unsigned int klen, ulen;
+	size_t klen, ulen;
 
 	if (!rta)
 		return 0;
 
 	up = nla_data(rta);
 	klen = xfrm_replay_state_esn_len(up);
-	ulen = nla_len(rta) >= (int)klen ? klen : sizeof(*up);
+	ulen = nla_len(rta) >= klen ? klen : sizeof(*up);
 
 	p = kzalloc(klen, GFP_KERNEL);
 	if (!p)
-- 
2.45.2

