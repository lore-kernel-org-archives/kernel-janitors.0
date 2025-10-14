Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078052561B9
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Oct 2025 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435239; cv=none; b=JyPCkHlFM1MfVXLHftzwgZ5QuvuCTHpLv/PqfDG8EMmqXm5gfGmOpdbugTkGZWfKrsDpCNZ6Mv+aWSY3kOgCflM6L4UcdcTZXT4fwVkLZ/cZCaeMBE+SYtrSsYVhbAUhpk1Kr0/NvC+rKdfLSTuL16pEJlNU8PFg/7VBvWJt6GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435239; c=relaxed/simple;
	bh=so4LHqIHw3CFGt8OZscMcsX45wmcCRUdVqsTf7gb+EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfqWCBYOuRmlMFl6XAZKsobWxdgKJWd7M3OF68WC3IL+BsWYMM13NrLaCpWDDksJ+GhNzO0GeDDz+1bpwbl1PE0vKOAumrkU8P4zMSs206cyMHrk7Cti9pDuCEbplBnroYGo2sp80rvKFPPymf+vj+W0mZZdiX32y2FRY6USh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2sGr+oE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2sGr+oE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760435236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5N6OEeG5CmV81eCe6A/4zE10OVgeRQaahrUEjZTGJf8=;
	b=H2sGr+oECmDQH0Ozb/WYDqE0UOB6OJtSZi/lAJRkeRCLD4REhA9JioVVhWN23b1PZ3qDnw
	MCd+5Z1MbycPfvWpjZrsBKDQjhsBzL9RqhYNzWc4LvCYhiZ2SY7GD9Tnuxr0zp4tKT8zT/
	HmqORxMnJBODiz16MlojtXfaW+Ztlvg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-XabdFO_ZNQiBgXxjJ_mndQ-1; Tue, 14 Oct 2025 05:47:15 -0400
X-MC-Unique: XabdFO_ZNQiBgXxjJ_mndQ-1
X-Mimecast-MFC-AGG-ID: XabdFO_ZNQiBgXxjJ_mndQ_1760435234
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e377d8c80so19248175e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Oct 2025 02:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760435234; x=1761040034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5N6OEeG5CmV81eCe6A/4zE10OVgeRQaahrUEjZTGJf8=;
        b=SOWToiHEwh2ISRqVZ5OWgvBE3FAR4KIR0BTQVwI3zCCIK2U14PlssM4GLD0qDhL8KZ
         MlznQNZwj7+43Fak1m7ULN4OoqgfWKH9zNwn9Vlx112EF1h8TQOAzN++Xo37hK+WoyA0
         unz9SeZ8w2bHu9X1d4DXhehgNhDBk1mJW7VY4cwWW9JTSNCJE16REez2tbnkHpuV9kVn
         bl6W+wYHu+p3fuUpz4R1Kb6l+kgew1GcJX+LNu+MFqcib5f0Og2+Q1byt9a8t8c/VLli
         wlr35+QRnySnLDF8XyfK99T187oq7siY2pg8hRChm+26Rwzu/NHsLBi6fZEuAs+RgP9a
         kTOA==
X-Forwarded-Encrypted: i=1; AJvYcCXo+MwW9G3WslHMeLN9EG5zzVw4Gwy77ujKhU4FXc9lkOFxj4DitBCSu0FfOBLljQTxbbMUK4YRBTZYLdt/BbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVS6zDGt+DtKWo7+UwGsoi00Gbw65xFtN6prt2IcfojrTwCiZg
	0y5NSqp7+cEsc4nq4jeDgJLregT0SS8JdO1U33Ww7mo2H0fk4xZS9QFlX2di8uEKoS6zVay9zZd
	mRrh+XcR2uWSxkL0vuAanhQx0PnIscCQlo/pMJQamWb/kjzrgIDgBUjqSXIeVQj5Hv7nM0g==
X-Gm-Gg: ASbGnctygaTMgFqNl4Y9myuLGmJmTG7fSKhAd/NlRtqCrBrlOLM3FSXQk3ToZd2H4WX
	kc7Sp7VZBnbbbkuVpj3ATCMxnuEVAgcgjKOOrOqwjIPGxXAVhfOI8pdKYd2k7h5yQkPIAI7608m
	tguN2jCtZLvqRZChkFFO6cU4RT7jBisTgOBUx1Epq4ZdCbQ/Jr8T1m5DOAeZGA/xiHNYayHc5Sx
	vLOpKIz1WiXIQO54xknfdlpxr+lR0sv68jLky85Pp4pXgdUi4a54KDgXE/XnabrQpHJWodcT9LH
	M6qkrql9ZSRnfwJZpgkAxLfCGiNzNDAKez+D3EGsPOh3i1h8hdnHUjpii4pys6aUrRXYpkfJ+YX
	Wq0UZHFG5grLp
X-Received: by 2002:a05:600c:4690:b0:46e:3dc2:ebac with SMTP id 5b1f17b1804b1-46fa9afbb62mr156259665e9.27.1760435233745;
        Tue, 14 Oct 2025 02:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCHYgG+2qltz9vAWbpxtZa9W5FNzHR/pFUCq82szUc8pklfr6PSxnc4vOKKExKos7pXzHLrg==
X-Received: by 2002:a05:600c:4690:b0:46e:3dc2:ebac with SMTP id 5b1f17b1804b1-46fa9afbb62mr156259465e9.27.1760435233351;
        Tue, 14 Oct 2025 02:47:13 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb479c171sm230297745e9.0.2025.10.14.02.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:47:12 -0700 (PDT)
Message-ID: <2b9e0f15-6e4f-4510-91b6-8e4586e5f665@redhat.com>
Date: Tue, 14 Oct 2025 11:47:11 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Octeontx2-af: Fix missing error code in cgx_probe()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>,
 hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20251010204239.94237-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251010204239.94237-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/25 10:42 PM, Harshit Mogalapalli wrote:
> When CGX fails mapping to NIX, set the error code to -ENODEV, currently
> err is zero and that is treated as success path.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aLAdlCg2_Yv7Y-3h@stanley.mountain/
> Fixes: d280233fc866 ("Octeontx2-af: Fix NIX X2P calibration failures")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with smatch and only compile tested.
> ---
>  drivers/net/ethernet/marvell/octeontx2/af/cgx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/cgx.c b/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
> index d374a4454836..ec0e11c77cbf 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
> @@ -1981,6 +1981,7 @@ static int cgx_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	    !is_cgx_mapped_to_nix(pdev->subsystem_device, cgx->cgx_id)) {
>  		dev_notice(dev, "CGX %d not mapped to NIX, skipping probe\n",
>  			   cgx->cgx_id);
> +		err = -ENODEV;
>  		goto err_release_regions;
>  	}
>  

Side note, a few lines below there is this check:

	err = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSIX);
	if (err < 0 || err != nvec) {
		dev_err(dev, "Request for %d msix vectors failed, err %d\n",
			nvec, err);
		goto err_release_regions;
	}

AFAICS err can never be a positive value in that error path, but the

	if (err < 0 || err != nvec)

check is confusing and should possibly be changed to:

	if (err < 0)

/P

