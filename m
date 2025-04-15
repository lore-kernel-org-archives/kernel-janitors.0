Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B602918E4
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713916; cv=none; b=QVqQJhDckHmGGx1579CNwrVrl2C7cepge/iXc6+0a64dNOnSLo0eVsJsSa4rInJOQXssatvLxGls68DgZCkCrMfUn7KvDaTnEeeOSwJZkzetFyJgLy+PSIsht8Lne9yp8aVYUpYom+PWUu+4VSWfwx1uC0Ef7+15+tTbpxnBuag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713916; c=relaxed/simple;
	bh=fWybr2mbKY7qGwtYIZOqWE7CzXG4hHWRB38TSR3OKy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=av9QujiUvqhRiDFn5T8P28tWzcYEajbISiawT9OdUXaoBrSKBTVTfkYS9MnKef/BzF8V7V4U25nUPyoi1Nd3abmsZvNvvQLKap/8EfvCNBfkzeEGvZpG2BliabH6iiPv9LCWaz7kVd/nSZcmnzFcPVhTR4fjVLZcabAcW30r5w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RzX+R7ZH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RzX+R7ZH"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3108942f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713912; x=1745318712; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MK0WNbcSw4ed5M+cuZDVZvCtmU0gyT+OlvAi63oIbak=;
        b=RzX+R7ZHzDIYeuFFMHRllgaRq1lcrTbfv50CSffTmnYLsS6pIdaY/xpgeHbiWFWIPJ
         P/HnI4vbZkMsWL6KW6wm645WzX5BJZt0ytSwAUH0x3jIg/M7hoJ4pyr/dbnuGKBZj04x
         TS21bbDEPt/2Vn6tNURf7cfgimX7aZi11yeyjckmRxBSa0IVuWT1NE9/65LQXk3AEor4
         ZAv0Ok7Mfk2kAysc+EVxcHk7yvpqSCI/Teci0M/3Ofs6xlouUTX0J8bpP4CT3GDa7PQ0
         JV7tbBcOn7nF7DHv8UH9l1oyQXUqJKwWiOeA6s7oge6XMfU381VeHLqBXqkO3LSbEgjD
         3PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713912; x=1745318712;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MK0WNbcSw4ed5M+cuZDVZvCtmU0gyT+OlvAi63oIbak=;
        b=rXnjbB5XQO2qtgPFO3OilfG60W/BhbqdPiRCEwY2H22F6xIbVhhGluCIsWP4xobJKg
         KJ93icnlU/ewye0IZITTB8rMmLWEAKw90TMzwXLlzEfsaP/U68enieYzGSNZqiUzQTTs
         LNaLGGLgyyIyDh78VEuxrsgbMkK7MWheTuWb1r4VMxrrSafIBXD+qwFC8mtVaNOxTIGh
         kyrjdW0ekWOLGVkWGwkozbKI4L5FXLPuArYpQlWJfuCBVSFDNht+XinnCodUa8vjHX4S
         NgzlCsIoouSbPBJeXWmq08qvPzkWnOBfWjokEFiOpdTM/9SgXE91Ea2KQk1pJyBUeP9J
         x6gA==
X-Forwarded-Encrypted: i=1; AJvYcCUQepqb+BTu24nxdkSesVCIme7PCC45B6HvWe+EgTAc1UKoBADi3Jvw8GlIqgogebSdx5rE/SqIskwwIp1P+uA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbsT7D/jZSq81DM21qevQejrDwDggeLcvtV75g7FilH4oNZHba
	QXvWhLfSsVd/wiYz+nXWqZQh3N/MUIyuqXoW+e3CZUZrDVoeVr/If+Rg7XBqL3c=
X-Gm-Gg: ASbGnct0b9QVSWDS32kVOT/2dLTR2pcf/LfWbTZf8ct40C+G3MEZyX7Od8wWYJvko6I
	1v6rBDkWEeAHRrprVUw5+5A9y2xHynYXktDfVq4/bWCJ9aedVntHHEs4Bh7AQYVNGkAmn2aCKvj
	1ILwEWA/P9mCUTSP4Ba7RvBWEY9i/qf5mrnkVY7tC/ha9UG8r7ZwCwz9p1DSisFYaQyd9J2RWZv
	4l4feJRuhUvsIE3Q2bUbIPmSqtBme0nKVbqqryOZd4HCdOgNny8dvm6QE+0oRNMGc3eMHGC5Htx
	RJucWU3gMxG6OllH6lm3Y7i6njGpKzglDzSFpcQlzv3mrA==
X-Google-Smtp-Source: AGHT+IEIyKYv0BMZJodwyHmcwoGOgDdIqbSLHON2cJ+W/AbXoA9xLZFAvBmJ/hOGIRmJfI19cAlXiw==
X-Received: by 2002:a05:6000:240c:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39eaaebee70mr12627884f8f.36.1744713911750;
        Tue, 15 Apr 2025 03:45:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae964025sm13625378f8f.6.2025.04.15.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:11 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] usb: typec: class: Unlocked on error in
 typec_register_partner()
Message-ID: <Z_44tOtmml89wQcM@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We recently added some locking to this function but this error path
was accidentally missed.  Unlock before returning.

Fixes: ec27386de23a ("usb: typec: class: Fix NULL pointer access")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 3df3e3736916..67a533e35150 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1056,6 +1056,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 	ret = device_register(&partner->dev);
 	if (ret) {
 		dev_err(&port->dev, "failed to register partner (%d)\n", ret);
+		mutex_unlock(&port->partner_link_lock);
 		put_device(&partner->dev);
 		return ERR_PTR(ret);
 	}
-- 
2.47.2

