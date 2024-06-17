Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CADF161320
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 01:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718589169; cv=none; b=MzYhEOODJcAk8CSzXbHGWf1ZJdUWcprk2AxsXYohm2e8Sa7YHYF+3YtHYYgZXCCeT1uf1zw+Q9wui0W46b150drtUjele2/7CCPrbZOlSsuTHFYK6QMK9+naC5HuABZDCJ7OLG4m6R+OQR7B4QE1dd68qtwvJ6I+B9R2gpwlMsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718589169; c=relaxed/simple;
	bh=sTJ/iuTrsEdSBS5qgmnl6h5mYl1g8hs6XygUrJRR7A0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHrFx/jjQc0SXCXG/Kgl9FG9WULEwIhI5RuX63WHweukVVJKtyE1IDGNxxe0CYTjws3zGqdJFAZfoLBSiHnqtUlLuYuIVAuVxIlFjaAZkxj85SZuY8D/BxVHsa635wDkukpFIUYC1+QEe5akRuFeb1vYGv0VYkE7OHYeBPqVExo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JJFTFOc6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JJFTFOc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718589167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTJ/iuTrsEdSBS5qgmnl6h5mYl1g8hs6XygUrJRR7A0=;
	b=JJFTFOc6HlOD1n+sow2Jigc73ftOD9Wm1kZhYkGimBR5VgqAOHUvUawgYlbqkMaDRKEGji
	4UUNXRCXPDHQosqj5YEHIsSG/ZBrGJKBZVnfILftTqc/cNhfwhAGwnRaRT/7se6h+04VHw
	HR3Urt0PVs+pqSpncWAGtS2svklkOls=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-0zsqBT4YOb6wR5JWgx98Og-1; Sun, 16 Jun 2024 21:52:44 -0400
X-MC-Unique: 0zsqBT4YOb6wR5JWgx98Og-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2c2dd66e05dso4266479a91.0
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Jun 2024 18:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718589163; x=1719193963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTJ/iuTrsEdSBS5qgmnl6h5mYl1g8hs6XygUrJRR7A0=;
        b=QOBW1GSIL1uExqGRJK3dghj8ISAF0wWvj8mqgqRcYPfLRUeyHYu02UeCsXsho5rXTV
         3WdPUydfo2AJdIUYq5sULcfRH5pn3zBgUpMIu535yGoiyAbj/OZu4RtIZ3K2NOv9JgHt
         rMlOyu5BmdTjrL1EdnR6wVz0wnAZuJeaS8xMGY3IFYdrMADaSZQZDYsW0VBaPTmPb3AO
         ze7vsSdASuO79/at8iQrAj0j+1c1T/Tya/t9CBdAcMnUjJ/R9R9lfj9BHFxUrz9yc/G7
         sP59y4VaaT59oQ2YPCMQ8rcwL3308AySg7IJHcQ3z31aK157e1dUXIXLlFeQdCD9QaT2
         a8DA==
X-Forwarded-Encrypted: i=1; AJvYcCUIvULfnuUYbqZ4LtA98nHDDw4tgFzgAbbH0WGatsiJhh/5zLRLy5m1oduTaJc8dyXkwcHXOtxICB8TdKi/7IOJY57dvMcSL0eGbEVogRMG
X-Gm-Message-State: AOJu0Yz7hTAjZnHJzUrbU9Py+g2KrnZi8s+CeF6uAQan3yDv+AG8vE7A
	XxIopGFhlnseWrwQHsJkq8GYneLG3aYp5Le0yutSmWagm0OHpbbckD/6CG6oQANxmLvSxq7cgX+
	vtAQH4SR2U4jqrRjaB4Mho08/dytCwYizDpH/avCB04r2ecO0knG+gqiyY3Llb09ifrnMjbOXlO
	Fa7t8BHZ0IO29ottxHbagVeGRL1UP83hgvBX7tOUoO
X-Received: by 2002:a17:90b:1213:b0:2c4:a974:bc79 with SMTP id 98e67ed59e1d1-2c4dba4cf41mr9455806a91.36.1718589163038;
        Sun, 16 Jun 2024 18:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+QQNT5453eJc8Q6wrY2MwQONVCUdTNKrjoTG9l0wExtAxoW4PcawA6CbvZ6/VnsBDwc00gN9K/+tJsC+cH0k=
X-Received: by 2002:a17:90b:1213:b0:2c4:a974:bc79 with SMTP id
 98e67ed59e1d1-2c4dba4cf41mr9455799a91.36.1718589162769; Sun, 16 Jun 2024
 18:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240516-md-vringh-v1-1-31bf37779a5a@quicinc.com>
In-Reply-To: <20240516-md-vringh-v1-1-31bf37779a5a@quicinc.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 17 Jun 2024 09:52:31 +0800
Message-ID: <CACGkMEvdL4ieDDbpwy+MGBbHjia5UbbJQfUidh2btG9vPcvWpg@mail.gmail.com>
Subject: Re: [PATCH] vringh: add MODULE_DESCRIPTION()
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 9:57=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> Fix the allmodconfig 'make w=3D1' issue:
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>

