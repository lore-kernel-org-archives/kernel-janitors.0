Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7571C1D07BF
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Oct 2024 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882395; cv=none; b=qUAvJfcMU1SV0aLu4odabu8kWDSHcp1r7z9Xb6P/Ttht+PiGMcG5l/r8FxxGd6LB1+XClF+zGgwLXcfXmzCwrXM49tfAdc2P3y3AEAaz6fAESTOtYfg0Eus0lKhH5b2GqP8NMMte1qxUHQCwAqrqui9yI+l2/3v7wEIQzLdsGU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882395; c=relaxed/simple;
	bh=tJmRXtMgoH7V2C0AIUlx3S4U+jhYAOFQkLhoTK3Ch0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRreZaQ8cKeFOBIxvmoQs3Lxyv3lg1g4kQQXo/5gL3cavGdX7bfjExYM6ElvgQKX3jGSoUkKsL6bqkdFCFm649Zlt0x3uy6vfiv4gVlM5GVi7dXKsirYtOTmh9yFYmpmVhHjF9bUDrPDu3Tup8ZHKpihD7npSuUq0WV30WpPjMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XZ26PI5u; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZ26PI5u"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37cc9aeb01dso3970226f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Oct 2024 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727882392; x=1728487192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4iYwuA9hgfep/Dvx4lTAEoXQ/WVu6bHINdS/o14C5a8=;
        b=XZ26PI5uKkIL+27LT4Bp5H67FdWDHPO3EsbnrBvwg5RxAHMdBxwJTz2simg5rP4DSQ
         dNVB4CYg2vS8UetiT3RDPqne1DbAhr7SbZWw2XRyXG7+Gto5vrRDf4bClGk/240qYKAf
         tqc9/xUiqRY2Tf1W3JD5KEO0xaPcYZ4pzm46dSWbKwzX/Gpoc0XAu1M/qJ0F6+58wu/N
         u1+HJlj/STH3xv4Bq0sKyZ7a7c1jbEQsAEupApLSWIFP29c7QPJTY+rYp/Hwl1DA0X8w
         DOwLoysBb2eshEYazk5JTTm25gfFpDTsYLnmmJiksTN/JdCB3nas0jzrDn7y0EZouzCy
         YgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882392; x=1728487192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iYwuA9hgfep/Dvx4lTAEoXQ/WVu6bHINdS/o14C5a8=;
        b=gRUohbz6mHzdqvsw7jWChK0Itf9L3hTd1fZsFf8xtaRZ3J0puTdT/7KrEfR6/TwNWX
         ViVz3gEM8lHf8DRXWXiHj95aShHU9fW4ljZyx5co1GPySk2oH8kfS0BPFmdxuhscEZlp
         IVKzbR+gnWAddDTtx64N9puZ/iQUTzK2Ofh3t7jVMwaPuG6kJpYrycCRxDMS7jMYqfX3
         xc3LrCShcXvQSIA4LgEWJMLnvewPUZ6fGT8uN3TUZWOgxpU61mVHfzAYrrLjlGZY9fQJ
         eYrL7SH5SZJ3vf3yn+E1Qt2WS2AbjEk0eXNF5CuqTtHvPNcp6Xmkgh6BecXcdr0OffET
         756g==
X-Forwarded-Encrypted: i=1; AJvYcCWerjbQTsBQ+2jIpzbN6qZLNKGxMqAp6/Xo5FbkC2qDoOgvZfoHE9EpRofEziQCWAlGpoMfWmDEVukX4hTbx78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6V7BO0XSmWhxLxfN946vwOCDX76ot3lUKa9NhOAtwaze4sECp
	HsNL91snuxokWadtLLEZuHF7exabKDJ8DjgJg8AZghjRwG5aLduDCu/NCvm2a1g=
X-Google-Smtp-Source: AGHT+IGfDh7hi7fY1zeOwnwALRl6OclWNsLoaGzrpxiZg049EwIgrP4BhhtRWzKKp4bXmAMgnlyfEA==
X-Received: by 2002:adf:f34b:0:b0:374:bd93:9bd4 with SMTP id ffacd0b85a97d-37cfba12317mr2003007f8f.56.1727882391798;
        Wed, 02 Oct 2024 08:19:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a02eadbsm21230925e9.39.2024.10.02.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:19:50 -0700 (PDT)
Date: Wed, 2 Oct 2024 18:19:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] scsi: scsi_debug: remove a redundant assignment to
 variable ret
Message-ID: <191de70f-b019-4329-8e93-ea142aefdc7a@stanley.mountain>
References: <20241002135043.942327-1-colin.i.king@gmail.com>
 <2be706cc-0944-4413-b1b0-52d34fbdadf8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2be706cc-0944-4413-b1b0-52d34fbdadf8@stanley.mountain>

Generally, functions which report the number of bytes copied are an anti-pattern.

	bytes = copied();
	if (bytes < 0)
		return bytes;  <-- forgot to handle partial copies

	bytes = copied();
	if (bytes < 0 || bytes != total)
		return bytes;  <-- forgot the error code for partial copies

	bytes = copied();
	if (bytes < sizeof())  <-- negative error codes type promoted to positive
		return -EIO;

We've seen subsystems move away from this.  Other subsystems are like "Ugh.
Updating all the callers is a headache.  Let's either report that everything
copied or a negative error code, but not the partial bytes."  Now the first
two examples above magically work.

regards,
dan carpenter

