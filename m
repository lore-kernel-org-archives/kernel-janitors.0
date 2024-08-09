Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F633194082
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 12:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723206509; cv=none; b=BcTrV1j3zdYDJPNkfIHJpQkyLMhI0tZ/8l29mD9Oi10WHZb0zFeBCBQnVFsnaJlpbyQu7F5M9klxIMAKescibN5kytZVrlnAMlW4tIZL0lYaCPDj18RxWCpmJPdg/fSbLB/UUUvhcpvMQ8xXHz/XbLLCPb1ZJ9zMI17D9L+w/Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723206509; c=relaxed/simple;
	bh=5BP+4KDV491eS2hTDPWl3HuFqonvue6QF2vMAsmE4yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oUiBgR6ykzhXJh8jSJQof20hUfdhCjQi1eg4TH0BdGE7SmzvbuoMJA0DrOtum7vuOh44WnVCamdTdn0IpCUt4s6rogxCky1aHJvDsP7ZwRXbJj9wra9hb3CSG04Mj/ylIQ08mPHVZIDlTOn+BCwEDF3JI724ElZipbvJa2NnaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DtwvmRGi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DtwvmRGi"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so2526446a12.2
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 05:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723206505; x=1723811305; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AZK4QEEzfr3VuQ9dg4uACWvhzBvDHYYGEqO0otKoi4=;
        b=DtwvmRGi44GbEiZQjn8zrgDJVAJR2+UWxcG9QLe0ASXRp6RHcq4J62y9ELlKh889CY
         Z89OJoy4yUzYbONhaysKarYd/pGI352dlP27+y7tAEOJylwoT1aYufy3hbfTAPlks1iP
         iIZyvTio0by0A3edYCHyOA77c93BhbJ1kpJYX/ijVRAxvpACSlPxp/l5CWI6S0siwgLO
         YuNN+jWHxorhHCiXas9XqZzAkDD8KtmpV3XV8OvievOCrjQve9Kuk98TpTPVTgooE3+Y
         DpL1aQl8596NbBo8jsYvnNn0DdnkGWIzMmseZsow9jYJ+lkW8ViL9NeFOK72cyT7RaVJ
         at5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723206505; x=1723811305;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AZK4QEEzfr3VuQ9dg4uACWvhzBvDHYYGEqO0otKoi4=;
        b=udr1Wii0sUOA3/0A7+ygmZ7l0dJ4Tg5qMbF24dfiquCadWKa0XFX/5J4a+OL8P8i+v
         KKINJXm6KrvqDKRJ5UquWHhh88x/LXuTsalKeBkM9jgb/5NtoNg3Plxvplatu6+dIBwA
         CDKbYuZOncj1CxwllRtjN0UHTKJu5icGwjNQI4zRc8NmKVV3cyPA+6+CFZzM/qWoR0EK
         Jhh8P9be1C06Wo1YiRSHEC2TsBkcfp4gmJfi8det49g1f/CwULDsXjhWby0OPGn1lueI
         VZq2C6dIgJPZlA512XbRCJO7V1NNneZsJr5OQSNC1cxx6LV3GyJpnlqZCNxlSqcPzHHN
         rugw==
X-Forwarded-Encrypted: i=1; AJvYcCVND8MwkvsD0vZCbn945PFwgz14JUv3Cw16UCmM9TXFE1/uYBLLYwdKByQdXHZMxDowiIbLq+Ha6FdVahP1ZYW9PS9OcXDbj+XJmdjUet2j
X-Gm-Message-State: AOJu0Ywsg290D4lsRMAOTSuBPSUndvk0GbPwdmnZA7bVSwNtex4p7fpf
	AjxTfMq3bMWNFOncV7jP6kXhLQKoOA0zgA1+xCZQpSe6U78Oj2FixSbUF11uHN6JYbR0eIl4sDD
	n
X-Google-Smtp-Source: AGHT+IFdxwfMOb+uW5xKCVPLH9JUrE4SNICMJefKUZ7G5xbhHBIaa/0KrZwOPjgt/ENPK7SHJZvrnw==
X-Received: by 2002:a05:6402:909:b0:5a3:64dc:33a5 with SMTP id 4fb4d7f45d1cf-5bd0a568955mr1076316a12.17.1723206505396;
        Fri, 09 Aug 2024 05:28:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2bf8e78sm1478959a12.3.2024.08.09.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:28:24 -0700 (PDT)
Date: Fri, 9 Aug 2024 15:28:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chas Williams <3chas3@gmail.com>
Cc: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-XXX] atm: idt77252: prevent use after free in dequeue_rx()
Message-ID: <cd0308ff-fda4-405f-9854-6a3a75680da2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We can't dereference "skb" after calling vcc->push() because the skb
is released.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/atm/idt77252.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
index e7f713cd70d3..a876024d8a05 100644
--- a/drivers/atm/idt77252.c
+++ b/drivers/atm/idt77252.c
@@ -1118,8 +1118,8 @@ dequeue_rx(struct idt77252_dev *card, struct rsq_entry *rsqe)
 	rpp->len += skb->len;
 
 	if (stat & SAR_RSQE_EPDU) {
+		unsigned int len, truesize;
 		unsigned char *l1l2;
-		unsigned int len;
 
 		l1l2 = (unsigned char *) ((unsigned long) skb->data + skb->len - 6);
 
@@ -1189,14 +1189,15 @@ dequeue_rx(struct idt77252_dev *card, struct rsq_entry *rsqe)
 		ATM_SKB(skb)->vcc = vcc;
 		__net_timestamp(skb);
 
+		truesize = skb->truesize;
 		vcc->push(vcc, skb);
 		atomic_inc(&vcc->stats->rx);
 
-		if (skb->truesize > SAR_FB_SIZE_3)
+		if (truesize > SAR_FB_SIZE_3)
 			add_rx_skb(card, 3, SAR_FB_SIZE_3, 1);
-		else if (skb->truesize > SAR_FB_SIZE_2)
+		else if (truesize > SAR_FB_SIZE_2)
 			add_rx_skb(card, 2, SAR_FB_SIZE_2, 1);
-		else if (skb->truesize > SAR_FB_SIZE_1)
+		else if (truesize > SAR_FB_SIZE_1)
 			add_rx_skb(card, 1, SAR_FB_SIZE_1, 1);
 		else
 			add_rx_skb(card, 0, SAR_FB_SIZE_0, 1);
-- 
2.43.0

