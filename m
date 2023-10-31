Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62917182A4
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mEYiSDYF"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CE21BC
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 02:53:38 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32f7abbb8b4so2270926f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 02:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698746017; x=1699350817; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzcHgJeME8SmvLN454BJ2f75d3TFJlrQAlY/l2HK+Us=;
        b=mEYiSDYFll1/nWffzhgULhJcenS803yMEQI5RBGRsP+WAXVo72YLCmCYQjrFRkHHbG
         abGpv9KrYZJQ9t+eFBDK86P21ss9bz/L8oE0Rx1Aw/fLuhAL62eglI/KFmRC+9nwpkTw
         roGnQ7LxYAw1b1QxZYzyJTMQt/RMGRVzTIH3V986zAoioQ0QldYCMLVFFSrnnyBVPg2q
         tluwMOohAGp3tb0fc8sEQnfjgX6HZabza6X2Kf+TOytGKgY2jO6oJ9ebjD2Q++4wqmrr
         HdBIY92VYCkSx6w7AnFhMqdjMZMGbED6ONJu2KOfs4RQhpmR2trj9aj7HwPIh9u446pK
         getQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698746017; x=1699350817;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzcHgJeME8SmvLN454BJ2f75d3TFJlrQAlY/l2HK+Us=;
        b=DD6OuqUXcOigen6p1CfRJKyszPXrEgm2hZI9lHGmWqSdkVrJhHESG7AKsoQXhNZd7X
         0+JMtyMHGQg74Ukf3vCW6GTKXdeJg7gyFOFIjYz+Tve/zyeI+0z4T1In36Vvo6Pc69n3
         JDtwwmVRp6rqDlLkD9SRSoiBK76hWc2gbVEfqyE2GY8qed1YcBjWaStsMAtExSt6J4lv
         HnUw/5ea9o+gT26n390a7IhB764WT+wygbgRZ2xxvwDCEPRSVlB6uvsqqR9qsAp87LFR
         bRpwA0B8e5AywY2pwPJUxnKCArxdoxZE71X4Xl+i3Q7rg+C2lHIJZHkw2bHtidIe9DLl
         RbSQ==
X-Gm-Message-State: AOJu0Yx3s/u2BBBDOHsQt0vJOczZ2nTWjrxhFECtvj8aOZ8xQvJQQtxQ
	/coltO4L8lO/v0h0Qz9WtuRWjw==
X-Google-Smtp-Source: AGHT+IGQ3EbnVgYbgH2NgwfDvLm3+nygpGdf5Agqt6r2SrYPqkaggyRBMRzQlA+p82ssNtqPOj1Idw==
X-Received: by 2002:a5d:670c:0:b0:32d:8431:341e with SMTP id o12-20020a5d670c000000b0032d8431341emr7738143wru.62.1698746016957;
        Tue, 31 Oct 2023 02:53:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d594d000000b00327bf4f2f14sm1073304wri.88.2023.10.31.02.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 02:53:36 -0700 (PDT)
Date: Tue, 31 Oct 2023 12:53:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lin Ma <linma@zju.edu.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Hyunwoo Kim <imv4bel@gmail.com>, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: dvbdev: drop refcount on error path in
 dvb_device_open()
Message-ID: <47a1e8bd-accf-4afb-85aa-c9a746561902@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If call to file->f_op->open() fails, then call dvb_device_put(dvbdev).

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/dvb-core/dvbdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 305bb21d843c..49f0eb7d0b9d 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -104,6 +104,8 @@ static int dvb_device_open(struct inode *inode, struct file *file)
 			err = file->f_op->open(inode, file);
 		up_read(&minor_rwsem);
 		mutex_unlock(&dvbdev_mutex);
+		if (err)
+			dvb_device_put(dvbdev);
 		return err;
 	}
 fail:
-- 
2.42.0

