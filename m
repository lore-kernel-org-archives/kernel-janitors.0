Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395955B694
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Apr 2024 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051821; cv=none; b=B2IOqICEuQOC23hymq4fYWX1s68TuqBVKzNyKI4AxcXaKkqVgpJifBU9vK0R8hFIl5ceQ5wUsJTK7tyuOxH2s/mrs0Zpz4DJAulyswN3Exanz8i5dh4EeH4ocEvXhHJKX6NGPbWtKAPokk0YUF3msNtMuZ7Jr43h5kMPUK8KNzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051821; c=relaxed/simple;
	bh=iP61wYLmnnQVWQX/vBTSXN9AMov1jT600DiQQbSBwlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ey9YNBuOU4sbxPgD2ne7S7fZxYvnUnB0tGU7IKrLz/7fArBahfLgWTH4vNfRm2Q3NXFP8ekUMGukJAyXQ3UGEUBGqh2u+Bdwg0s8XV6JufIUCMzbv8fHPrP2iDEzahvDIPu+fXVsqW5rM193KVabu46ZB0D/9gJybuMgwlBRPBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SkHkeqkj; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SkHkeqkj"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso7076732a12.2
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Apr 2024 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712051818; x=1712656618; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwgQXgoUW3ptEVLp+FHIBGiwI73MMNowi6SZaD84hB0=;
        b=SkHkeqkj6Y9XZxGuEhACJ7noJvDVA49Zup3UxNSleXZBmN2cLL1xp/0RjmvJyvkC6d
         vxcmuwrR1GJHRqjlxnbPhbzV4jAESXRE3m/Qbkl0ezYZGQkCi49XYs1ctwry2ukUQLnB
         nuYXjbd+L+TxHM3bkry+m4jAanAwPpmedZNvUYN9QTGnENqGk/slYD3s/PSuNTf4iAGq
         76Hgr5bOcmNAi3984+WL1snjjEh/PFbMTA/XOKeO8QF+3dA7yywkCHD/UkHL2npaijGt
         mAQed/iDZmfWw3MXsyUPSx6OUKYuU3QHsS2Ls2Xox0lP0fpXEm2dCd6B4SB9Kd0kGeIB
         xVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051818; x=1712656618;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwgQXgoUW3ptEVLp+FHIBGiwI73MMNowi6SZaD84hB0=;
        b=BwAxyBOpZGFRU7BJCjyQ0OeX7e+Ut7Ev82OAfWUvOQnWMuPYVP4AZoFE7sErMKImz/
         jPrk0tk1Ld9w46rc5RJh6VUC0v2xYryzyH7xKDbrxWMpsvZaC1cIkdw6eHRlV1pf/QpM
         2HIi4GzTnAeJadqezzwk7LllNDEia7FXJY0GidCU4dqNtPFQGmSVDb+cAj3VVMq237cp
         rcw6t/eML/n7NBfa3VZegQepoKhZnoV9ZILV0tBff5r6OGS8BQo1fGpqCt20XAmBGbUu
         8r7YmvCZEwRGQDbxKZ6+/4eYWJBDbJnMtSF34LdREQ3O8/N10xQGyiI+39/vxBhwKjST
         vPMg==
X-Forwarded-Encrypted: i=1; AJvYcCVBxhWFoX5BXrN2AZdIuO9FqZcMaz98MjX0EYrIz5TY70IBZWww2JyWGUfb+cVd9ImYvHAlH/EqeyWMpDCvggK6U0L7iTZbfuMpEULHDpWZ
X-Gm-Message-State: AOJu0YxsGYVsXc3eltqOzfqCE59FESBEEoZ8kbeE2NC1GUniPeokHhLw
	McFYofQPAIy1QjMeI5cTzrNOuhhC0ncCYqrfOPu93TGl+1cAHDJWcmh/cAcBgtU=
X-Google-Smtp-Source: AGHT+IGY/ckv5IDWBeqA+lu7NK4+cJGbNGKIoaQ4W6h+blnbepjFmGXMUHAOqLWzHMLmnsm5NYCPaw==
X-Received: by 2002:a05:6402:27ce:b0:56d:b687:5a57 with SMTP id c14-20020a05640227ce00b0056db6875a57mr8537324ede.20.1712051818415;
        Tue, 02 Apr 2024 02:56:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id eg14-20020a056402288e00b0056df6ed8f4csm119336edb.37.2024.04.02.02.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:56:58 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:56:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Quinn Tran <qutran@marvell.com>
Cc: Nilesh Javali <njavali@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>,
	Larry Wisneski <Larry.Wisneski@marvell.com>,
	Duane Grigsby <duane.grigsby@marvell.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: qla2xxx: Fix off by one in qla_edif_app_getstats()
Message-ID: <5c125b2f-92dd-412b-9b6f-fc3a3207bd60@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The app_reply->elem[] array is allocated earlier in this function and it
has app_req.num_ports elements.  Thus this > comparison needs to be >=
to prevent memory corruption.

Fixes: 7878f22a2e03 ("scsi: qla2xxx: edif: Add getfcinfo and statistic bsgs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/scsi/qla2xxx/qla_edif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_edif.c b/drivers/scsi/qla2xxx/qla_edif.c
index 26e6b3e3af43..dcde55c8ee5d 100644
--- a/drivers/scsi/qla2xxx/qla_edif.c
+++ b/drivers/scsi/qla2xxx/qla_edif.c
@@ -1100,7 +1100,7 @@ qla_edif_app_getstats(scsi_qla_host_t *vha, struct bsg_job *bsg_job)
 
 		list_for_each_entry_safe(fcport, tf, &vha->vp_fcports, list) {
 			if (fcport->edif.enable) {
-				if (pcnt > app_req.num_ports)
+				if (pcnt >= app_req.num_ports)
 					break;
 
 				app_reply->elem[pcnt].rekey_count =
-- 
2.43.0

