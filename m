Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B83112BD
	for <kernel-janitors@vger.kernel.org>; Mon, 11 May 2026 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484251; cv=none; b=uejqpYUTlfhNYGEQ6yRlev0QAByjKrFqOH/kN53e8trt9CaXX5KTxPJsjmlYfvYqXyLaZk57X6ViyQdGYo23wUFtve6iGMXPHz5NPTZgsM1uc96JAlqaEN64Ac2+r9S42fPGIU9je8I7VBfQBDK40jhRYsZjr1qs2eQSqVIG5KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484251; c=relaxed/simple;
	bh=PP3r/MntpF6E2HPsEiAzHDByBUE9hdbpegtf7BYBCYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fy8hYK2q5GXt+wYOA0FGOQDOFtlYiYxdP1ANcUX080RlLHeApfEOv9SM4EpForQ8E+n742RzslEc8J95FkuHY3aUkfCbvAlilO7ijjm1ewAUdkTV5UmVFPny+GupW3W6vYbONEqZZ4ljP7aWjflBIaMWq1AREmitn/KWKeKgwHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZuHXl81; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZuHXl81"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-63134048d8dso2263740137.1
        for <kernel-janitors@vger.kernel.org>; Mon, 11 May 2026 00:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778484249; x=1779089049; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyHzPHZyzl+Vg43QcI8DAMEIEZeDqaoxRsbf4hAiXOc=;
        b=fZuHXl81vtNLXxdpgEQfODoCcMfzEgRoAV9PXMqww8xcNeWt+PppxdY04GfYJQ2N1m
         90Qb8sxD6D0deFiv2Lj//01/JK/bSyaVpj+307ne5j53NP5+IFomHVq5Q2NZbh07Gr5R
         pBM1bFzUlGLIFIyK1Dl9+G7LKeeNDyfySplL7cSBWndMe8cCOHc3LR+nBQ9IiA+FQUJe
         cJoiVWW42oS0Zgwej+gb87CGC6bJCziF/9o1ymwiDYcmAkGz1rm/hfAvI6euKIzaGGRs
         l5rbIQ9a4zBffIJXmE6b/JX7ZrO2/+9CL9XdrFx1/UM6IcP7MAWgOgl2Q2qySWnxNZs2
         /jLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778484249; x=1779089049;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyHzPHZyzl+Vg43QcI8DAMEIEZeDqaoxRsbf4hAiXOc=;
        b=FQj5kIHhgSYqFSOLFllM1utX/CaR71zvUTno7IVbkrzswv6W1jlYEQ2dunMhZllLzF
         NgjFeiDoOWPGgvzjnmed+UbKbNsCTzB2arZEnm4ovdvRtdBqo5ZboK7GV4APZaCTBKYm
         25ZY/20ngM6efLOWtFPeAQNwVBFjmEOGQ1ectOAkD8vzrwVxWhEjp0V5AwLGz75RdF8q
         FYTFcGUZMA87qLY6NA4hJQY1iRB1sZumf5kWGh812vxPLnKHcHWWZIfNfT2tmqyLQGnq
         M6jX86uOEeVkvz07w+Cp/AUNf+EXQRXokMP+9y+BuIPQ36xsi6/no6W+lMPQDkD4pVqB
         GqoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RXCeSboaHOBcq5c7Z9esZZz7QoxAthDdkE4C9mAt0CWGe9bzDu1MbYbtPImDPCulnbUJSJhhzA9eMNxGZkYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyVluovOJgxCQLaX5J4ZEyd00qnlDS+4BAbSQfLcXoBp8hgCPi
	3wi2A9Gm+OmGLRgv4N+enAFuB0tC73Wu3LErPlQDTJQrIvgsF2/Bt6HrgXifAmIS
X-Gm-Gg: Acq92OGZtm3s/YjBbk54Vw3vj07w/0PxamUAicoCGwbjTSSzJJWjP4ZAq6fQNbI1+LA
	olg9CRv910/cAFsbi5e7GVfe7DwwoJe9BF2lIW/Ot8KCXoMGso/kUAedcSXlw2JAY4akb4XYmZs
	0N7mD9UXnltgFjgwVR3uhRB388L29vNRXzkF8C/chNTT9hqqZbS/NHGR8tt3okHlt6gScDUIJ0B
	KuSv8BxnpvU8fQUaCHEvSnxH9yAKxJD2411ixja6Sqf5Ojw8Y+sJNLfPn/xQe5G6Prk27fTiZNn
	v5g8379CTBJ3MWwURv1glj+V4UR8twg1YBI3scYZDpYL2UxpTm998f4pt5vpIEB93iG5S089hio
	zkTshMxJp+DsKR1iYjNcKGG2ef7jgnOdSu3ii/Mh9keS/1mzH3CplFAduKAFY/pwwAwFmzOHh1t
	IxSx0gOhcZ2QbJYeyAW4P9sFgm9EeS
X-Received: by 2002:a05:6102:508b:b0:632:b111:965a with SMTP id ada2fe7eead31-632b1119b04mr1737026137.11.1778484248846;
        Mon, 11 May 2026 00:24:08 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63140250725sm5583359137.12.2026.05.11.00.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:24:07 -0700 (PDT)
Date: Mon, 11 May 2026 10:24:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] afs: Fix error code in afs_extract_vl_addrs()
Message-ID: <agGEESTvK1LxcRH2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The error codes on these paths are only set on the first iteration
through the loop.  Set the correct error code on every iteration.

Fixes: 0a5143f2f89c ("afs: Implement VL server rotation")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/afs/vl_list.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/afs/vl_list.c b/fs/afs/vl_list.c
index 3e4966915ea4..003889cf0f18 100644
--- a/fs/afs/vl_list.c
+++ b/fs/afs/vl_list.c
@@ -92,7 +92,7 @@ static struct afs_addr_list *afs_extract_vl_addrs(struct afs_net *net,
 {
 	struct afs_addr_list *alist;
 	const u8 *b = *_b;
-	int ret = -EINVAL;
+	int ret;
 
 	alist = afs_alloc_addrlist(nr_addrs);
 	if (!alist)
@@ -110,6 +110,7 @@ static struct afs_addr_list *afs_extract_vl_addrs(struct afs_net *net,
 		case DNS_ADDRESS_IS_IPV4:
 			if (end - b < 4) {
 				_leave(" = -EINVAL [short inet]");
+				ret = -EINVAL;
 				goto error;
 			}
 			memcpy(x, b, 4);
@@ -122,6 +123,7 @@ static struct afs_addr_list *afs_extract_vl_addrs(struct afs_net *net,
 		case DNS_ADDRESS_IS_IPV6:
 			if (end - b < 16) {
 				_leave(" = -EINVAL [short inet6]");
+				ret = -EINVAL;
 				goto error;
 			}
 			memcpy(x, b, 16);
-- 
2.53.0

