Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202771;
	b=FmQ2ZcmCBl5xXnBp71qHqKM8x6XqAPnBekFQJplhjco2RPKtafUxMEunjXe/P+N5MMvs
	 Wo10lGGtAVFqozW2HNH18mkIuhg0WVr1MENSErsKlRNpwuIK3Wf3f8vQoAcy3WGzoDLRJ
	 Os7cu4LKa4irk8OBos9Gq+UcaRA7chA8h7p9D22xQnga+ptkPJ8fbWNMIxM58eTH76Got
	 MQNLgIH8VNAA8KGEXTwkQbZfjGMDyHWWtcN0rbo6qW+1ZB5/qZW/XEtT7mbyUPLwCxGfm
	 vDHnjMn8f5qgRdHri8kjZRJdGt4F7zNi/i2/3DTDmlU+CYxnOdOBVGgbNOqQXOsfdJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer;
	bh=4uU3D93eNb0dcAsvNYKSr00RkTcidb/i2o2hNB/WLWc=;
	b=GPLx+DqHXqpIBcjTeTC+QUHFpA8yMFGDwjN7Trb+woCwSzYDPPK5rcDqf3x/AK+c8trJ
	 w/E0P9ibLNH0rRwFnJHfB2nv2PYHh1ltRT/GVgxoao/Eyy0cJO8uFN8CNpweB1Kywe4Pa
	 Sgf45U/aOhsj7muWWNA1XhoBEtksDpwJ1v1XjLjUsOLwcYfZGvUx1Xm3OpP4LxFAX3MYR
	 KEx3d+AqwpGkzGIekKY93sk2E6lbV5m8Wrm9LdNwQLlpVg0ZSWR++MOLya0UirWxMXiHH
	 Q9uOs1uETMfjJrtmUt8PiEg26RMGX89rKYrBDPKJn/kbWY6ICoitcEG9exPLzg2Lh5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/c396Cw";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88974606A332
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Nov 2026 05:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88974606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/c396Cw
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3edaso315587f8f.1
        for <kernel-janitors@vger.kernel.org>; Sun, 08 Nov 2026 21:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202769; x=1794807569; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uU3D93eNb0dcAsvNYKSr00RkTcidb/i2o2hNB/WLWc=;
        b=m/c396CwshKMa2EHH+DQktTUWKdT+G4FYhJZRO1ZyIRIhcH4JLYWrzEMYp+ItdlBIA
         TfrpaAz5zE0hxf52AhEiwplZI2VXfKYLCOe+FYHpU03rM56D8UVCIbC4EkcKucUXujME
         UqLm9dyYq2Pd28HnP+Gy67SC8ArUdRCZcomkUowXHVNoiFIICmBTIVdlsiscdGA64vyO
         RBLD8ILK91ZHqy91P5VTxFDBpvH+IqxaQ1CA0lQRBHmprYuUvpkUhVStr1VvYNw7G1dZ
         nYRFBFec5K4S/6FdpKhkVPUYrgzt6s8D/Fsckxa/yVxaOe5ssdJEt9lk6iqQknhDSoKJ
         IOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202769; x=1794807569;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4uU3D93eNb0dcAsvNYKSr00RkTcidb/i2o2hNB/WLWc=;
        b=RpbDSuXjiVXOBKHJLRARuveOMSJXVkCrN0cxXZkr4ntQdNCQqVOD1WHfbdl5+1julV
         g8k9W9GZvOe+gwKz4mc5lY8SrJ1ZvdIPKkdaW6IAg9lGtTGnJ/Q71Y/NGrC2CbiRnuYL
         aBYBolDZ5W6tvZMz3B/UxpD0BZ6fQyRWcwomsqA8jqPqexwCFqQcYh+l8dNz+IPV4SJj
         eEFSgw/h1E0evgnWx6ltPpOGrbLZC8kJqGkQhHC3JHvb91G+yb5RdqrWZfQVjjm4gAh/
         vLUmZ5TC5bqLpy8yFf3PQolESsPJwFH3g+YOdEYn8HM7jsHu4uL3UbVrKs5Z6Gb+ojvr
         sK5A==
X-Forwarded-Encrypted: i=1; AL+hErHoe8xRtyaITgWlEwMqU2cbs9H6MssYqRCnhN6gyS8eP4wBIUEr3r3OVwGzeHh75tfSomU11cM0QI+KnVhfzKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H/AnmW/YpRbIdynyS3ASkmIqpmGYWmJnmcvup2+VRb2c/ntyc
	Vvb2nMLw4urPizlqTI2ObPwlcHIdk3JzMtZkPh4+hW57QvAg30BY6r2y
X-Gm-Gg: AYBFou3MZnLBFuUcOcI4ptEotldeRGk56BvHU5PIL4fCamK9VSsqzbS4wnh7xbwp7mF
	9CU+7wwFTfL37Xi+PQN3dD5lQ1K8qbqBi0dVK2x3N+rMr2YY58+EOd+LbBLDq0Pa2fLZI4Q1YcY
	b4q0OkxAu5o5Sy8twps/LUSWQ0vbyTrynmFoNL3LFbLRMjZZ2YqZHokeA4lY4peIxxoE2vFiCLx
	sLysKctH0EXmxHqSyTx1H/Y4UDSGv4CiklKJhFIrzMTqhOG3LzUmhioFP7Haq2UD0QC930du+Hn
	RUGFDXcWI8ooODW6qTAYf6twXoC2u8PkqHGbAJ4SzSSllicnoS9EU6BSnh4avCZBexMg8aSpx9s
	NrjP+PMRZbIehXfj2rhJVe4SxBPSGDKQyXrrzJi38X/ShtQUXOyugUPMBCdFpcwQ2zA4h7MbkF0
	bXDGxbTtXRnxJqBDMhz0g4l2YCNFswGXb9OQ8Q2M8OQV75t0nvIgvEN3y8PzuhmPAybjoKjlQ1a
	G/Jn0XGlq6GDNqhkn4ZzdS4VjWAEHq/HLyR68IIGxFFx32faxH4wfra7UQ9Ve5UpfJH2xINDX6E
	aDy9fau4zO5r7T1XpjUyUK/1Hbw/JODkr8BYbScM3tVQzvZbDEGQzDmC9NzUIJsIt0VVtRlHs8q
	Hrq2pA+2yqQK3nFLquLtm3IKKc2xcF6zGX8uUf2b4V4aHL3BBiD37TS5HY6Jw98Io/A==
X-Received: by 2002:a05:6000:250a:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-49423997d63mr12864728f8f.16.1794202768807;
        Sun, 08 Nov 2026 21:39:28 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967a70a35dsm4750189f8f.9.2026.11.08.21.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:39:27 -0800 (PST)
Date: Mon, 9 Nov 2026 08:39:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] keys/trusted/tpm2: rename "bool" to "boolean"
Message-ID: <avFcjHwnh9mrOEnz@stanley.mountain>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In C23, "bool" is a keyword so rename this array from bool[] to boolean[]
to avoid a conflict.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 security/keys/trusted-keys/trusted_tpm2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
index 30188a0ec676..2d6cc53539c8 100644
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@ -59,13 +59,13 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
 			       asn1_oid_len(tpm2key_oid));
 
 	if (private->blobauth_len == 0) {
-		unsigned char bool[3], *w = bool;
+		unsigned char boolean[3], *w = boolean;
 		/* tag 0 is emptyAuth */
-		w = asn1_encode_boolean(w, w + sizeof(bool), true);
+		w = asn1_encode_boolean(w, w + sizeof(boolean), true);
 		if (WARN(IS_ERR(w), "BUG: Boolean failed to encode"))
 			return PTR_ERR(w);
 
-		work = asn1_encode_tag(work, end_work, 0, bool, w - bool);
+		work = asn1_encode_tag(work, end_work, 0, boolean, w - boolean);
 	}
 
 	/*
-- 
2.53.0

