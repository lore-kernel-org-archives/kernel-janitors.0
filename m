Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F497249F6
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JqvRT7r7"
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048D1DF
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 06:05:10 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so7692088a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Nov 2023 06:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699279508; x=1699884308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KalBKrt5hDCEZ5KOndx2CJgyQr+tj5elv37LBgFk8uE=;
        b=JqvRT7r7nwGFKtSw/9DgSJQkxXIGV1X6E7X/nCmBYF8qoStzz4t38usAzMb/vfL7Gy
         OciUYamBvwWnKzCOlsqY7TscsByJFJFPAINNaHE80C7GU3d+OwJr8bZP+stzJz7pjpMo
         bIEYUDSgzw0B2tm9I1OcoYg2HaSqzW7CynERfWfIpYj4NKIYwWGfhyMqVNc3h3MiOeYd
         9flANJfaPh2xCEG+/raVAZP4gVlfAjrtot7g7jD6arGVCqT+C73hKrg60/nTRNSIls7y
         bspYq1ZVzQO4diDae65Ck9ijcr7VbQIhir5dlYWh/eWxYiFo4+3cJtGx8ugOAkLnBli1
         0k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699279508; x=1699884308;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KalBKrt5hDCEZ5KOndx2CJgyQr+tj5elv37LBgFk8uE=;
        b=A43wlC3qff2BNgrVisUtlnwDYuyY4yRtQDjwoHU9Goa7aFnuTtv64tKDRdCHhKM1aF
         xOLnn284hJoKuHBCUhasibnMzjkey0yQXwYqjbzHGlwH8htL9Kl+wfal6yKnExvHcpPd
         pK0XcJp53qicNGB28HLG+/HqKg3HMc7JSmZeOphjGC8z98BwF+Roz6VbUc+lmV5W9xSS
         p0ByRA+LEzkkw54eZRJn0O9wjuZAePALfTX6kbC8kLiHJw7DikTZM5YdzRT6GcX60VJn
         cCEla3gqdGMPZbbAApdB/JG++CY4q50nR3CTXP0UY5U7Cavxt4rdJyT2wT9vDsA6ZBsn
         Djww==
X-Gm-Message-State: AOJu0YyKy+LL/DU7RL0lODUfrKf3Bl1nYtBqQ0YOZuDznE9/BpSvu0JG
	S85CgX5oGXDVPABWgS8ozL/GdQ==
X-Google-Smtp-Source: AGHT+IGAER6GR4FrIdU6at0gU7TeaMmHHbaLxhCkoIMU2j3SIUoMT+g2zyoNcwMsXt1fLC0GQosuHw==
X-Received: by 2002:a17:907:30ca:b0:9ae:3e72:7c72 with SMTP id vl10-20020a17090730ca00b009ae3e727c72mr8816811ejb.58.1699279508482;
        Mon, 06 Nov 2023 06:05:08 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id qu28-20020a170907111c00b00992ea405a79sm4114626ejb.166.2023.11.06.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 06:05:08 -0800 (PST)
Date: Mon, 6 Nov 2023 17:05:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wenchao Hao <haowenchao2@huawei.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 2/2] scsi: scsi_debug: delete some bogus error checking
Message-ID: <c602c9ad-5e35-4e18-a47f-87ed956a9ec2@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7733643d-e102-4581-8d29-769472011c97@moroto.mountain>
X-Mailer: git-send-email haha only kidding

Smatch complains that "dentry" is never initialized.  These days everyone
initializes all their stack variables to zero so this means that it will
trigger a warning every time this function is run.

Really, debugfs functions are not supposed to be checked for errors in
normal code.  For example, if we updated this code to check the correct
variable then it would print a warning if CONFIG_DEBUGFS was disabled.
We don't want that.  Just delete the check.

Fixes: f084fe52c640 ("scsi: scsi_debug: Add debugfs interface to fail target reset")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Add some more text to the commit message about CONFIG_DEBUGFS

 drivers/scsi/scsi_debug.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 0dd21598f7b6..6d8218a44122 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -1132,7 +1132,6 @@ static const struct file_operations sdebug_target_reset_fail_fops = {
 static int sdebug_target_alloc(struct scsi_target *starget)
 {
 	struct sdebug_target_info *targetip;
-	struct dentry *dentry;
 
 	targetip = kzalloc(sizeof(struct sdebug_target_info), GFP_KERNEL);
 	if (!targetip)
@@ -1140,15 +1139,9 @@ static int sdebug_target_alloc(struct scsi_target *starget)
 
 	targetip->debugfs_entry = debugfs_create_dir(dev_name(&starget->dev),
 				sdebug_debugfs_root);
-	if (IS_ERR_OR_NULL(targetip->debugfs_entry))
-		pr_info("%s: failed to create debugfs directory for target %s\n",
-			__func__, dev_name(&starget->dev));
 
 	debugfs_create_file("fail_reset", 0600, targetip->debugfs_entry, starget,
 				&sdebug_target_reset_fail_fops);
-	if (IS_ERR_OR_NULL(dentry))
-		pr_info("%s: failed to create fail_reset file for target %s\n",
-			__func__, dev_name(&starget->dev));
 
 	starget->hostdata = targetip;
 
-- 
2.42.0

