Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20917196450
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Oct 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367339; cv=none; b=aEp0hmJPKiDVrYt4qHkf8VctZv3jokskskPLs85IkTGy9PLR65KJGJ553Dw/kfcnxxmSo8asL1LsT/NcYxz4jWRjer3FjsApJ6Fkh3SC8P6C8LyYHsoIrABIBLaLmnESsmCo805GDO8Ru8E2oqCbzjJ8t6H5agDSy4TNGn+EDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367339; c=relaxed/simple;
	bh=NpzT3JWDffonMgDLHFUTtvaGe33OX2pz/Vl1gjN1qOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2M0GCSyxOZE94y5tzMl/TzLE9RkgwgAjDOBE+oZDdxrpDdY+V8gL2tVPcRBkDB/dvDya7MmZ9bUodunu4cgfWCeI2TlZB3IRRdZpvXFpBXasPNuCg98wy+oe7BtBD+4IqYPl/n70AOHTjWmn0312y4o5DGNtohu7VYjpCHyVRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGy4Z7hW; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGy4Z7hW"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb58980711so6258771fa.0
        for <kernel-janitors@vger.kernel.org>; Thu, 31 Oct 2024 02:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730367335; x=1730972135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YhgiGZoPJM0Lh+sWMByCi6m5AEirWnOhOBuCUCkrPgA=;
        b=oGy4Z7hWEcJ58VTN4+lFFLaMyC9qBblmq8DVMTHv/cgAc1GvtB4qyHNLNFWqXqzael
         YYK7TtoCxipFqCKG7FweFzTYBfnvstXvAUrhj6BvScEd43uHK/0OE4zim5p4BbUwLaY2
         e38/L/J0y6XM9JG+d7BgAhwlh1vTFlWnHtDrJP58YQg66OWS7BjbcPEFvzVeiSQHEHeH
         4r+aJBP4z1bmoR2ifogKi+GEulMjgw63CcPeUXp3bz9NUIzEHb17WxVjJLlbwdzkAscm
         RRz/DwrXg+Jb8tIKfOmWdOQZV/B30mGu7jmInUiv7RFVKzfW3nyExfihOXh8k31JMf1W
         Ozxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367335; x=1730972135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhgiGZoPJM0Lh+sWMByCi6m5AEirWnOhOBuCUCkrPgA=;
        b=mce3M17SJC1OvkW5OE8LfJvXS7jvEjtLuyYtcIdiPXYgSSlrMh+g04Hctm39kXOwpd
         WFUUQK4GH7ySzGgzznYUmwDzcHbUMGnj2Y2mk8Zk5CZJTf4sciH4JQU6/ZHy2JC/d/LZ
         TC8bQASZGRslayNe7PczuwkZoMt5tP9yenCx2WTY5EmNEmIQQOjKlWwZsbpgtiUdKGQ7
         0D0+KKrvL3dj7ZJWJD4qZB8FbSjvitlfuLUmxANkdsI0ip3FttXb0RSN5uXBvYyFumgK
         PFb5bGubzR+g6d1WyHTQTh1y64tgNa+7wYVLtPGKyKTTPs5l24p2bveJUtrx4nojvcad
         tNIw==
X-Forwarded-Encrypted: i=1; AJvYcCUITUc9HB8rZtKHiroHEAdhAwSYlpBfsnVmAE1UBR0tvym7kM1ckW9SEO9PyIxIGfVYhnEI15Jzl1CjQzCw+mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YybKEtJPNAik7bXP8h0v/cYWYQnZnB6w8BY5GHVO0jVSELmIk3p
	0Sk7GXNDCf9hQk7LBVg+bprwMpoeUHegcdqLV8u5lKnzZCzee1v73mA86oMQ0+4=
X-Google-Smtp-Source: AGHT+IH0+JNp1lLF5VxJcufxgytij8dV/52O1hFK1UvQFy7QXqhMzwjcLwROl7GrDUg1tS78lPM41w==
X-Received: by 2002:a2e:9fca:0:b0:2fb:55b2:b199 with SMTP id 38308e7fff4ca-2fcbe0776demr65130691fa.37.1730367335063;
        Thu, 31 Oct 2024 02:35:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abf3sm1539406f8f.101.2024.10.31.02.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 02:35:34 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:35:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: serial: Fix use after free in debug printk
Message-ID: <8bad985d-4655-45d2-b448-2b3377a8438c@stanley.mountain>
References: <7d0481da-5852-4566-9adb-3a8bb74cb159@stanley.mountain>
 <ZyNI3rQw6q4pkqpD@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyNI3rQw6q4pkqpD@hovoldconsulting.com>

On Thu, Oct 31, 2024 at 10:07:42AM +0100, Johan Hovold wrote:
> On Thu, Oct 31, 2024 at 09:59:10AM +0300, Dan Carpenter wrote:
> > The dev_dbg() call dereferences "urb" but it was already freed on the
> > previous line.  Move the debug output earlier in the function.
> 
> Thanks for catching this, but please use a temporary variable for the
> struct device pointer instead of changing the flow.
> 

Why?  The output is the same either way and this way is cleaner code.

> Also make sure to include the driver name in the patch summary prefix
> (i.e. "USB: serial: io_edgeport: ..."):

Sure.

regards,
dan carpenter

