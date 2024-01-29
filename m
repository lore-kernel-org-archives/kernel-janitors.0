Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61774EEDB
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Jan 2024 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706518839; cv=none; b=LeTRYCcmxfPkjuZjwFdpMrdZCezkHcepH0ZfMuXZRMxKLx0sFgADW+DPYiNXIOgomvg/tFQf5qxrpdvLwVHLfMwEHri2t1VSQInUbPt526udXBa8L9lXGlQizkBbqq5irclWhCMbB3IKW6K5EBWSy6YZF3nYzxt+RlWQ3VY8anc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706518839; c=relaxed/simple;
	bh=2cK2qmeo+EBrU4InYqrn7CwsavES21X+eQBJHI7A7Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7Hsqfysr8fkR3gvsBAOvuiYhfETyGfusTUFStaObfqROhpaCkJa+OM2rBFfv2EE2wTOqJirKetHOmuwT3Nxu1A6eWGsB4qKhyUKjdlSSFmDGaoojPf332tFcINqjUip0xlO8uxx8lBYA1gxJsLRsFrCau3E6yK5OPY64F/i8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ibs7oX7d; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ibs7oX7d"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33af2823edbso160691f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Jan 2024 01:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706518836; x=1707123636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OxsFeVAAl1ODsuJYchH/+ny1FAnY7QnHkXGUc0KyEQ8=;
        b=Ibs7oX7d68714E3Wspym8zqzGxcD9TCZcMVr12nVdJ2bBsBurYgo5L3WmSwk1+Lpxr
         tgyvlLB7TJZirYv3YpYs1TBuz5CRnN52sWANRfMLtKfa2npIobptInznhstySzhOjLNU
         uBLsZLQoDItNBswIJP3brQFgL5cRIyLjx0i0IdE6sGOQA757VSrnVOR0jksGo80fFDA1
         6nGFnBcrjW+Gv43nwpOnW8jtJSmOKveSX6lfl6PGaPcUV4FQjQdQL5i/HXMFL52XuAeH
         BFAFg4CNN5iJW2fIDTe3PSLZehwNJ0PqTGBuzul9s+NiZ6TpoD5O0qs5JpWVi4RXehEL
         UqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706518836; x=1707123636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxsFeVAAl1ODsuJYchH/+ny1FAnY7QnHkXGUc0KyEQ8=;
        b=B67qSJRrob4ANwQJd1KqZ3HGN39vLPua6HOImw949ev65++tVuEgFL6pjRNIc1y9Tk
         FQ4Z+yPOzVHe8B9HnEcI7MtEE7JA7uH7p6mPAMqnv1Kmg6WYcCmux9nKIlooKPQjLmnK
         8Vxu+61koprj8wkjiT0w9ln9te6uI3ZEWAtYjW/3paEHE1UOBgXEXAZbBIF+SUdP70Oe
         XhG42JZ/qCRq2bD9Ln9Tlh2HANwoSSQdBstIcAmK/b3GEMTuvjMGKKKkHA+uC1QwIzqn
         dMNqXcwUpnmIWL10Jx8OnkzsNhEVO4hcWh7D1/nv2IUcrwaxLFaPcFvW2tfj17YwuOtz
         dqmA==
X-Gm-Message-State: AOJu0YyFS4uVontYQb4dUaPhTe9Wz9BjBlgGnPdiLFNti+dx9SmD5ZJV
	Cd4J43yy8aF0hP8a2YJidwtzrasq6qUyc3y5G1FiGNDhQEWLvPOLI+v6H/+/nWQ=
X-Google-Smtp-Source: AGHT+IG507HFz7+U86i8zkPDGUcrS2mTLZD+8PFBIptIPaz49wNadW49ZXJyz/aAUS8+C6vGGbhjQQ==
X-Received: by 2002:a5d:5f48:0:b0:33a:eb59:accb with SMTP id cm8-20020a5d5f48000000b0033aeb59accbmr3032528wrb.8.1706518835727;
        Mon, 29 Jan 2024 01:00:35 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id n8-20020a056000170800b0033af26545c8sm1077404wrc.50.2024.01.29.01.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 01:00:35 -0800 (PST)
Date: Mon, 29 Jan 2024 12:00:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nick Spooner <nicholas.spooner@seagate.com>
Cc: "rafal@milecki.pl" <rafal@milecki.pl>,
	"srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
	Evan Burgess <evan.burgess@seagate.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [RFC PATCH] nvmem: u-boot-env: improve error checking
Message-ID: <43112f7f-b416-4c76-a636-0fb45e9f558b@moroto.mountain>
References: <CH0PR20MB381875927236C07B9CF9A8099C792@CH0PR20MB3818.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR20MB381875927236C07B9CF9A8099C792@CH0PR20MB3818.namprd20.prod.outlook.com>

Your patch is white space damaged and doesn't apply.  Read the first
paragraph of Documentation/process/email-clients.rst

On Fri, Jan 26, 2024 at 11:10:06PM +0000, Nick Spooner wrote:
> Coverity scan reported CID 1575482: error handling issues; this patch
> addresses this by adding error handling to u_boot_env_add_cells.
> 
> I added the RFC tag to this patch since I'm not confident about the
> logic here.

Just put this kind of comments under the --- cut off line.  We're used
to reviewing patches like this so it's not a big deal.

> The check is reused from nvmem_add_cells in core.c, which
> doesn't include an of_node_put on a device_node, whereas
> nvmem_add_cells_from_dt does. Without much certainty, I went with the
> less complex option and added it here. Any advice or suggested fixes to
> this patch are welcome!
> 

nvmem_add_cells_from_dt() is cleaning up from:
	addr = of_get_property(child, "reg", &len);
so that's why it does:
	of_node_put(child);

It's not necessary in u_boot_env_add_cells().

regards,
dan carpenter

