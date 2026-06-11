Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5AF3BB112
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 08:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168395; cv=none; b=eoFgtoR9brKifLnRguOayl5HyLCtkccbJNfQ4KlzEjt18iOIMKxOIs4SmjmftT/m8Z9D/b6ml3J7IsNHbWSRS0nOSwT/+Iyv7FkCmSPPSwp4YN5fbtJlWL7l4yjHsksmo2N2Zk92J/i8YcuLDI3tryGhSqpxh1CA9uTcSDYMdJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168395; c=relaxed/simple;
	bh=QgmccsK5dccfuLVpxKECy02Cyq4fJw4GPvf8VwxeAUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xz5HcYaeCjmI0P5SSUAM+lHOeeTqET+Tw9zAnBt81mDexCoPw/w5NZCGIGMFBgRoeXa4s9aH9gGIVJll47KG6Xwg2u8lDNoCChxphjyK3jfzSUrH1EWptkka+Jp8sOOpjveY09ZW09RNXTzf6RbcGxvYjSqIbk8NDY78c0KapUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQB2UwI/; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQB2UwI/"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccef25789fso54316236d6.3
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781168393; x=1781773193; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDvuiII1LGFXTJ1G7CEro7BK7MfvK9SQkUAqzNSYDJU=;
        b=kQB2UwI/TU51v2bvMzTGySkGg8hGMVg/4zYf+LVdTIWnK5ntIFSjDxFVvMpYt4OLUI
         Jvcmq2kNGkDYFavHIK68p86IZMQyveDi9nmbig4OLnvo7ZJgud4k2lRxd+JaWcbJ1PV5
         +IelYTNu93jUT3KsUjSSccSG6UaKGKWnTjQaw90CO3ZUAuKskbUWe+HrNOmKRkl5RHhF
         00Q7+IgzQYAATmssnJLE9WW3SZqsvY5NlUj5J1u41O/8uMG8vxUmOV9QQl1DFHLFSMLs
         r11n08qlrcFDHIO6f+P+Kj7sYdXVEmtXHcBVS+b3h/O71emqHJBleX5fm+Hc64mEtEOj
         9JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168393; x=1781773193;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDvuiII1LGFXTJ1G7CEro7BK7MfvK9SQkUAqzNSYDJU=;
        b=OeX+GRqkyTWibN8AT0ytpFxobnKLM6uthEq4NdnDbRcsu9wEY6ND5Et0L5GOlEsn2A
         shGDtwxrzsBmf1CSmgHDIbxAmtduW7jn/qxS9JY9rlj4GMRk6W1E2va/9QnSqAFG7rGt
         qDmOYhq/UtmdA8Tco60ouTnYaD5HmCGceA2POKkPe5kkqIrSi/5AKoBswNW9TWH1J6rE
         e5EHvyMBzK/kjLRyP4y2x1AblrVLANx2J13+g+bgaLMKIrHxpgjWj1yZxzRwCNVQAchC
         AY4CtR5ZYznYuFwDcTGEqwSxsdz8sMMXmi+GgPHgYXiMAHWM96kV4JrU+9FQUcgHQPW2
         VxJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/g5Sp7f3qqCxL5cmXuwQJ9evd4t7YmliHiLZd1x97miX+5rkxaZmmhaeTcJY/VgBUGv/6UDRhh5LHZ7AEZTbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwTOoYgjBENb/C/WV168bCflfnCWjUe6HIPddf5CekMl52D9ty
	RhSC+ID8yWUPZU9w+5XdAthRrHLVXx6uBf526geAqkVZZz81GFxwMVc/
X-Gm-Gg: Acq92OFfbRvTUVHR1wbAYI1gj8d3AG4muYERal0YZfAIm2RHaCADv0gWBgjk/nDW83d
	+EvcyInIjk3jpi76Eu27+I53YeSkx39O92Y1wedr5w6XXrxAtk/O+LdmyzR0ImKLjujfRBOnDoa
	tBzbFRRsYoXSC6ADpMN0p8D9kA0PasYiv1yecwuH2j3Elfv7pc/3NUKjlpWq5I+6dQfkMnIXIzH
	3dXO82/cWgd+MKqRzCiUCycI54oOK0LQHQNctBayDnowUUj+/cSW+cIiRZISXpEBLaXM1DY85Fw
	p5oAphlLcawAd+3YE1kcueibGtt84TUUzbkSzNOOyt05CPN15IT7GvtENaar9ldPSYeN+s6AGMS
	WtTaYgrr5jElkowJuQsyDhkZKeB1UxDcjpFwiVg8DLWWBIEtyrK5PeIl/h6Cew72NG8DLBDIy18
	TpGagC2AwEDxSu/8ssQPLhqgkFJI4=
X-Received: by 2002:a05:6214:434a:b0:8ce:d77e:e5f with SMTP id 6a1803df08f44-8d1dac289e1mr31795746d6.36.1781168392876;
        Thu, 11 Jun 2026 01:59:52 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1e819f58fsm12553176d6.11.2026.06.11.01.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:59:51 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:35:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] smb/client: Fix error code in smb2_aead_req_alloc()
Message-ID: <aiplQF3QGXmXAEk2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "*num_sgs" variable is a u32 so "ERR_PTR(*num_sgs)" doesn't work.
We would have to do something similar to the previous line where it's
cast to int and then long.  However, it's simpler to store the return in
an int ret variable.

This bug would eventually result in a crash when dereference the invalid
error pointer.

Fixes: d08089f649a0 ("cifs: Change the I/O paths to use an iterator rather than a page list")
Cc: stable@kernel.org
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/smb/client/smb2ops.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index a3257815e661..a8f8feeeccb5 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -4359,11 +4359,13 @@ static void *smb2_aead_req_alloc(struct crypto_aead *tfm, const struct smb_rqst
 	unsigned int req_size = sizeof(**req) + crypto_aead_reqsize(tfm);
 	unsigned int iv_size = crypto_aead_ivsize(tfm);
 	unsigned int len;
+	int ret;
 	u8 *p;
 
-	*num_sgs = cifs_get_num_sgs(rqst, num_rqst, sig);
-	if (IS_ERR_VALUE((long)(int)*num_sgs))
-		return ERR_PTR(*num_sgs);
+	ret = cifs_get_num_sgs(rqst, num_rqst, sig);
+	if (ret < 0)
+		return ERR_PTR(ret);
+	*num_sgs = ret;
 
 	len = iv_size;
 	len += crypto_aead_alignmask(tfm) & ~(crypto_tfm_ctx_alignment() - 1);
-- 
2.53.0

