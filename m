Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF73936195D
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604915; cv=none; b=J4Rnz9x/bGu/rr5Ej2FLxQAiRNgF+byAaXAdESkmQkWOPI8KMsEkZR4TBUGCk4IR0e7xE3R7x+HduOqG7i6QyN0lhZGKTtmBDKCcW4YEw+3id1aH485K7AUZkkgaHfwuCE9SsWCjtUJ3zJ+GFXeyZqlhT+2mvu2zji8sS2eQbjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604915; c=relaxed/simple;
	bh=9LlZk6pVY9oRzBTK4VcviaL3zrXDmWeRw6oq30URFYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSZ1Ggts/oeVWlNYjiZgCi+McUPTt5wwc+7tihk+kiiQ/ErHV29Ditf9jBF5lFSIbs/3AgqqJETrKvNQCjNIMX2+zBdwbytQKCrsyl7c0A3gh70PsmzicaeNPdthqphLLCR1yQzZ9oxlasQYpYRS1ljxhUvzhWkbgTB9AuFpqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asUyFl0e; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asUyFl0e"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c2a818fc4so2392251cf.2
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 00:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604912; x=1787209712; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9x2E241o23Uh70FRs1x9EQZ3vFUwK3mBeIpCG7HTJA=;
        b=asUyFl0ejc7bS2cUvtwVrsGU7JNhxFbj9Zxao4nTawNtIsGbeaNO0jU6UDd2FpMana
         lQB76Lwam4MmxcRGFw/68a8P2QPIqphevibvsjFOnY732/OPRjabtfNZqvMLYVRhKXWS
         hwmfM0GgxEaMrD3/PLrzcbyvZXutAcT93Gl0n5Ejl5PILq/uysqcm7yv3ICLfLCRvqfT
         OviLNhSgQIsXwwN3DzRbhbDQpebv4fa2cXomDUgaMCcBsrNB03/rmphqijJfuEgFanBM
         MQmxn/Zm8rDdQ7RqlqvIKItSeY27HR/Ssso0IN55yQCQQHn32l78xb8FjCAeCi6FLOGm
         duTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604912; x=1787209712;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9x2E241o23Uh70FRs1x9EQZ3vFUwK3mBeIpCG7HTJA=;
        b=P6twrEM8AYyVjKgAvWhXv+cwVHZzTlH9lKcSHA0ey5CmLnogfYA2oar/MPp9bf7C8u
         k9m41ilNFa//rm1XjEKBbTJWl9rhcp08d9ZbseeO3vsqNHaMaHYHXZ9Tm0odvdwYJCB/
         QanFG5Z/fSfLwVrn7vW4aKdTCj6lATHVye46uZ3E8lAmnsqh1L0AoaOKgtmsRc2Mc+tI
         w+yP9Ule9gqa9rnMBsYn80MkUhrC5neFR1IrHUmr8jBG5O3jVTVjrFBfKfHQhOemdhpd
         lbJS1U8HrfD+Iz9N1DB9NE2Fz8BwXPz07mZ7362zD5pJfc4qiVQq9OqEt76VHTPm7RA8
         Bwiw==
X-Forwarded-Encrypted: i=1; AHgh+RpyFv1RAtz2wDII1DP3iCeiay8y7RiiDhKxAOWuBciBC92JRuZYC2ETj4prj9pqQ3qabXrw1liX7IaMJe4PyoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YydUiw784Y2Du3fv2QcaE4wofG5/gulRj0sLDG/whKvXhQMZrLD
	Gys/42fMi3NRSpoBSjAcgxI4P9TuQQLBBezlVvm8GvOh/i1HYfQOnLG2
X-Gm-Gg: AR+sD131ARcICiTF0YjFe8vglWdoO3kvHmRJtrhPX07vW2SE1eQBflzOoU8V/ewaWsl
	bqMbggpsufzGErsRSkpH2U7o8O2DFR2wRsovAc30GzIfrl0aPb7GsACasfZpwQOKsbkTCBm1HUl
	7U+Cms+Ar/8awiOhhbdmQ7Kk0rOhLoyVk6rw1HxakVLcUiWn9f8POuPr6hmdpX9+6cdFZc3o7Tx
	1NMcxDhG2DpqI252LDLkPFMna3jdQno4+E8yfcKjhcOAAow7VNQbq0zanZZSDoDoPgu2BN0AqBp
	Huyn6GIkD7WV3tbUNxQtWvYOtiVda9fS5LpKTGhWsStBnZSseOxDtcpGmvbWsvtBnxWAYTdJAs6
	T+hqFG3Wkf6sSVWxh8BqmCgllnVBMl5I8XsNXBKP6scPE0eTRDAuZU/3hm3B4kwyoeNp6o6CNLc
	7PEwkZbjkt3zbGbNOszRCqHSn5mr3ZOTQrDXqu4t8gFhN9v8ybqgGA
X-Received: by 2002:a05:622a:58c5:b0:519:efea:cf41 with SMTP id d75a77b69052e-52d73d93652mr37205551cf.28.1786604912341;
        Thu, 13 Aug 2026 00:08:32 -0700 (PDT)
Received: from localhost ([37.19.206.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d73fde516sm11008501cf.23.2026.08.13.00.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:08:31 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:08:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nilesh Javali <njavali@marvell.com>
Cc: GR-QLogic-Storage-Upstream@marvell.com,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: qla2xxx: Fix an error code in qla_get_tmf()
Message-ID: <an1taxANE_4_vzJT@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Negative -EIO was intended instead of positive EIO.  The caller, doesn't
care so this doesn't affect runtime.  It's just a cleanup.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/scsi/qla2xxx/qla_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
index 2b9a9c672ec6..0c4e8ce9decf 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -2302,7 +2302,7 @@ int qla_get_tmf(struct tmf_arg *arg)
 		if (TMF_NOT_READY(fcport)) {
 			ql_log(ql_log_warn, vha, 0x802c,
 			    "Unable to acquire TM resource due to disruption.\n");
-			rc = EIO;
+			rc = -EIO;
 			break;
 		}
 		if (ha->active_tmf < MAX_ACTIVE_TMF &&
-- 
2.53.0

