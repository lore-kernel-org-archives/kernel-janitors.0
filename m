Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22301C69D
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Jul 2024 16:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061344; cv=none; b=r6co2NWF+rL9fnZx8ZACSqeyzazdU5fkxY4Butxdgh7iX5IYUewmhD/LB5LMXMhDS5N4OSnyJnV/NJ/qIMB8oBeYHraLuFtq7a7UanPo8PxPkmypSMKkxntbx7rH39ZzkzKuLjW65FNw/rMnlCqo6iIi/Js1qa3VkpeGiKsxn3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061344; c=relaxed/simple;
	bh=odHtKhyc9x4N+VpJWpMYT8G+At8j5bJ+9xLfXcp3Ibw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxgQmwYMk+KHHIyAj29gYg0BqsdKbygQPDwX/iU3GBWj55rnZaEMPNQCfp72oQ/0+1Wo+2CzXiCBSiv4lB+s3Q4ytYA5DmX+fS4gWLYSxs2jbfFVI8hWYZ9CSVcNW74AX9OOJnvtfwAaNRGwWxo6PwixTCXvIlunW52YgV0LA1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ABKj8apY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ABKj8apY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721061341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iS9Rw1EkQ2Yc2L2pZuUTIBeOwAXBu/F5Bf6ABfLlinU=;
	b=ABKj8apYav5iK5fhj6b0On/XH6rThwKHKGgkEtNPCGOYe4ver8eaweCOog6yaBoLqCR8N1
	jX5b8+NSliuTgIzV22Sfryiq5TSNzL1f/E0/QsGjh9YiMvlXqVRDShrvFyGsfgdLQwNTZC
	MaPjNUZsObU7I0VHufOMEsnQOGTqVjA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-e_vqu6NAOgqEP-PJuQWxkA-1; Mon, 15 Jul 2024 12:35:40 -0400
X-MC-Unique: e_vqu6NAOgqEP-PJuQWxkA-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-38437330bb9so52630625ab.1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Jul 2024 09:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721061339; x=1721666139;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS9Rw1EkQ2Yc2L2pZuUTIBeOwAXBu/F5Bf6ABfLlinU=;
        b=uiqHPHiItH6k23HoVr13R5bPaXgbX2DR+w3AszL9I3+ObnBverTGjRE4fuwpJqnVFZ
         9WUbbNyWZ9iO8r9+xiAOriBYZQUnUR1Z08wUi2iOJdTXOr4q40HtQcDtaTd6DQ8gNTp+
         vdCGJx/PnYv52kO00qprLihmgGRfeNK5Dv/ZR+9QtZjuw7nj7gTFZTWIyYXxJ/Vs/ksv
         n/BkTENCavuUA0xRt0pOqy6JTnsJXWqw9XzcNDOMruQAqJhgPmbNNk1yhHKBw3OvkVpQ
         69bRAHq/5keYAqJ5VLBJIb2j5XoMSo813KJq/IMvkjMpVSmM/d9IGbxWgLv4xaHIqoUH
         Z3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBDcy1TEezw9iIl4A7Vu6wq9E1UpyAvk2j4aOrl8fCOgUBNrQnNcXISAEruXPfYtdtjcIQmxXn1C8lCqJAAUc4InqGHb8QB1yqBtMZ6quH
X-Gm-Message-State: AOJu0Yx6OPIFRKnEk8vFPJEcRaT2b/yR+wxSfUCJJDLkSiSTwAWxdgeO
	JzjeA6G56KONWvG+AgV1Eew6SJ/hJoNMgtF8PsIgsm6DSO6R6J5NplXbc47p6LHz5Pcz0TH+fl4
	YDgZB+1XIhr+guyss9z8uzMjbg2p7JcCo3l6PwXzY94rG5cNPLIYiefGQQsjqFZQ6nw==
X-Received: by 2002:a05:6e02:20e1:b0:374:9b99:752a with SMTP id e9e14a558f8ab-3939f4af59fmr4333765ab.14.1721061339010;
        Mon, 15 Jul 2024 09:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5GGCFUYrZmA3U7gSzsm3iXM+W7dKssQ9LTw5nTg2Z6p8f6D0pQ16AxdkbJqYZil9SOQDSiA==
X-Received: by 2002:a05:6e02:20e1:b0:374:9b99:752a with SMTP id e9e14a558f8ab-3939f4af59fmr4333545ab.14.1721061338793;
        Mon, 15 Jul 2024 09:35:38 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39010ce5f54sm17490725ab.56.2024.07.15.09.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:35:38 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:35:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kirti Wankhede <kwankhede@nvidia.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] vfio-mdev: add MODULE_DESCRIPTION() macros
Message-ID: <20240715103536.3e1370ef.alex.williamson@redhat.com>
In-Reply-To: <3717c990-ac93-4a43-a33c-bce02a066dfd@quicinc.com>
References: <20240523-md-vfio-mdev-v1-1-4676cd532b10@quicinc.com>
	<a94604eb-7ea6-4813-aa78-6c73f7d4253a@quicinc.com>
	<MN2PR12MB420688C51B3F2CC8BF8CA3A8DCA62@MN2PR12MB4206.namprd12.prod.outlook.com>
	<20240712163621.6f34ae98.alex.williamson@redhat.com>
	<3717c990-ac93-4a43-a33c-bce02a066dfd@quicinc.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jul 2024 09:17:41 -0700
Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> On 7/12/2024 3:36 PM, Alex Williamson wrote:>>>>   MODULE_LICENSE("GPL v2");
> >>>>   MODULE_INFO(supported, "Test driver that simulate serial port over PCI");
> >>>> +MODULE_DESCRIPTION("Test driver that simulate serial port over PCI");  
> > 
> > Seems the preceding MODULE_INFO needs to be removed here.  At best the
> > added MODULE_DESCRIPTION is redundant, but "supported" is not a
> > standard tag, so it's not clear what the purpose of that tag was meant
> > to be anyway.  Thanks,
> > 
> > Alex  
> 
> My preference would be to just add the missing MODULE_DESCRIPTION() with this
> patch since that fixes the existing warning. Removing an existing macro
> invocation is out of scope for what I'm trying to accomplish.

This adds a MODULE_DESCRIPTION that's redundant to the current
MODULE_INFO, therefore I'd argue that it's not out of scope to replace
the MODULE_INFO with a MODULE_DESCRIPTION to achieve your goal.  Thanks,

Alex

