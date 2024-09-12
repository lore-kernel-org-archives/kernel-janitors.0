Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32DB1A7245
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726146725; cv=none; b=CpgjGIXU/EA+m+MY9D7ZlKt2iPAzWbRKOW2xDaG8X+TlNfolgI1st+QuDjmfV7X6GYEKiyFhONYhBPefu3CCShxPv0zMCNAv8M0wwcOE+kq7wTFcfoP/A89Ek/5a90eM+k51KlNyzQgdUjyymnQlrG5JiCGhTVL0ViBe5RAkO9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726146725; c=relaxed/simple;
	bh=RaydOSJFL3Q9Fw7f0XuBKFvCOwlO2D1b/uIs9scmK6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQGUuV6Y5ce1D+bUQqFNxiB0rWjkPIbDTh7h7aEyqQXtph9nYIHfQxuCAb3G1FROxA1VxBVS5BNvO7Nnf6gr1m1jDki1ZRIVtZ8+EOhy0l4jVSlO1ahFCarUryFPuOe9PgKNcfi2QwXo30sV35Qq4GZjaVBKSwXo68HLTqwxaRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CKxcCSwR; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CKxcCSwR"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a9ab8e5f96so72119985a.1
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1726146721; x=1726751521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBD1supAppfnGRodOiWLEHyXSpQurWFz61I765SalUk=;
        b=CKxcCSwRlcQuIVHcElXMPyQ2gIgVj1QyFGTHHrqdZoIDWjvjlEuUaCEFecmFI5xqLi
         ZXze9mK1O0RsHTpXK2sKunz0ziAKPEJoCiD0nw+FjO05EAm+w0IrlDOUBQQNnIj88EcI
         ejLLCP03LYePKuOR0X4dYZ8NmlDF9hg00iBDJHqUP8MCMN0bENu5Rh//ott/e7iQI1GU
         fZPy5d7r7ZstUEhS6V+CKWWCs3DobzW5L0ovZs+pMzXft4h3ZYl8B84hFPEvzfUH8z95
         tUfonciUhStqheDdIT1jIpzCIX5G8CubuwTOXaTLMlffuZ8g93N2P30vw3Ess1siIwba
         3gVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726146721; x=1726751521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBD1supAppfnGRodOiWLEHyXSpQurWFz61I765SalUk=;
        b=w2/5PN7j7cnD/hUiWQj0gYCGQg60TESVy3C+WT+SPsUQUW6K2t0UlGY+n/uXalGZDe
         X+cIhf9zArNQyHxLsEHo0MZaBuJa5pZpk/cWVlS/AQlEwcNLYApFjtVtehylV48CcHX/
         g2ONJjGdDFr9GYjdrIZc5ONxlcQy5Fojy7xI5FHZtapizzRz9g0b+qaOEBwiWSQV0dx/
         LE0e6f16+hBdRGtuKyoEDbXcbYyJgOwATEdJ/fNE3wq35XHvFf5Uaq7EuYyDjsa3KY5t
         JDnpDC6Rax39tZ02tr1QjFZnwjh124/J7ydTfhSWFGvBJpgqer49yFJ+ZCxw2Y4VH5os
         R13g==
X-Forwarded-Encrypted: i=1; AJvYcCXWb8kyZRgueMV5xyHEcfOOPDtrapNWIl6ySGXwOgp9CED8LmcTKnZSjFJ/1IrfKYZ+SqEED9D5T7pjX3JMb18=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMS07BXnYuWDlrXOALyLlLL3U0zzjVxUEz0rEUnvaTw0gIv0f
	ujZC/aoXFa0FEca89QRXJsBB9UP60XqVH5FqMCaNbFarhFRqjO0Oepk+nSd8WnM=
X-Google-Smtp-Source: AGHT+IG9WyRXWSNrKA444XIFeHToPFPIZbf+sv4Odz1gHEboQOTlEfHF2PRWRKXrNZsoGdWZluUUWQ==
X-Received: by 2002:a05:620a:2a01:b0:79f:1cf:551e with SMTP id af79cd13be357-7a9e5ee5707mr318668085a.5.1726146720738;
        Thu, 12 Sep 2024 06:12:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7a283adsm533918285a.129.2024.09.12.06.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 06:12:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sojc7-00CzIH-H0;
	Thu, 12 Sep 2024 10:11:59 -0300
Date: Thu, 12 Sep 2024 10:11:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Kunwu Chan <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: clean up a type in
 vfio_pci_ioctl_pci_hot_reset_groups()
Message-ID: <20240912131159.GC1304783@ziepe.ca>
References: <262ada03-d848-4369-9c37-81edeeed2da2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <262ada03-d848-4369-9c37-81edeeed2da2@stanley.mountain>

On Thu, Sep 12, 2024 at 11:49:10AM +0300, Dan Carpenter wrote:
> The "array_count" value comes from the copy_from_user() in
> vfio_pci_ioctl_pci_hot_reset().  If the user passes a value larger than
> INT_MAX then we'll pass a negative value to kcalloc() which triggers an
> allocation failure and a stack trace.
> 
> It's better to make the type unsigned so that if (array_count > count)
> returns -EINVAL instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
