Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1B527FD46
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100307; cv=none; b=aQkcWZJyK+JvwhE4fiApJ6tJBA2wxnHJgM4XGBn1fV4ISOnIVLSusoHEdTgSXGwsXWQ9SCf5ahW0sanApSSTfucajBOUUS/+u1tjsv1S3TfiHGo8IMEfaDQAW0GALhI+O/rFI8co4eolL+k8X4pHb98RONkeIGVG0MMpqM2gWSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100307; c=relaxed/simple;
	bh=NI/e0Y3+s1QkGxWx3m6wQ0kYdQLGDnrZaGdrQ1gijK0=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Yi86BSJDMRUHA8CPzqQZC0wa198lukagcfNUCM2m40ygdQzfWDO8RL7ncLvS/xmpi8aFNPmuSGtZfqnI5AAKEesE98DrH1+kd1zowiDXJYMbV7btF+3JdtmJRCOe+Woar+wgKPqkV/V1VG4TEyEKnf7WNFVIAvzsQ63tNSh4jj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=eJwbnjZe; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="eJwbnjZe"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b0faa6601cso11415191cf.1
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1755100303; x=1755705103; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSZNbk+TN65+sC0ETrJECleAB80q6fi8W4gvr84DJq8=;
        b=eJwbnjZetkRFWG5aOqS7y+hG/cTDts4gbTXteIEGAEhMPDN/dwTrxKIF6Vs4w5esdt
         9xZfNQtXmhoRUVLHErgjZvDdLqGbElbJSVsxgtalCQWlcWSz0RfE6le+u6/UAB14wNc8
         jk+tzWYllGJfWfPx+SsPo5oNrwi5fGNv7bP8lbZfYo8uQVW87RFJ7jnycBV8p29I9bnP
         rrP+VDi+d/VgCHm33Y224bFJwXAKJqlDdy0vpy9zKgVj0HJeW+lFLqG3u8kH4gTf0int
         1vhw2xcwoxH1hEpVR4I31NYXbEUxsFnIE9ah42gFas9jqKg72IPpdzWDerV8m6AtefGL
         goIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100303; x=1755705103;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cSZNbk+TN65+sC0ETrJECleAB80q6fi8W4gvr84DJq8=;
        b=Mqv73joepy9wGq0ia1mrcI9vRCNKgJKJRWbx8ctbGlW7EiBYUWUgu2kdDHqF895MgF
         Ek/BN6Wu1KhDAlMdgz423O7/OFyX0efgZNw5X53CnOQXxGNH9qVseTQ99cB/bLh5ujbL
         F23Uh99esX83Rdht6/z+dVWEV9B2nchit+yDkEvdgr+6vq+E9m2o6zkHF1HZcAthgJFt
         68K6hFSWFi932blF/2olEzM8eq6eM8hNlpt+TUJPcmb1OIqECD56Cnwt6jhCN8HZD1gu
         yRfUBszK8GF8RCivbFE45FspyyzaRwK4z/0TVSBUdFsu256gXqGeI9fV4O3eHsFS7rdz
         WmYA==
X-Forwarded-Encrypted: i=1; AJvYcCWt3XHa8b+ZKh0Zu5/eFBrJnA6fVo8S1Ji2P3x6KPN694wn6gaoBT72Z5jBSvrPYY/k8WGuvmGiqMZ0FMlpCCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+vXx33JSzA11kJsKmcwCMORBNalzewBoYpeach335h6iF4tg0
	iKpEvsKmFrn9Jef0QuSSlvgr91nz1xqv2nrTpRZuBZDombW9gP2RKRki8AN18oKBCg==
X-Gm-Gg: ASbGncsfltHFPR+vwUvOZCoYTt1oC1jzU8tVUOD6ff9h7DtjbthcColDL9adAreeaox
	/Swf3kV+NRLj2mfC5f6C55IljlP3fmnIkwKNlHt0w1I4fKOYUEacMhADkC23AJs7KIARdjI0EIW
	ffrsD3w7K9zMaa+sfG7wVzkPayhdj9jFiXkqK0grQB8kzU0XePxcGqlJ131ssp1wiVlUMyzXDeV
	3/fjy6isFPCqUqFvVWcVWXfhkJTPQ5teU+RvLC0Avw7mX4Vrct5Pk8rTAGMSbbJPfDkj7NQSP/A
	RhnG1ZM+EIln5ZXjqhZF1+WRSvYdEDW0+gYWrWRyl/FCdsd5vW3wZSUrNX1JFoIRvGoEsQutFW0
	BmptiuYKR3Q9zLtmB4dvbVkCQudWJ6NFutGCZhSpTPvKdiaQy2a27Rrs+CjEBLg2sDVw=
X-Google-Smtp-Source: AGHT+IGFCJBWX2Icu2aYWunbCMiwoJI4/WCzPBp+aEG0Ea/nYQ5twVDchw4xZsULxUDU5X/I+9N9fg==
X-Received: by 2002:a05:622a:1a21:b0:4ab:3963:c650 with SMTP id d75a77b69052e-4b1099cd66dmr1481411cf.10.1755100303329;
        Wed, 13 Aug 2025 08:51:43 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e82aa29328sm1027746085a.33.2025.08.13.08.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:51:42 -0700 (PDT)
Date: Wed, 13 Aug 2025 11:51:42 -0400
Message-ID: <235be32786cb9a6c98a464d202c2daed@paul-moore.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250812_1310/pstg-lib:20250812_1218/pstg-pwork:20250812_1310
From: Paul Moore <paul@paul-moore.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Casey Schaufler <casey@schaufler-ca.com>
Cc: Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] audit: add a missing tab
References: <aJwkwMRSxUAvI4dF@stanley.mountain>
In-Reply-To: <aJwkwMRSxUAvI4dF@stanley.mountain>

On Aug 13, 2025 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> Someone got a bit carried away deleting tabs.  Add it back.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  kernel/auditsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch, thanks Dan; merged into audit/dev.

--
paul-moore.com
