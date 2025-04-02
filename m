Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D43235BFB
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Apr 2025 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594911; cv=none; b=sjXcH/AcK/mHh7T3dL6kBTv83dUDq68WgSn8aj6VJZqxw8DBHfGRvdeIy/AFgspc+vPF6SCSUiK5rpc75k0DpaVLEaxiL/PpqMB2Az9BKKsmYT3XyoC3PkE42YGO9/lgXfTErv+30PwdIqKu3D67/wKDPOvQU3MNskti5qbhxfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594911; c=relaxed/simple;
	bh=nENsrqmWbegOZG/r1X2PxQn++esBRh+Li8k0rldpTEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSKdyExzFzuvrcgj+wjkML87SCpWPyUbkucPd5N6jc48ykIqOoEp50D7D7+8M+DvJFB3/5js9QU9GjDHuQXcRjm3aqMJ2bICXdqTD6gARtsXFosBN3X9Cop02ZoqfBj2GAmzGBuOstEp/yZ/jN9tTfr2H0uE1Wc8xpZPuFndqVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gKZy9vXS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gKZy9vXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743594907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wz4FfrnCRhg6e7/GKO5rTqDjU53m8lZ5KDISSPVBre8=;
	b=gKZy9vXSeYIx/PMZJfivqJczcqIwdPcuh8Nn+dK4wFZ8dz3a5K+oSgG0Bc393RYy95HSDb
	OBemwJY5m+l+4RLw2Kp5kJuopi+z915J9F8BeWwpShnjmszoEfDP3L82HOz8z6ntHTV74B
	+PbpwqCsLkCHT4rR/gm0HcSOasyE5mA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-kaThbis-P2uoWdrXNIRI7A-1; Wed, 02 Apr 2025 07:55:06 -0400
X-MC-Unique: kaThbis-P2uoWdrXNIRI7A-1
X-Mimecast-MFC-AGG-ID: kaThbis-P2uoWdrXNIRI7A_1743594905
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3d89cc4f3so516377166b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Apr 2025 04:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743594905; x=1744199705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz4FfrnCRhg6e7/GKO5rTqDjU53m8lZ5KDISSPVBre8=;
        b=dpNYJa8qLm/PCWdYvGphmQBJ4pIhwiyCULf1beR+XcFDl9b0rKBe08FrAMTF/EhJUj
         7ZOKWUrImITL3xiZxL9ygALyo4Tzhxpl59Ogpe+JkOA9U1lUR1eB/YfZI/8V5XZf0VgM
         04xtbsu7yInOilMHLzvel18RARt/MC0UAOU3MoFjLuKNP+8kSlrnWq8ny9ouIc5naJd2
         Aj7qXF2nCVxE708D1RPlKRt1JzKaGM4weQR0vs9Cwz+ZBm75rwdThidMlxUUcGO4FjSC
         pkc47pTXy4yOsd8WKgiHSWosQEq6BTze0rHud/je+FYfekcGjD0u24fVrIQFyeSkOKnw
         BQ3w==
X-Forwarded-Encrypted: i=1; AJvYcCWgOuuESynhVze2L4coZaOkMihRdW/Npy9HkxhWUxM1k8FJQlzeK9WbNJHW9U4FgN9dRLKexL4NJwKitdNLQCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6bqOLibnbz/zoQG+pUWp6a/64LEIKea8aflrQrk41woSCbD+0
	wgjqle+TVJfxHDNfX6fnVTkq8YaG6xeRFHYe3irTtVReN9iVwtvvD2scexbKAsQSaVxhfI5wdzp
	OAkriyqz6YR6NfKJbxMlVzkWCsOMeL6dR8DzUvHkkgz16U/ENvGpfSmwcNg0BIOs1TA==
X-Gm-Gg: ASbGnctp6h3aMlNhf0EWADVEBtUI5fcXu2fuDblhyMWEO+tm0euLXF8jnq6JQl2Rnoh
	Lhr/tZt0+Toq75g0VrK2aw0ydQcnD/UxSR5uDmSCRYiQUL8ShKYCgVlPeuLggpHeIqkkaGHBAXD
	aN8i+umO/F6g+xkLQumbzq6gAtBpeaq4bHjfHK/i9MogVX03d2wkI3xrttw0W7Cyi8b2FDQdn8N
	QtxSf4hHVESj308py9XEGKPj9GWhZG9T1BmtzALkoDjdUZjw6oy23hNGG39Tvka+6F7+JLl14Wb
	q0YdqZqCCAih77Z2IqOIEoVkkU9C8LU0X5Qg78Xfb82aUnijbE0KRL9y0POwzC87PIPo2n+QgSc
	BSFSe9Vbq2hpqy+q9jqNMKTwImFDwxkx5s/zBa6qXObPwuEbGRF88iT7AGsjHLhVgAA==
X-Received: by 2002:a17:907:7e82:b0:ac1:effd:f2ea with SMTP id a640c23a62f3a-ac738a82f63mr1519900866b.24.1743594905458;
        Wed, 02 Apr 2025 04:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5nJsoUbdzDsoVfY6aWJ+75CkT2U3THLfZxOsW3hmwXfpxrhyV3hBIjXRvBVKnq7fFcjCx/w==
X-Received: by 2002:a17:907:7e82:b0:ac1:effd:f2ea with SMTP id a640c23a62f3a-ac738a82f63mr1519898866b.24.1743594905016;
        Wed, 02 Apr 2025 04:55:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71971bf3fsm897184966b.182.2025.04.02.04.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 04:55:04 -0700 (PDT)
Message-ID: <cc9f5c30-45a6-4130-bdf3-732e5f1c6d2b@redhat.com>
Date: Wed, 2 Apr 2025 13:55:03 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btrtl: Prevent potential NULL dereference
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Jeremy Cline <jeremy@jcline.org>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <0174d93d-f3a5-48ed-a755-ed7f6455c1bf@stanley.mountain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0174d93d-f3a5-48ed-a755-ed7f6455c1bf@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Apr-25 1:01 PM, Dan Carpenter wrote:
> The btrtl_initialize() function checks that rtl_load_file() either
> had an error or it loaded a zero length file.  However, if it loaded
> a zero length file then the error code is not set correctly.  It
> results in an error pointer vs NULL bug, followed by a NULL pointer
> dereference.  This was detected by Smatch:
> 
> drivers/bluetooth/btrtl.c:592 btrtl_initialize() warn: passing zero to 'ERR_PTR'
> 
> Fixes: 26503ad25de8 ("Bluetooth: btrtl: split the device initialization into smaller parts")
> S

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


igned-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/bluetooth/btrtl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
> index d3eba0d4a57d..7838c89e529e 100644
> --- a/drivers/bluetooth/btrtl.c
> +++ b/drivers/bluetooth/btrtl.c
> @@ -1215,6 +1215,8 @@ struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
>  			rtl_dev_err(hdev, "mandatory config file %s not found",
>  				    btrtl_dev->ic_info->cfg_name);
>  			ret = btrtl_dev->cfg_len;
> +			if (!ret)
> +				ret = -EINVAL;
>  			goto err_free;
>  		}
>  	}

