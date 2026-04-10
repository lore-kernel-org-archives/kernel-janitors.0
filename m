Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D0F345CCE
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816100; cv=none; b=EQ7WXnOHJv+UQI3gP4tAIDxRFiIlWJww7n0foPvToor9awGQE7ZATbNLnXSf7Q2niaVLA/cazKf5BStEWEJWe2sgAjioU5RnhCF40Ge2MY2kOyJgCO+q7UXyHIGThrFrDut7OZ0/BG3M2VqOeegpF9R0DqH4zTY/qggTkztQbSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816100; c=relaxed/simple;
	bh=IihIOiUIq6J3kKC+sZ83vzkP5vrokwK8p+1gz1V/X9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1jZxlPzmbkkXoTwjF/x573ribaMI4FbAhZA3Q9lvI6Nh9tTxbnTsrLgcu1/+6BCrxP5ZgmdTfxAK3Si19Th1VaArJdlGkJZ5wzl4/lf3xd1RjKdKF2WNkdn4RKVekjgfRGUQYkZmIUnoFZAgwnBKDH+2PuOpnRMMjg6d48BuNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdlzHwlN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdlzHwlN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48896199cbaso19723315e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775816097; x=1776420897; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ucUH4IDgpTJ1+uFHppA4Ul5fmREvzaKgT+OImbEPYwU=;
        b=kdlzHwlN+RxT5pculOX+gIL1NH1fNU4R1v4Ji1TurIHy2F0SLv9UgvHIuOYaA/7P5d
         9Ft+s4Uo/yQ4xdS3sWF9g4wYFwzYhd6PVExWVAxPxHbYURJy2W+woLmmEiDrE1NftgDq
         WInj5+5cEpxcr8YMBkFMbzidfDMqafhm1Nk1ayfg0XtXlLao6r9mm1eKdAUG7oFxRQ1N
         8S+nuNlc29FCu6oPsBI8cbmwj8ko9EC2Ax/ARA3a/JD08NMNZXFuEYHADutouSf3fHBS
         We3T0KmBdaPIDK74gydRiobQhlRp7p3Eg6A4lYccxP20xJT2Ftv7fRQW8gLwimzG7TrE
         xf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816097; x=1776420897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucUH4IDgpTJ1+uFHppA4Ul5fmREvzaKgT+OImbEPYwU=;
        b=tNVXYSegukoOZJwtqE/mL/5udAGI64c3urQl5EK3Y5fED8hi0iUFzJ4qhmdG/UdWM1
         D33b9R5oq8zJ0oJIEobk0semCTFDmDgykMgYuUzQXxIykYDUT2n8QcOwcsFBPG4Xzi8R
         emC7E5yJjDvOR+azTFIf98pV1vB/sgZmet6OPKYBo9aqmPvRDiBXZfkQTytAfNz1R62b
         snj+CHhlMYxTh6yG2zPt+7BGCFzu55TXTDZMzLvGGG5SXGxpJmA2NcrqVRyf7KuARJjU
         1hN2ojKNAw6yQz9IvKA3uh8tmkS9cvxLfxmag6a4BZ3TbhSDiS/SdEOSaOGO1N3OuASg
         LQLw==
X-Forwarded-Encrypted: i=1; AJvYcCXOAMAj+RwsUJgfCMKWeFZU2yOY9pssb96fVfhz3oqXZVx++IN+yex6e1suhJF3qdBDR4EE29hdVGJlZWvfjBw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzha6mLAQ+XQNwgo2N93+K4rHj7rCxDH1Fmx/hAzRsB+Utn9A8
	sWB89PuI/1RgiAV5bQnpgb6oUD+zGLd0xuSuq3t3XZMKPSj7VVKGbSs1
X-Gm-Gg: AeBDiets2C0gI6CwHOq8AWj6WdUy3q2mV0RdJUDaTyxC/kHpx8GHvKoF9SYqJqGOid3
	Dlg8tYOd7v0CWhJegjCfkK9l2sPWwWvqhOhvQf3xnFnLk0FMjoVKoCiLlN1IIq/Mq7k/C9tQmVa
	k0c5wUE7Yqiuzwkzgc1ONJq/QWqR+1ldzd9xKuvYzjitaDFf76XPZXcGSKj6Ijj93vTJtkGVde6
	NoD6fiOEPBSowLpQARp9Grm58+toVGgejifzajawqVOCitoxrATIsskSMLHWlGBkOslFKtuamF9
	yZ4IkyVQmHsbEnFX9f1vgoFIqzQiw9t6rNs6K4XCJCr2gfzPswFZ8t8StomY2w6latzJQpQ0GKp
	Zo7yZUUmT/TRrI5kaa6yUetDnjwoFXKsizEweIS7S1/lXLjm7SrrA0qoHwNSryrGqJSfQ0z7DtW
	WJ5jn3kas+4KCEe/XeYVE=
X-Received: by 2002:a05:600c:c0c8:b0:488:8bdd:cfb9 with SMTP id 5b1f17b1804b1-488d67bbbf8mr22272095e9.1.1775816096505;
        Fri, 10 Apr 2026 03:14:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63deb904sm6833358f8f.9.2026.04.10.03.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:14:55 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:14:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] scsi: bsg: fix buffer overflow in scsi_bsg_uring_cmd()
Message-ID: <adjNnMYK7A7KMNkA@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The bounds checking in scsi_bsg_uring_cmd() does not work because
cmd->request_len is a u32 and scmd->cmd_len is a u16.  We check that
scmd->cmd_len is valid but if the cmd->request_len is more than
USHRT_MAX it would still lead to a buffer overflow when we do the
copy_from_user().

Fixes: 7b6d3255e7f8 ("scsi: bsg: add io_uring passthrough handler")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This email is a free service from the Smatch-CI project [smatch.sf.net].

 drivers/scsi/scsi_bsg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_bsg.c b/drivers/scsi/scsi_bsg.c
index c3ce497a3b94..e80dec53174e 100644
--- a/drivers/scsi/scsi_bsg.c
+++ b/drivers/scsi/scsi_bsg.c
@@ -137,11 +137,11 @@ static int scsi_bsg_uring_cmd(struct request_queue *q, struct io_uring_cmd *iouc
 		return PTR_ERR(req);
 
 	scmd = blk_mq_rq_to_pdu(req);
-	scmd->cmd_len = cmd->request_len;
-	if (scmd->cmd_len > sizeof(scmd->cmnd)) {
+	if (cmd->request_len > sizeof(scmd->cmnd)) {
 		ret = -EINVAL;
 		goto out_free_req;
 	}
+	scmd->cmd_len = cmd->request_len;
 	scmd->allowed = SG_DEFAULT_RETRIES;
 
 	if (copy_from_user(scmd->cmnd, uptr64(cmd->request), cmd->request_len)) {
-- 
2.53.0

