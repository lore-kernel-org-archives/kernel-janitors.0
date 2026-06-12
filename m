Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF793C5DBB
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jun 2026 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781263665; cv=none; b=B41OacZDjS16wAbu5xHhxlXbEytDK98nD+plVNliDG4nq5saUi47Z2VUlZGwYagPmLrV1sCKg4nrbhTMgPGyqfk9swxp1eM24QqDt8uMShXUflXqvEhJqNbzIqP6zKWUMW9dE5XCMPlYHGyWBpQMvyxx4eH3CBekgvcCEtrdd3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781263665; c=relaxed/simple;
	bh=d+w2KM5PL5C2KimehS5Esc0JceN1aTb6ivn6DXuosrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Up/jA2bEMthAcGpIhUTXqntbQanNCHUAUv83ONezRSotJN0lfaOjl+PvKdOe5WkO98XqzZMDNyaNd0MibsfSLy2bE/6e0fH9uMlPoXBcgwFMCOe7mUTEao7H7rNRuctrUntHdrF8IWTBJe3dQQ6ZYJDoe6GCafQFJ0N3NET2vDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVmXynyZ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVmXynyZ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5176ca6bab1so10078641cf.0
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jun 2026 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781263658; x=1781868458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2S6USlGZ8AevZY+EuoNTTF7i0a23QNfsyQXA8t1ZiA=;
        b=LVmXynyZWchz8IhSL9dudd79LeuKXMVr9DY1NjGx6jZY9jT/ImwgYMclJFprtIjN6h
         ET21Z3rd+naPhCn2ur3J5Pf6t0jsBozDeiTUC2JtiCjRpJJX/ZftNNQiqxRIOj3CQQXC
         xoaTFQ2Z8tp9/n165lzwBsvTB6ULBS5TdPV4EOrN5H48hsi9I/vswBHSwjBTozxoNfAU
         x25+s0jeRZwUfb1zIutbvoZvCQ2u1Rb7eyLrT8gHhAR4QvzRFOR7aDjeQEBRURRXDLEO
         rZeoQdjWCd4bFHgibeVyi6CeJ5NXT/TPcIn668KhooJKQfgO36Wzi4yazXM/9Q6QuuWd
         UjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781263658; x=1781868458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2S6USlGZ8AevZY+EuoNTTF7i0a23QNfsyQXA8t1ZiA=;
        b=SHBCw9sXjNYJ6NJM6B5713rMLZy5Z1dREjCRU5JMFnCva0jm4Bso8GCIVmpGHmDT1I
         QdcmowOFatjCurpraIs8a2iMBP6aieDJEykSH+VfA0DA1UlPjAj3ErrmlbBZxVV/yNmE
         g2nlO0L0ATjYfk/4ThbnHmdUfFeup6+IoOQL5vjLYyf1HfSTe1tDDRtNTCxWNKevZHID
         t8Dui7OnzHD4R6SH/IGXdH6VT/H9UjW1S9vcB94TQzP4R07VzwZrnG+bIePrAHQzBzSO
         Cl5rrECkKA865a2iNI78NkOkA1mUvRK1/xciQJTLbortyJVHlAmCZX9Wod4RwpVHK6+P
         Dv4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8GF+HCWGjWWSNswLnXJ8MwQ5kQUWwFySc8Wm2/wZUedB0+Eo5mLsoWEe5lcK4WRhKgg41y/8F71bDasB1woh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNmMFCo9emlMs6qeR+nAeJvk4eqqpE48/NFRq9m0CeZg8azrHS
	+ojzA64e4m0GA/gPINlVoisxvpZmqwNHete7x4bmRlQJ0jfHOECA9MME
X-Gm-Gg: Acq92OHaVpG/iuK+fnYBJ6+M4Dg1wHMJJL6hv4u9xfx1cvPzFRKASG89CZ+1tLv6x1w
	gMJMbLxdPqg/H2y+Yo6f6DDIOiMY+Y36lFwpEToSMG051A8oe0uawthYO81//3Acji8Za8A9E7J
	4vWWkikTlySFPJ+0/f5/U6PukhpPnp3Bd/0tm9uO/16TRy9LTv9aMzt62o0BK1k7TBcGEhRFHnx
	oeNfOnkDTfS2Y3vVVG+MVM8F8togdjOi/8SJSe8PseaZ96VnGjbfXuU4hA25kfvoREHVkkHAMcN
	c390QVZRvaVSxl0v4awfaWC2xf2zbfuGuwxplznOrHIWUKDEge22IJmv2eLzONe3vbP2U3iYsXD
	5gr5D9A3SD1K6HoDy4GI39ljr/eQDx4CJ9iHPIWkTm4DuACKS3lEot/4xIFk2yty/arTYu4ajVv
	0tsW12C+q5g0XIww0ppg==
X-Received: by 2002:a05:622a:244f:b0:517:64b2:2388 with SMTP id d75a77b69052e-517fbcc58bcmr31767711cf.15.1781263658445;
        Fri, 12 Jun 2026 04:27:38 -0700 (PDT)
Received: from localhost ([43.225.189.109])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb79e2f2sm18254261cf.17.2026.06.12.04.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 04:27:37 -0700 (PDT)
Date: Fri, 12 Jun 2026 14:27:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
	Shyam Prasad N <sprasad@microsoft.com>,
	Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>
Subject: Re: [PATCH] smb/client: clean up a type issue in cifs_xattr_get()
Message-ID: <aivtIut3kQ5s3GKM@stanley.mountain>
References: <aiplG8fGQOYmXS5g@stanley.mountain>
 <CAH2r5mutN9yDPF8Q=z_GYbgAzJFS6OE+2zBd8na9zY1Wbt3gyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5mutN9yDPF8Q=z_GYbgAzJFS6OE+2zBd8na9zY1Wbt3gyg@mail.gmail.com>

On Thu, Jun 11, 2026 at 03:33:50PM -0500, Steve French wrote:
> Doesn't your patch need a cast in the following code in xattr.c since
> it returns a ssize_t and you changed rc to int with your patch?
> 
> 315                 if (pTcon->ses->server->ops->query_all_EAs)
> 316                         rc =
> pTcon->ses->server->ops->query_all_EAs(xid, pTcon,
> 317                                 full_path, name, value, size, cifs_sb);
> 

It's not required.  The ->query_all_EAs() pointer returns ssize_t but
the two functions which implement ->query_all_EAs(), CIFSSMBQAllEAs()
and smb2_query_eas() return an rc variable which is an int.

I would tend to leave it out, but if you want I can add it if you
would prefer.

My real motivation for making this change is that we have an
"acllen = -ERANGE;" assignment where acllen is a u32.  Then we
store the -ERANGE in a signed long and Smatch triggers a warning
at that point.  But then we truncate away the upper 32 bits so it
ends being fine.

regards,
dan carpenter

