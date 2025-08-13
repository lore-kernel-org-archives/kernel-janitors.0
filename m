Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBA52D0C8B
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 05:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755064155; cv=none; b=m4+O7f1VkJnyEhf5ThoGq4XEZjcKl7wQ2EHqR+hbFxtFXsiIdlEENmZgo+yTwhz80PyQvtszeUwFPG2lRyHoiOKPh82LzY93nhEqgR5LQNMaOrlZQXx1BGIVIVh7uODcVWCbISU8dj+TVanl90xSQmvQpQMHQoYkBuyWmolZ4pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755064155; c=relaxed/simple;
	bh=5XEzjMGKnaeMJFhQb3Nwzbat+idzevLzr/emeLMFnok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Drqic3y1WSI4NibVb/bzzZB+vHg547wn1RtZ2AsXfDJZzA5RPacZAMwLazW4Z3BRDQn4QIEJbKbvR87DpU95eVY8FcBF7LVx6Z7M0RlPzW27MEDNlMq0Zkjkt9KJHtlEFas7rmRE0TjeUxbDBGpU4puRbVCdQ//VXdU4WvNMnXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MmliNpgi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MmliNpgi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b7920354f9so5039640f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Aug 2025 22:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755064152; x=1755668952; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1NATFWYnL9FpvCQHaSEVWqiysmgBFz5wmTJhKI3JDuA=;
        b=MmliNpgiE/VmRLHxzAL0+iYkaLFqIm9XMYYpGoXkcCzDp1VE3K+5MqRTwqY2MKT0Q9
         UYnD9ZkOVjPAp4HTLJhXxtFsHVPDPteUtVL/XEwK3O76gkIdu9eIPT8chZnbMMee3UDe
         kgfaTZBLJdvKhFVU6dosQTRlRlIFc912tK4LVFnWyAw6pZtbi0yQDPY1v1ISCAOfI7qI
         c53Ibvhg6ZSTjr9Rh/495y5pbY4h6pNnxfBCweBdFFFAXJgmYckQe62/un09B3tv8zBJ
         TV+9qAhEu1s+WIJTCdJkixR601r0p2yuSpfkuLxbJuhRu6RFSnVIe+O+Zd+YqWP+xh4I
         38fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755064152; x=1755668952;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NATFWYnL9FpvCQHaSEVWqiysmgBFz5wmTJhKI3JDuA=;
        b=H+F7o7FHCBHDGUxSbAxyvJJsXUP7q9MiDyx6jMYsd0+m1T8W/6FxIwHCbJ0cchQYaV
         3ugGeyp/jymnfyecH4+Ihm8DVD0Ekc/G3oi7bWA5fKJR4x0lcED2eyoxBBbNaW34ucvF
         DAWf0vBIScmGLDLxhazvnSgSStxPU5l8F+HKsd0bvNyf8V18RaCYCQPDZcsHYF3m+CEI
         f+iXkTlWYZYE36d4/SYEMXelYI2ax55hKjlwb85FcV0y4RuOTNPT4MnGFfTIhJIVyU9K
         z+9kJiFLxvslvCwJfHLkzOduM3OquvpfOfQonN7dOUCipCcFJiMUWd0A9Cv9putqwz+y
         jeig==
X-Forwarded-Encrypted: i=1; AJvYcCW4yuheueYdVd5vqCdArOpWDY4YUaqAHGEFTbtK93NyqbG0ctYrFJVhqqggllXFw9aewnRa83o8ynA+MujAHJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmXXHLfdaD7KKNZd+Qr8PILJ/suBG4KC1mAGu3BHam+NAvfQSQ
	61NGeFuhDcHmSaim+1rI7YFS9z+Y6aSrbMQTN0AIoFwxDlTcdgHy86eU7JTyz1t3Q0Y=
X-Gm-Gg: ASbGnctxNKX1qrDvzWa9+csJOSpwE5Ucb+CWpd56h+FjUeOOmgWITdZchtIdDCn44am
	p3IxmjyZ84CnIufDSGJDC5k9ZY2pjMukZF9jlzAB6JSZJg+YrODak3cMAftwh1uTz2ZE1mu65WF
	4u4ZwErFGV00CCPTkypc0lyO4inKExm0nij8PYPKh35r2gfHa942IwIMni7tmzmCrtXuSodBqNc
	VdJsq6up3aSX+3WpWfp+7SZu8DoD5uSZwMH6ZgKZQSyu/qWrpGaVdWMHK5cYrhN0aLEF8C+lGOr
	hDW4Tjh/7080BJyBiHUVunHaefBAYQVf9p2Gwpt9Wc9s44hXvBkFlAVMWnSNUD1QmPs2Kc9MpnA
	MhbXTvAu1jsj2Rf03vbP5Tlv57lFlmuovQfI1sw==
X-Google-Smtp-Source: AGHT+IFDvLxnIU17Hp8mu8s/hfxqo91PU/ydIDKmiqnIJjDK4g9R/0BJmMQ3yTeiQ09ZscNds3uIlA==
X-Received: by 2002:a05:6000:4205:b0:3b8:d493:31f4 with SMTP id ffacd0b85a97d-3b917eb6c5bmr1136780f8f.48.1755064151797;
        Tue, 12 Aug 2025 22:49:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4696c8sm45376480f8f.55.2025.08.12.22.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:49:11 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:49:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mike Christie <michaelc@cs.wisc.edu>
Cc: Nilesh Javali <njavali@marvell.com>,
	Manish Rangankar <mrangankar@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	James Bottomley <JBottomley@parallels.com>,
	Ravi Anand <ravi.anand@qlogic.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: qla4xxx: Prevent a potential error pointer dereference
Message-ID: <aJwnVKS9tHsw1tEu@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The qla4xxx_get_ep_fwdb() function is supposed to return NULL on error,
but qla4xxx_ep_connect() returns error pointers.  Propagating the error
pointers will lead to an Oops in the caller, so change the error
pointers to NULL.

Fixes: 13483730a13b ("[SCSI] qla4xxx: fix flash/ddb support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/scsi/qla4xxx/ql4_os.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
index a39f1da4ce47..a761c0aa5127 100644
--- a/drivers/scsi/qla4xxx/ql4_os.c
+++ b/drivers/scsi/qla4xxx/ql4_os.c
@@ -6606,6 +6606,8 @@ static struct iscsi_endpoint *qla4xxx_get_ep_fwdb(struct scsi_qla_host *ha,
 
 	ep = qla4xxx_ep_connect(ha->host, (struct sockaddr *)dst_addr, 0);
 	vfree(dst_addr);
+	if (IS_ERR(ep))
+		return NULL;
 	return ep;
 }
 
-- 
2.47.2

