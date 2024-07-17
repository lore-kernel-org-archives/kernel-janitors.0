Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A481822E9
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Jul 2024 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721241899; cv=none; b=p8XAcL6mB/DxT54v5+BFJeyT1WsQwJjrnXcAjbJzNaIkJVoINTHlj5Ci2dYK0X7TIfHEeRx6vU2McRKI7lsGsUT0ZVenI3vusewarZvtIcxru6CNhCniybG+y6l/qah5xAmAPpO4TeWrCz8mHeTjMZi2Hzwt6Svdcm5TJgYO4vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721241899; c=relaxed/simple;
	bh=ZBrhag/Adb6DC9FRa1byQRim407U3nUqBDVbASRI9ok=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UsaKwzdPfzFtjWgTOLxwDx9QPSTNwFWTySvRjnTT4547fCPGSmRQA5ifHsUulECWr3Dt8w6CqIdZWv07GqEI6VlIZFuzfBUnekuppgKfjtOrc9TFxNPL16cv+L6/5DJZowj+GM1cxVF6C2M1RvJMXMJJ8d7KR78+MLxWeYQg/0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TKKhjptQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TKKhjptQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721241895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wnOwiKe1/U2oSA4NsrBTg8a4NW8yOXIUAsKOLfMGmU=;
	b=TKKhjptQ3G4OKuTNJs4LUcvybJXQBvrjtpyQHEisSgtcCYo9gvkaRUtFNTkaia/qt7Avxe
	2YULXgYa29AUfEt31xsGCl2qudZQOIOQgzy6qmj7+c2+abP+5XDKUnqNK6V11fMoPutsGw
	mpZN8OMvAkOr4p4p9QaP2RDjKGc8Cy8=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-qIiLITwoOJOPSj7DgLhDbg-1; Wed, 17 Jul 2024 14:44:54 -0400
X-MC-Unique: qIiLITwoOJOPSj7DgLhDbg-1
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-377160ff0adso15682605ab.3
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Jul 2024 11:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721241893; x=1721846693;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/wnOwiKe1/U2oSA4NsrBTg8a4NW8yOXIUAsKOLfMGmU=;
        b=M5GshzStsfYN6sXglbOyNykQQODtM63MC0zRkF4OIXUu5t/IsK8wXsFziTpZJAEJcq
         f438o85mXrDvzQKWpE6yTAg8Qk2yGcLuUG3ODfWcrEymy5pcsS39BgL+XBYigBpyRWLI
         1S2uXx9B5MQefmjRp8COlIiEaZfgEEaBYJmulP2BBS2JvWSFXusAt3+H7zTCGbmrRyjD
         aruyXzURew0fqWImM5lv6AU9q9MF4U4yO/EFLOazF0eWtxv5gFKmJS2oMeyWgKpilvBb
         j8emi30dIANkFzfhEIBnJ/bgV0Aw+3d+KlFztVEqGaNqw2Pc4xPpZ9k3v9/BiYn8Hg/S
         P53Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhtJ10DUQ+FD4Z5TgYlYMWXYm7t5IT+TR2d8vAsujmiNUkloe7VPkWVzNTyOlYei1GfcBqFWSSB9x1SJF0GKTOykvkyohauxVBbj+kYUkW
X-Gm-Message-State: AOJu0YyL46+eX2xEzhT9rZCLZtziwLedzwUDcsDlXlX3oDKXQ/XRS2Nu
	YmvckUZdarlfbV/EG9RhynALqIC/6kSvKxsAoJtLvluT6Dh51I5n2ZjHb8UHOs7mzx2xIdzaLxY
	zFaLmWaVf86hLYLCrkQCSohKq9JL9QBLE6aRM9DnJUH564xpHTqhQhQyYmGva/8BLiQ==
X-Received: by 2002:a05:6e02:1887:b0:382:325c:f7c0 with SMTP id e9e14a558f8ab-3955533241amr37519275ab.5.1721241893525;
        Wed, 17 Jul 2024 11:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN8GMb3cyoTVdIUXgw3VLIvcC09SJpv5sExfgbI0hJcCZC98+oNUTyhHDEgK0eZgYz7uSfuw==
X-Received: by 2002:a05:6e02:1887:b0:382:325c:f7c0 with SMTP id e9e14a558f8ab-3955533241amr37519055ab.5.1721241893080;
        Wed, 17 Jul 2024 11:44:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3950aee03cesm9514595ab.15.2024.07.17.11.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:44:52 -0700 (PDT)
Date: Wed, 17 Jul 2024 12:44:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kirti Wankhede <kwankhede@nvidia.com>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] vfio-mdev: add missing MODULE_DESCRIPTION() macros
Message-ID: <20240717124451.52af6596.alex.williamson@redhat.com>
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
>  samples/vfio-mdev/mbochs.c  | 1 +
>  samples/vfio-mdev/mdpy-fb.c | 1 +
>  samples/vfio-mdev/mdpy.c    | 1 +
>  samples/vfio-mdev/mtty.c    | 2 +-
>  4 files changed, 4 insertions(+), 1 deletion(-)

Applied to vfio next branch for v6.11.  Thanks,

Alex

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

