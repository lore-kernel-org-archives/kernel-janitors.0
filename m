Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D694C22D7B9
	for <kernel-janitors@vger.kernel.org>; Sat, 30 May 2026 19:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780170395; cv=none; b=QjecGGl9sqFK0/lmRGtl8rciia+iUA8rSpipQsdWRHcetcKYlLKfjljfUs9EUxQ17S3csJI8xDelmXEJMqkebRbLB+HkAwHMXK64ZxmAVWb65FNSsVqyIeKX9Gbw+mgG1wvu19FpUoM/0Oca0rOO34qhF9nZdmiC31yKgoC2Gsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780170395; c=relaxed/simple;
	bh=VVpqD6XQvQ0hsn9rYeTCvVf98ujTYmtQjqkHwHTJY9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIGW/y9d6l9oAM1xSfCPzT//FEvYMCf7T01O2jbJ2Qr9pLUsT7UDGaN8VlqyrYwnxKknK8rFNca035/LYtohPajfmn+tFr1LksBbhTRqSmDuGFKO63sOgXK0gfnGpXqTxWKDoxhshHpIMFG6XuSSJRh+98SFG7eaGAjGAd3pPRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwU2XVjP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwU2XVjP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so105883795e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 30 May 2026 12:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780170392; x=1780775192; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DTsXxYtkmpIvlZM5dyNHUEKfbTrmEuygZlatwKABRFY=;
        b=CwU2XVjPLt03K0RtfkCPQJpdWHkDDx75945symKS9wv8HN6EhKZhSqTBvT78FH4G4M
         ClICkSrL6jpevcmR8G3LmuI1KEo9EHmu2gQ6ir3pKTQ9+W2LSJpgbhIHVRNlFga0FPFa
         iuRKxD/7RMYLzCbq4sSLzWzHj6fsdFXPy0D+cpa/7YzCvrxeCrzYU5dYJ439ZMWYTa+2
         Zo+GlAKEgS6Xz2TwiMQgljzVWateoVwFVuD5xQEFg6Lrn1hs7WGVVjh6pxBWHkOPENch
         8Li2bgpr6ikRIiQ69X3l7UI8Ba2pTlTGS9ZmHeHBqDM4O7agvIgGSF83VO8l27GI1OWJ
         WkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780170392; x=1780775192;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTsXxYtkmpIvlZM5dyNHUEKfbTrmEuygZlatwKABRFY=;
        b=PELEUmP8+pvcZ2omM6Vp0Vhhz/4aKbSGQqUmnHUPiLbPsUnzEQI38uIobT8GSvggEx
         LRyK2NKjI2FlXNA6ppZimpzS2d1OYaXe4ZxjiAv55XQPyeihfWW39mzZ0RFRJ+/6othl
         2XHEaSMKemjrpkgeYefairQG601/gtfPUw1GNUq+WOCcYnX+lHwAYC6iQ5+WtEWCof6/
         IIOC0HrGaDltL19BGU7Kt3T5nopLqJzdvJwTYemkcHmOUJKDf6+MdS4amSvmdYScz8b8
         kRyCI4T95dBR551u2ETgmRFPJ7FTNhXrQRhZhXG3bvdrgeIqS4N/9fhBDJ2pX3iDdL64
         8KTw==
X-Gm-Message-State: AOJu0YxVrQTviOaVaYxzoeqZNHkgn7nfZplFqkCc2yo+oSvK+FEIgSew
	R4Vw2UoqRYy1i1w+7iFXtEbnnHwrkS6ufonBYKnXESbITsEZptVAhp76
X-Gm-Gg: Acq92OG2VkYuRxJnh8no5AnLea3aIDZO6Uqay2KOiIFnrEUSFzuG/rq98D8pzipaboe
	wft3mqzrOOdK0UwjtuV77t1wX+3OJsB5mI+SAYncWm+Bvo2ThqiYgHfoWi1pPDcjk/vdAjgeC8O
	ONMX8mu2v/HPTAkjHbEKpvM43bvrEN4tgKyjm1N8kVJx8wVFd6UwzYscggjis91pRv73S6S3TJC
	T7GFSm5rk6HpqWXqHx0eiRPFsfU8btJR7Zz+Rs5op4X4SiY1JBOr2fRPgW3jRbS9XAZomNGwJWG
	lNjI1J3JV2bIipTzMvPDkTqaQtb0cpEM3TATGsk/TjCISvzMQeXks6XyQer6DVnw9GZqMU+HJzs
	33QzLaa0gCLy/YgHz82vOR4PfJmAWqjAkGpQMgTt8FpDWlPGZqeNJqZ/1TtX0Ew7VSt6jAkyS8i
	Ei60AgZJ16ThJ18xKfSYKqHLQHgMeGESqBgQ==
X-Received: by 2002:a05:600c:c108:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-490a290de68mr77500885e9.2.1780170392123;
        Sat, 30 May 2026 12:46:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6575csm199859345e9.4.2026.05.30.12.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 12:46:31 -0700 (PDT)
Date: Sat, 30 May 2026 22:46:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Steen Hegelund <steen.hegelund@microchip.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net: microchip: sparx5: Support for copying and
 modifying rules in the API
Message-ID: <ahs-lCAXXikkaHky@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Steen Hegelund,

Commit 465a38a269e9 ("net: microchip: sparx5: Support for copying and
modifying rules in the API") from Nov 23, 2022 (linux-next), leads to
the following Smatch static checker warning:

	drivers/net/ethernet/microchip/vcap/vcap_api.c:3516 vcap_filter_rule_keys()
	error: double free of 'ckf' (line 3516)

drivers/net/ethernet/microchip/vcap/vcap_api.c
    3506         int idx;
    3507 
    3508         if (length > 0) {
    3509                 err = -EEXIST;
    3510                 list_for_each_entry_safe(ckf, next_ckf,
    3511                                          &ri->data.keyfields, ctrl.list) {
    3512                         key = ckf->ctrl.key;
    3513                         for (idx = 0; idx < length; ++idx)
    3514                                 if (key == keylist[idx]) {
    3515                                         list_del(&ckf->ctrl.list);
--> 3516                                         kfree(ckf);
    3517                                         idx++;

The "idx++" makes it look like we're going to keep iterating through
this inner loop.  Why not just break instead?  If we keep iterating
and find another match it leads to a double free.

    3518                                         err = 0;
    3519                                 }
    3520                 }
    3521         }
    3522         if (drop_unsupported) {
    3523                 err = -EEXIST;
    3524                 fields = vcap_keyfields(ri->vctrl, ri->admin->vtype,
    3525                                         rule->keyset);
    3526                 if (!fields)
    3527                         return err;
    3528                 list_for_each_entry_safe(ckf, next_ckf,
    3529                                          &ri->data.keyfields, ctrl.list) {
    3530                         key = ckf->ctrl.key;
    3531                         if (fields[key].width == 0) {
    3532                                 list_del(&ckf->ctrl.list);
    3533                                 kfree(ckf);
    3534                                 err = 0;
    3535                         }
    3536                 }
    3537         }
    3538         return err;
    3539 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
