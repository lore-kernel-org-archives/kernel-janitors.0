Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDB1344046
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815961; cv=none; b=FvcrKL1o1ZFFIrV/4KsbCzh5NjCH5ODw+Bi0lJkyTpqpA0k8pKo48ofTmDUmkUrvdmnWMlqjYLcwjbJ7vaFOFlDaPqLEl/w9fA8YldsGsVWwmBIDVWiDNIoHdG3qiZ0U/QpIZxGyZtMr0Ghqk/dXL3e+gcnAHddzBKxUdjqVqKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815961; c=relaxed/simple;
	bh=ypR0mAofSNl3wnVL/4GqW8vs2zYZWGoCLzM7ASQ0LEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEscFcBpEMfOLAaEloOD8I/7Q0AhJ4DX7nOYFgNU++hS2iHM4fs82wb6lBFJOGv392YzPnG/w8W9bIgD0q+0oY1+E+/f/wQGkHpweBBBs6XkVbEWeRH4DZsEb31G3d/WJY24PrrqyR7IBHTjOG9fmD2OxPqArKFIzhUStNLWlps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NA4fupIh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NA4fupIh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so22713635e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815958; x=1776420758; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+FxQmBox90UaRlKugkSGgbN272DB6wwpiVADHns4y7w=;
        b=NA4fupIhXrcExysXZrpMr3rNCl5bZjdpYkh7O7bjE/e7g1PvJPY6IU3DalbUVG6Fr2
         QaTYZhd6RP7BPGSCBrZzVCvVEFqJiSvDFqjxTcONY3iSkVYCbdXO1DOkDTs9idW5mZT1
         xwPbx31Bp8gR1ljLWOyuBYfhN94IG6cTVp0ttd3QIodykh2JQm7O2/UmqYM3dtw7opUJ
         vPGqnG8szPkWztuSgTioDqZ4Rwn6cQN1SJsseWZVEda60kDlDDx2ebWNgqJVw3nwpwSU
         WVttoKu5IwjsTdQ1wuX6YlDFaPgp2AgotLUxlwjXPAmE9zidT+6j2hdFo81vnptkUGwH
         jL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815958; x=1776420758;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FxQmBox90UaRlKugkSGgbN272DB6wwpiVADHns4y7w=;
        b=GkkFsC+NiU3kKE1ka2+Pz0z14L8fNpyCGDs+GFV+7wW6BR45zDJr3+VBBeNKUtzqov
         p+uQ3psFWXaRxEwnk4DtMYOAShjpGtcyrhKqu6dhVYvooRz//jXTCG5PirOfWb0nrykJ
         z7uxl2cL07TWiW1enK/satBSpZmWyPJNaABwOBz6FIhb5gBuennW0eCB0QquNy3aTNCj
         CQnFNmuQf8DexBsXv1tOj0LrfTOoCJd+21t2Nh4S81uLXB7amIchgj4sK3+9H3znUenh
         qcVF38qdpgq2Aqa0uITeYstmI+VDlN+YtyHE0d8zUvZ9XX3KO/NmNW+rs5tFzuZ2m9C8
         LKPQ==
X-Gm-Message-State: AOJu0YxFMWAQFg8T4kIwZ7Jx3yrZtZYNnkYtJ4cB2FTqYIdwT3ChAmmO
	2njGz/OClw12n32MgYnYlWTUpOi+c67OwlMnsZuwMofGWM6o8ElNfydp
X-Gm-Gg: AeBDiet2XcDVmZjIjJYmBZGY8MJwzg5R9g/7lf9zM9LJct9/YrR9i74l4EKds4vkrb8
	Cjb1jojGVPaTL4btALkDHwcZXGMJZuQY28U7Id/3RQo/pngB06lx99Hj0+rF3SIuOUY1i00umd6
	ZQDt1RPoi3DNJrsFYRI+RXcziOVoZey0SpqYAavDtTlgPJwOwauj7eWCrrz4jgZn1fZDFYcy/QI
	1KF3KidupFNw8R4c6arVls1w1LEU2Z8cocyaurrJv96HJI8n3cMslOgMdZDrRbrJgR7v46Yqiuw
	79THOQKrrmy3HNuFkwd4Rae+iROGA9MFWWNjihWTmEBxKGKZxxf3oyxjOyzGLBfMrCFP1Uyt25+
	hp7fRmvDLstOo5SvBxXzDTc60nz80AbkYNRQ8V4QxbgKyCPWt6W1QKvFLPS5dEFJhmiH9gMEUMh
	v4VaxJ3CbshVsKBLjOSPc=
X-Received: by 2002:a05:600c:1987:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-488d67bf736mr29341215e9.5.1775815958266;
        Fri, 10 Apr 2026 03:12:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm6596419f8f.13.2026.04.10.03.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:12:37 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:12:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Josua Mayer <josua@solid-run.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] mux: Add helper functions for getting optional and
 selected mux-state
Message-ID: <adjNEl0C8OgEjMI7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Josua Mayer,

Commit 993bcaf32c49 ("mux: Add helper functions for getting optional
and selected mux-state") from Feb 26, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/mux/core.c:640 mux_control_get()
	warn: 'mux' is an error pointer or valid

drivers/mux/core.c
    630  * mux_control_get() - Get the mux-control for a device.
    631  * @dev: The device that needs a mux-control.
    632  * @mux_name: The name identifying the mux-control.
    633  *
    634  * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
    635  */
    636 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
    637 {
    638         struct mux_control *mux = mux_get(dev, mux_name, NULL, false);

mux_get() can only return NULL if optional is true.

    639 
--> 640         if (!mux)

this should be if (IS_ERR(mux)) {

    641                 return ERR_PTR(-ENOENT);
    642 
    643         return mux;
    644 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
