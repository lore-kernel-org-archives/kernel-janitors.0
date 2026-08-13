Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D26381AE5
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604980; cv=none; b=Yu/QEll6JIOWCgWjVctuMSJwjDEvZkiCRYbEi9ObeVLMAolVmu6cB1AKy5DVM+jTP3WORuMtG/b5BeZzIz0YmZ6TSkXDegQCqr0SFR0qEpAzAQghy2kMezKd9PlRi99BT2vw9XWqgP7ym2rQvZhU90/Cm4W2tIpe/+o6/ZOXhbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604980; c=relaxed/simple;
	bh=ajlICF5UKF3zQ8HymZznpcIpyBV/7FAyjz382zjD7S8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfk9e72ZRL7Z9ihdCDgRtjkisSigXDJUob0d60DzbBpzk0f9BI0BwmQcnXxP9KLis07jBamjiYj2EwlbloWoinpjNKZHs5BtE4NIcPZpuIu9HVvA74hSmWz1H1FSwDfCZQik+uI4mLkW1IU9RWY/WqTR4xJI1R3xYSyN+5XIWJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r38yequ6; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r38yequ6"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92ed3993c1eso106352585a.1
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604978; x=1787209778; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gw73m5PwUErvfwwmzv0TlDv6S2DhMcVdC6Gz7QT0ok4=;
        b=r38yequ6LKTbxDuYyvJMJQcfHgIpNwqcqvjtmDtFiJQLDPH2RhhIaMTM8LTvZKOVB8
         ol9M6xDuVkwv+RX4Mjg/CR/uRIePjvZTUfP8gJmX6vPHCbTnoUMIVPZjNoL9GRCZ1Cgq
         tPbAsQsLKmgZX/lYIfYKgjpwrBlNz+FT9pvn9QRnsknFeqQRiYSVofkOnYngIBF7/d8P
         idP6IgV6dwaRZ8BGYeVcghbZLh4S/1UXJTJ9NuPNj+sb49HAB+LSG9ZsfbntPK7t1L5p
         F/bVBXB+zt8FSLIDIzO35w5yQYtyVJWz2dyTwHPwuPH60ZlEBa9tpL0tPhmcfvOfdRlq
         7rgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604978; x=1787209778;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gw73m5PwUErvfwwmzv0TlDv6S2DhMcVdC6Gz7QT0ok4=;
        b=OKL2No7KK+pI45XIQ7dNUquZyTC2WWLRaq2VMIPz38sJmdJXMWUmDV6x0a/ldg+jOC
         9xjDMMNtuQbbUuz9c/me7lR2A6NgOJ/R8FlHBRrWFe8MLnVQa0XC7avA/WfejT89uCEK
         keFy+q0oY0HtASdwFXamHz4OEDGg9god+TOznyHDnCgRpK8E4lfoTpfG8ZbQ69+Egdnt
         XcADUyj0gKNkCOEmfb+UODgReYpL37wL+ZDRYUxxt1KL/qNnQYNhXhALMe/gA03d5rN9
         tHXrybz1MweOVivZd3jIgqC4dHOlVh9x2F83SL39fNYcc/YuGXGOpUuqlrl7HYaZJVVR
         kKYw==
X-Forwarded-Encrypted: i=1; AHgh+RoVrVOz8FsDTTJxGcOTCKy2nDB5WsUN7q+8B6U5NvMjpJ2ztRIXDd5mNDKB46ECUOR61HRQ49qCfU1q6drZSTo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw0SHpauUbKbi0UwnY5GD+UcJ4g5SDqP7kVE17jTFkUjdUjai+
	7qsHtfAAq9KRDzBiW/1jJOe1WDoBCdrJi9EJmRdauKfqfSEd2ionTeu4
X-Gm-Gg: AR+sD10+zAU6uQDVSm9nBpN1rXTMvd8t1qbXlm1+XTW9A5XU6qVCGdHAvVR6NVBA6Ua
	ZqMKtV9zllS/sAzwoDZBkvaBpfXf+1VVpov8+0OMEJtfSpRHIrbr5bvU4beu1uhMilz+nWIXZzs
	eVYmBMJKGFxsIfJJ3p7M5z5rbTzkRSzYkNHWh7Y9oZ8updHF6DP1QOl6KG/4XQdwoSBpwHVYSLp
	L2ecPTvPkH8HtBtXX45v9UgAfIPpEu1BI5QV34npbwcJlAy48NvvaNtygMo3h1oITRdd0eVIML1
	sHim9/wwi7opwFxJY94uYuFDQ3ZIto5NQ8TjYmyxlM0Mv2HlOd4AQMXOx+VRMWmpLmUrvqBdeJR
	h6WjX5omZYsvP+LakMJ4J0FF9J8MTZxL/V0YfdCo3gh4833FjSInkxxPkXFQ5iQD0l02Wf28Qki
	u719bR8RDZWWv/t8dxEjU9U1ymiRA7Jl7UnjFYLbrvz3F+6nXxtrfv
X-Received: by 2002:a05:620a:2804:b0:92e:76a1:96d3 with SMTP id af79cd13be357-936bfb36a6cmr330873485a.34.1786604977813;
        Thu, 13 Aug 2026 00:09:37 -0700 (PDT)
Received: from localhost ([37.19.206.57])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936c1b4d57asm86530885a.35.2026.08.13.00.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:09:37 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:09:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Justin Tee <justin.tee@broadcom.com>
Cc: Paul Ely <paul.ely@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: lpfc: remove unnnecessary NULL check
Message-ID: <an1trOAUeQmYEus_@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "evt_dat" variale is non-NULL at this point so there is no need to
check.  Delete the check and pull the code in a tab.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/scsi/lpfc/lpfc_bsg.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_bsg.c b/drivers/scsi/lpfc/lpfc_bsg.c
index c95165905483..7354ae9ba8e5 100644
--- a/drivers/scsi/lpfc/lpfc_bsg.c
+++ b/drivers/scsi/lpfc/lpfc_bsg.c
@@ -1329,10 +1329,8 @@ lpfc_bsg_hba_get_event(struct bsg_job *job)
 	else
 		bsg_reply->reply_payload_rcv_len = 0;
 
-	if (evt_dat) {
-		kfree(evt_dat->data);
-		kfree(evt_dat);
-	}
+	kfree(evt_dat->data);
+	kfree(evt_dat);
 
 	spin_lock_irqsave(&phba->ct_ev_lock, flags);
 	lpfc_bsg_event_unref(evt);
-- 
2.53.0

