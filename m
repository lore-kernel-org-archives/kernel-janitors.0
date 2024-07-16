Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC95199EB1
	for <kernel-janitors@vger.kernel.org>; Tue, 16 Jul 2024 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721133288; cv=none; b=bDoVAWiJPx/EQWcYKZcNiuki3YacL/N2rTOO0oO6T+WqrCU5VaC8wXoFl2eNjoJLGz3CoTbWMZ5kjZrpiYZMctK86A6Em3YjMktlp19dYeku8zdwcsQZmjd3MD3Qsjzs2b9G2ZxoJXgZEYpNX4A2R2uFIUHr6zhgJ8IksnOz+Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721133288; c=relaxed/simple;
	bh=UwvO1FF7MnvexBVJsbYqtV2A6b3qtyblV0xiJ3qOHn0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dLEQVsXHRhLa0AEzts0gbKOW1Y+m5UdSqVROn5OjRw/9QUE1Nx6Hy82yJpYprgHxF7q9c8xgkWhngS589XslEj9ctpy6xGSghLcdEggdahJ8WGYkX/jjpIfjo3kM+mE6dB0pnMeyXGBk62osF5OBA7iSS6aKByQOuTnkrLKDT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bjW/yoZY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bjW/yoZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721133286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hmPFA9iny5K5WBu2KEPFzDMz5G8QExo99NmSardUinU=;
	b=bjW/yoZY0AZFJXl+4ChqimTlinalQGiBibEuUvXBLr95xk42auY1dvxvbf1I8RKesGD6K6
	jQXCA5jrE+mE4qYuk5z/yIJ/haVbwtt2H+a7X71H9palWXEpEMM+V5gaXCGJemoOU05xRs
	Jyv6icWN0lTpcoO6Wyppe/v7aDCleAs=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-zo6viDVYNkS6hOhtC4NFZQ-1; Tue, 16 Jul 2024 08:34:44 -0400
X-MC-Unique: zo6viDVYNkS6hOhtC4NFZQ-1
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7f3b0bc9cf6so715784839f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Jul 2024 05:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721133284; x=1721738084;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmPFA9iny5K5WBu2KEPFzDMz5G8QExo99NmSardUinU=;
        b=E0GY1tew4LxHS2JW5xP5YQr+Sslp+5dyb/G5ljcdDtFfvCpkYJtBRC8vDnd0jpJ+Rv
         0vZ3x0qJ+UWsjFg5vF0C+Ys/CN53uHvdyDBlA3i8s/zwctaWHbjsm5WA6kWt+ySI9wU8
         If+kDakHqMHlOKUZ713DHQOQAakb9MUIgS34n6yO50L7eIVe5We4NAcn6lZd+E79W3VK
         yn96I8sXZCdpxdKT8iP69Xt/mv+r3XdKSVgQZ57tB7JFz/ch+shTpXSkCVRJfcFWDV8v
         aE95BZx++R6M3ZOEvfxbngiCnNt/rJYvRGsQfvT2UC3cz+zkHg1XXC72e5nSfDQM45rd
         tJEg==
X-Forwarded-Encrypted: i=1; AJvYcCWXQ2rbm8m2GyYGUzMOte5OiAVDqtPyUpePUOY3d9GaQG+xDfb9XtGXUOK9qlbmBFIUueLbZdjDghpQN6DGs5Zei50K3+EJEjjoT0zvRdJ6
X-Gm-Message-State: AOJu0YxK0pBYVYjK4ZkZ1KDX9ErUwQcbpnKJnOXO4pjYYbUFvLShZr3+
	ClgQS0wgF6hP80yNfpaQEWI5TQKj6OnPDpWbtpoUn835t7Ug19PxKls1kfuR94hpPs21Y3Xxdjg
	gW6FGDS/DKzwcHb1Jp5QIOVicaIkthX63EOaYWFLayfSq4hIfTvVoJUAQPrgkkMS1og==
X-Received: by 2002:a05:6602:2cca:b0:805:2e94:f21f with SMTP id ca18e2360f4ac-81574540445mr278731539f.2.1721133283803;
        Tue, 16 Jul 2024 05:34:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx0v8ioi/ZYawS9SUY/Ip1EKV4weK8+lj35wr1o4vxKoM9NKhFCak+mtzECDC8UGRkfJBNgg==
X-Received: by 2002:a05:6602:2cca:b0:805:2e94:f21f with SMTP id ca18e2360f4ac-81574540445mr278729139f.2.1721133283485;
        Tue, 16 Jul 2024 05:34:43 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-80e115fc5f1sm188535739f.3.2024.07.16.05.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 05:34:43 -0700 (PDT)
Date: Tue, 16 Jul 2024 06:34:41 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] vfio-mdev: add missing MODULE_DESCRIPTION() macros
Message-ID: <20240716063441.132d60bd.alex.williamson@redhat.com>
In-Reply-To: <20240715-md-vfio-mdev-v2-1-59a4c5e924bc@quicinc.com>
References: <20240715-md-vfio-mdev-v2-1-59a4c5e924bc@quicinc.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jul 2024 12:27:09 -0700
Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> description is missing"), a module without a MODULE_DESCRIPTION() will
> result in a warning with make W=1. The following warnings are being
> observed in samples/vfio-mdev:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mbochs.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro to these
> modules. And in the case of mtty.c, remove the now redundant instance
> of the MODULE_INFO() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> Of the almost 300 patches I've submitted tree-wide to fix these
> issues, this is one of the 13 remaining. Hopefully this can make it
> via your tree into the 6.11 merge window. If not, Greg KH has
> indicated he'll take this as an -rc instead of waiting for 6.12.
> ---
> Changes in v2:
> - Updated the commit text to more fully describe the problem and solution.
> - Removed the MODULE_INFO() from mtty.c
> - Note I did not carry forward Kirti's Reviewed-by: due to this removal,
>   please re-review
> - Link to v1: https://lore.kernel.org/r/20240523-md-vfio-mdev-v1-1-4676cd532b10@quicinc.com
> ---

LGTM.  Kirti, would you like to re-add your R-b?  Thanks,

Alex

>  samples/vfio-mdev/mbochs.c  | 1 +
>  samples/vfio-mdev/mdpy-fb.c | 1 +
>  samples/vfio-mdev/mdpy.c    | 1 +
>  samples/vfio-mdev/mtty.c    | 2 +-
>  4 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index 9062598ea03d..836456837997 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -88,6 +88,7 @@
>  #define STORE_LE32(addr, val)	(*(u32 *)addr = val)
>  
>  
> +MODULE_DESCRIPTION("Mediated virtual PCI display host device driver");
>  MODULE_LICENSE("GPL v2");
>  
>  static int max_mbytes = 256;
> diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
> index 4598bc28acd9..149af7f598f8 100644
> --- a/samples/vfio-mdev/mdpy-fb.c
> +++ b/samples/vfio-mdev/mdpy-fb.c
> @@ -229,4 +229,5 @@ static int __init mdpy_fb_init(void)
>  module_init(mdpy_fb_init);
>  
>  MODULE_DEVICE_TABLE(pci, mdpy_fb_pci_table);
> +MODULE_DESCRIPTION("Framebuffer driver for mdpy (mediated virtual pci display device)");
>  MODULE_LICENSE("GPL v2");
> diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> index 27795501de6e..8104831ae125 100644
> --- a/samples/vfio-mdev/mdpy.c
> +++ b/samples/vfio-mdev/mdpy.c
> @@ -40,6 +40,7 @@
>  #define STORE_LE32(addr, val)	(*(u32 *)addr = val)
>  
>  
> +MODULE_DESCRIPTION("Mediated virtual PCI display host device driver");
>  MODULE_LICENSE("GPL v2");
>  
>  #define MDPY_TYPE_1 "vga"
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index 2284b3751240..b382c696c877 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -2058,6 +2058,6 @@ module_init(mtty_dev_init)
>  module_exit(mtty_dev_exit)
>  
>  MODULE_LICENSE("GPL v2");
> -MODULE_INFO(supported, "Test driver that simulate serial port over PCI");
> +MODULE_DESCRIPTION("Test driver that simulate serial port over PCI");
>  MODULE_VERSION(VERSION_STRING);
>  MODULE_AUTHOR(DRIVER_AUTHOR);
> 
> ---
> base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
> change-id: 20240523-md-vfio-mdev-381f74bf87f1
> 

