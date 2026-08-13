Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6153D356779
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 07:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786605001; cv=none; b=Il+Q+QQWfC6q/FI9ZEv41yU6fDs7yF4IATv+UMmpUZOswi5VPkIZ+4H1Yc//E5J/ych+fYd2fyI7FgINR0vVND0uRu76byvlZmmSTQmfh0najZbwV8tRUN55YHtJRdf8VihJ4O4ajuy6IHl392ZUj/NzWF9Ba+ysAB/nhMyGtpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786605001; c=relaxed/simple;
	bh=KJne1rgMDBKjXfe3Af/5iFFfFWNTUfkTo2Zpqz8a9pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQzFMA8hPtjfc2UoUd3AJFHtcrgLFgMAT7mzNx6TrW/SFO/9wdqdAVsens10jXjxhegPctOlcRZY+20q+kFxM+/nuQVT/KbyCDEbzSEyaB1en73w58ELRtN6BdEdTb1Vm6bTCgPpOy/gMa+JJkuMT+NJ+mr4amR+Fdh5I/T6UC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7uJwcH5; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7uJwcH5"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e5c9211d2so29573685a.1
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 00:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604999; x=1787209799; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aycFV7zJuDJkroHf0KclKgoRIxgMjkD8YPBE6IvV4k=;
        b=o7uJwcH5Ga+Xubnv3VXRZyER73F448t/bO+zDlu8S6QvN05y2sqr+1CqLJOkJKpneI
         f6jyHTMJVE7QqX7M9+jbJHeeZFDCWFht9qG+J/PRmY7JXIHYufpVHZhY/pwv3LtkPguN
         Cl4Q3pOklCMM7D+KyuEP6qdi92wIjw+3wDL8Yul6D5u9PGHeVyoy4KcY5hAng31nppeu
         XcailLK8EeVIs2Ar60fzVap5N0XCStlmdPvyYPdivoi93r30hukrQwugkUly+5XgPo7K
         fhFT0z3jESOkAuVTMCjH61fYefzZFSnpic4IjPZXgIcFr64y6cV0ZHdpaASWkRT6/CgH
         yh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604999; x=1787209799;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aycFV7zJuDJkroHf0KclKgoRIxgMjkD8YPBE6IvV4k=;
        b=r3I/mv/Ig2cltsjNaHTgloEU9Y2LaFwZAzY1uO77yeu0XuX+v396qzsKr3lCgOKI4E
         rJ9cLEmJl2IFLZRH40KBbhUl3E87z62GFSZ5L5TvY1LnzbPOBR3cVon87yxm40b9iDNP
         vxyx+yTGAkeOP0foHMzVFhzrfG8gHL9HOZjfvIJFlUGUdLDA9wlOyF4B6u2mkktC+f7q
         yS6xJ4TEUHqVZv2lK0b1QtbBkbDAor1X8UTt295vQaeoGif/lei763ZtiRhQDbgalfpi
         21CCySR29FXPN6R6BGQOzEesTAkicniaXNh+9iTDB2EsOQ/IqRjRdUK+5zIk0g7TVk0o
         w5oQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFxqVwiXUM68KKzl7/MpX7MkseYNUlz3CB3nxWKio1M84oSrnZyv6i9RP0OWEF+Tp78vFauXIM4JwE5cJLyck=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXPSdPgtImyQGpTEYhdasCSeKqYTRG4g8wgoZLCQON5DsYUKM
	MtgYjNq9FWbd/NFTqFtOEsORBNTiEST/mgG5qhNPbpjPehZpA/RJLDdA
X-Gm-Gg: AR+sD13/TyD+/cm9Xozt0K9THm/q2GRtniBvUsZ663e7O6EcWh5kLLmrgue4MK1wU0l
	DzguG5UShMo131ukuB2TAIze+HnOuxdLC5vcKnm182TNNTb6AwsfP+E5uuHyGPPu0SqUh7gk2hH
	KCcDpeZgcRlFsmZoT71GEBSgqrNv7C4f28p0tN/skActztcyBdvBYm2JJqcug4s/B0gVB3Y+/nO
	tBWF7PC5oLqWW/KYoD0KDPp4HXT6RdGPxFGOjPON1aNx7exLsOvgkWQLNsjBQIuUKev7cmTehMc
	Q9ZhoNnrFK4HAOlrIYIJspgtyB8G7j9ewDcySLEljreD+ZEbOfppsGGGY6Pp6qSX6dSXpIaIk/P
	IxK5vGwCgnzt1a13cm1YJIsrcoxvzJtDIr8WqLjU8PE39RzTn/Rcn9WhlxgqG6oQrU8mGCF+g8q
	QFtXUJ7K0o5srlh7pq6eC0qejty+RmCjSCa2IGjefGKsARAvCYaPX6
X-Received: by 2002:a05:620a:5239:b0:930:b5e8:a40e with SMTP id af79cd13be357-936bfa79328mr242969785a.23.1786604999245;
        Thu, 13 Aug 2026 00:09:59 -0700 (PDT)
Received: from localhost ([37.19.206.57])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936c1b667e9sm86527985a.38.2026.08.13.00.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:09:58 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:09:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Atul Deshmukh <atul.deshmukh@qlogic.com>
Cc: Nilesh Javali <njavali@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Saurav Kashyap <saurav.kashyap@qlogic.com>,
	James Bottomley <JBottomley@parallels.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: qla2xxx: Fix an loop timeout test
Message-ID: <an1twcxTYSFkkUTA@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This loop timeout with "retries" set to -1, not 0.  Fix the test
for failure.

Fixes: 7ec0effd30bb ("[SCSI] qla2xxx: Add support for ISP8044.")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/scsi/qla2xxx/qla_nx2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_nx2.c b/drivers/scsi/qla2xxx/qla_nx2.c
index 41ff6fbdb933..04d7ab6ad037 100644
--- a/drivers/scsi/qla2xxx/qla_nx2.c
+++ b/drivers/scsi/qla2xxx/qla_nx2.c
@@ -3507,7 +3507,7 @@ qla8044_poll_flash_status_reg(struct scsi_qla_host *vha)
 		msleep(QLA8044_FLASH_STATUS_REG_POLL_DELAY);
 	}
 
-	if (!retries)
+	if (retries == -1)
 		ret_val = QLA_FUNCTION_FAILED;
 
 	return ret_val;
-- 
2.53.0

