Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3944E01FF
	for <kernel-janitors@vger.kernel.org>; Fri,  2 Oct 2026 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952299; cv=none; b=RGFJv5/+usmTrM6V1ykgjqGZmj3IR94yTrmB3IX+Ngu0HcrbP8L8VjClXOtbot7mzaLsiQA/v+pITNO6JL7zxLsKpX00bRlxJHYas5Ad+OmEwZOvMW8NHG5x481ZYOoBjQBu00nTr16Cd+JuP4bpjiQphh1GOctyyNAcbv5QCW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952299; c=relaxed/simple;
	bh=GWsyH6hBcwla1pNANi7ebFerp2rnqJQcWaAcfk29BGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mY189SDBVHyXOPt4JDywsik4Qka+NbzD7S3e+YmdFggG+uwv4ujgiPgTNk6ySKEi9UtEw88minpJa85KsnVnAr5NoV+s+S6RXPukAWN92m6Qr1PgGgZJgyoWio970oKhoMXx0kHnqBNNuOqhs6gu3ApKrRzWcFjtyjl9TINwZbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slKklJhJ; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slKklJhJ"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e1432bc59so443439266b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Oct 2026 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790952280; x=1791557080; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uhe1kjp0ioHVkkyq0x9skUJJmlCnM0ROQqvDHAfjDU=;
        b=slKklJhJ5Mz6JlUDJdZ5fjGNKZmbLzqI74q/KJYfQOjhfdNuN/HwC9mIMI5iDGEmhK
         O4QG+kNT4EsbKM7LxMbDmhQzoATYtWNxiHOY61sou6d8YfJjX/K9JsfQntKThWp4OpJh
         4CtbnKNprEHRhDGhquanFs1fb+Ir5CiQEI9Z8cci2oTpX8M/LmucUv6ySnNPzoyW7Tjw
         aqVi/QktktXF5lgLaZko5Ly/06ucSOvx1TuZ/Ik3u3T1eBj/sx9TLe7RiNTW8p9fJyvB
         Rv1ZLfXJ1YaZd4eWr3uWGCvaSMK3x9OwLoKs1oLw3S5boEGHTxE0yF2ypl/od8MduYIl
         wZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952280; x=1791557080;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uhe1kjp0ioHVkkyq0x9skUJJmlCnM0ROQqvDHAfjDU=;
        b=r6qR95oV8Qm83rmAtT7q6BThJU6JQgG+xHVrRz+m3M4n+rxZyIYT6gNfHvx2fbnW//
         wTu7s2guJ7nFyZo6KVO4TUsx6IG5Rp/efZ5bl0ztKFLQx9ekDMHdo5lpUYU+eEFe6Vmw
         YMbZtvekfLsLUvp6XnL1JcUneFjJsJhRAWU4Vbx3737+6szsYkAQpOUhFEIlCMLZL9De
         NGf2EhgIgYoMN0iYmG/3hdA7RX6zZgYqfEIK1MgbnfJ3SUE0EMqdtPmhll/Nl0A+E0Bn
         yrQ7kHRfnLeJubpjmnoufw4EDNvjAY7AXZS0j9Jj+2WSR+p2o2Ukj2Kvcj2Nr5XuFf8f
         qPXA==
X-Forwarded-Encrypted: i=1; AKwUvByDMCVuf/LSEnq3FmeC3KpSvcdozDsuzQ6mcFt0vTvbK6SJ36YHUXQvr0nudSYlk8q1bz8OQXfh5NEF/+qZOTg=@vger.kernel.org
X-Gm-Message-State: AFuF++klgl2ko7KSe8S1HJdFaC2u++ZkOxpeTbc+ClMRBdysLo+6yRDY
	9ObhLh+LSMoUl64VxNBY6oo3fVeyYUmBOBJSLIWxkxTOnsy/PaeCfPte2PLbMadN2gXQKA==
X-Gm-Gg: AYBFou1btMB9IoHLjzm/BrX0n3tmZr8QfxuLFw8CiRbJTGR0HkD3tuQSr46unWlZvlc
	vxcpwI9iXEwi4y+RZn7ywROnrw43lQAO8essrxyEogEImGrsVXeghzfnEjjj4WqLGRaiL9BFLAL
	CpTnR90H9mRkYbUsFOK/s4vMhGC3IW5KIFmNg2Md2VGYOGFVFTMnjmTz5foWxJGsWUD0qJ6VTmL
	95bIuDTZiOXwhSWpdSF4jGoGPI3bKtt/DxyyTvfCoRzXujhPvYJSNYPramffvpzhCB5CebLk8Ia
	qHHjUQNFSStn+xG4zSg6+DnqZaR7hpUCpmbAmExX7e5uPF+Vkno1Shv7TY3RvuvxLOUbmg6OKy/
	Yecd0jaemDLXmsN37aHxkE8t1+/uY1aQI4R5bJpmuSdrWO9bepeqwHL3CGKx8u5IUj5juJc6KiC
	npltXSg8yV5YmbasxFbg4NoTOp6fUGa+KwBAnoLSEZmw5I5OE/oBO/y05VqRXxV9CIDbA=
X-Received: by 2002:a17:907:9346:b0:c2e:4627:285c with SMTP id a640c23a62f3a-c2e4ad2cf15mr246398466b.21.1790952280011;
        Fri, 02 Oct 2026 07:44:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa6dfcsm92846166b.72.2026.10.02.07.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:44:39 -0700 (PDT)
Date: Fri, 2 Oct 2026 17:44:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] tpm: clean up error checking in setup_ring()
Message-ID: <ar_DUjuGv-9vPzga@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The bind_evtchn_to_irqhandler() function can never return 0.
Historically, IRQ functions used to return zero on error, but then we
added an architecture where that was a valid IRQ so it went from being
an error to being success (but in a limitted way, just enough for that
arch to boot, I guess).  Eventually we removed it and we will never
allow zero to be a valid IRQ again.

The problem here is that if zero were an invalid IRQ then we should
return a negative error code but the code returns zero/success.

Change the code to check for negative error codes so it's not question
of how the zero should be handled.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From static analysis.  Untested.

 drivers/char/tpm/xen-tpmfront.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
index 3c0cce57c4ae..731444eac5f2 100644
--- a/drivers/char/tpm/xen-tpmfront.c
+++ b/drivers/char/tpm/xen-tpmfront.c
@@ -266,7 +266,7 @@ static int setup_ring(struct xenbus_device *dev, struct tpm_private *priv)
 
 	rv = bind_evtchn_to_irqhandler(priv->evtchn, tpmif_interrupt, 0,
 				       "tpmif", priv);
-	if (rv <= 0) {
+	if (rv < 0) {
 		xenbus_dev_fatal(dev, rv, "allocating TPM irq");
 		return rv;
 	}
-- 
2.53.0

