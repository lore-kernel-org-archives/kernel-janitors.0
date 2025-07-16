Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3E92C17A3
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Jul 2025 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694714; cv=none; b=Gq4b5m8xlSqDA6otAWLcYB9JYwaawwX4OECf6yuUn8JwqptvcBWZMC1g6N/kahFi3AksHuC+w/RaQUo4gFIf9KAnxc2Pnd7jE3/OynuJBO1fn3BU/jOIn92EUHfZHjkWDs1jDu+elkllIx5NODevlUlrtxou1WgFiQ/9QOKF5Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694714; c=relaxed/simple;
	bh=qBZKX2956ukvORxdELqOdgFCeXzBVdKSn4mzJh4Mluw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XdUAqKZvduxD253t7UDARso9VGPeisTTPZHwMB0kIii6YU/ohIGvrMsXHL3PIjteWHUTw7n26exL6cVtJlkmFw6U9Fxg1OGiZ4VBXIbSmTHp7Kvi4v2kKaV9O0LXzf8ozGuf3Ua2EEQ02Jfhgg8cJXoU1tsxBCE4GH2haU7MQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ILw2fl73; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ILw2fl73"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-73e64e87d49so140377a34.2
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Jul 2025 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752694712; x=1753299512; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+FDBRSUyUWWqwGhcMioNN7CsL8+ZBOGwwYv007xVH3I=;
        b=ILw2fl73KH6qgLrxDttggQz9vvHPxvSPvkWzGnlQc3c2tK83IMRvfjIi0Wa4rMmtRC
         XvJjSTbIR1f/gydT7aOn4TYmSZAjSQ/0tMnGse1T1afFseztxjzdes99ZzEgPVrf34r/
         5pLuMFgPdTWxNhBO+U8AKUUz8ogZtzo+Bp9+hyCMy+i49LapbUl0sKyc8VVzh5IlurmF
         sRIHuuMlCmRUyZbMs1mXiaNV4NZRCQ8N124sHtxkQvG8DbZadG4vA+0Tfcot/yvRfazq
         En8bn8WzLE0Ouo6A35v3kI0C5NcFU1h5sGTt9wdKt2Gt/Pn4MJXPtDnva4e0EN4+V/yC
         mZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694712; x=1753299512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FDBRSUyUWWqwGhcMioNN7CsL8+ZBOGwwYv007xVH3I=;
        b=mlVe3PSss9ykPTYdI+29yT+fL3/yDJK9Ufi8f7Xbs4QJr7MEXzkHx+XaJTZ+LX9lVe
         RyDunBDvqaJD9Waulbe1uS/iqC507iU2soeSvjNFYE8Vluz5+nYMZNK9NR9bMWu6o990
         RTVb3Qs288avNL/V2MwhUlrVu3t7rgUUoXFVnBVewK0tyw2oa52Gm4WrpQeyjFflIEeU
         0DxDAweEAzvdbH+TRKdoNZY1dFv5Xbl5LmdJLuNryxnNU4Zh/eJmbTF7/IyGOt804k+Q
         eLsDA0C5QQNhX3N/KQItKrZu1J9HmFMJ+abfaS+PiBTo7H2YRfUWIjbj29voEa/3IFA4
         n2yA==
X-Forwarded-Encrypted: i=1; AJvYcCU6u15tsJ4E65tPLOUKIR7hxw/gPUQBHce5h7evHRfkvtQq/JFeWhgCA5WkGmYKAjhpGCd/mAK5/gSpTuGyUT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRmnHAgQnk07ZV3Hm2m2TquyFIrDI2YRfPk6HTHCHPeJLU2ctc
	lQ9dTqsPHNwOgZ8Fz+JrZzOvZkGKmT8BF7l4tlMqus7In0jYAXW3VbFqVmHp02lYsXE=
X-Gm-Gg: ASbGncvjwfiiv2BasEHDsqOwR3rPK7Ozj0jh7G+QNDA7ba5iqwo1qfHuwYKk3AoxlxT
	YZHSTmNM/aeQb7/k10zDGsFecXTbBay0D6/IFoN0jQnnnMG8LSALkCeDNcs+hLng35QXDPeUlEO
	ZAZlrWtZDMxyQf4q+gLL8dYKyOAonWyVzkjPbNptx0d3CG92v3rr+prCa4HYsguH4b1KmmeSwVI
	MprcYo8QvQQZPB0OKK49WztkDI7R4DILad01g/vwU+xFpW+KchIAHtseFu2yTpgPphteGtQlRhl
	++mexCwuw5N3NGQv+utXXv2zbN3nC4ZshdNwG69hNEkhVHYu8XQqMeCtTP+gGjCeeZPoAL+P1UA
	HjNQC5FLizI74p9Uf7/fFHlclqSHVtLcqd6X3QT4o
X-Google-Smtp-Source: AGHT+IFDI6CVXcKUhCo8LLXFkhb8W7llthuk++X+kRQ27Rn5k1+Mxpsptg2j4SfLdKCLpbJB6uge2w==
X-Received: by 2002:a05:6830:3495:b0:727:3439:5bdf with SMTP id 46e09a7af769-73e665e298amr3267794a34.13.1752694712246;
        Wed, 16 Jul 2025 12:38:32 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73cf12a4bb8sm3235273a34.45.2025.07.16.12.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:38:31 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:38:30 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] coresight: Fix a NULL vs IS_ERR() bug in probe
Message-ID: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_ioremap_resource() function returns error pointers on error.
It never returns NULL.  Update the error checking to match.

Fixes: 26e20622a8ae ("coresight: add coresight Trace Network On Chip driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 0e4164707eea..d542df46ea39 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -183,8 +183,8 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 	dev_set_drvdata(dev, drvdata);
 
 	drvdata->base = devm_ioremap_resource(dev, &adev->res);
-	if (!drvdata->base)
-		return -ENOMEM;
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
 
 	spin_lock_init(&drvdata->spinlock);
 
-- 
2.47.2

