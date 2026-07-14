Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8673B3603D5
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039603; cv=pass; b=o69tA9RwMCxSNCVCxb96Rn4sC7j7oL0DLVlHb1+ikuXguHq60cO/YkLS52+9OPmqoLED8sBpuX9W0TB/nhTG03v07FoOzm0pn8jWFnERWKCTFa3k3WuFHthct+AbnXP09pn/dMeHZFapperPk0mrJv1Rc6w7fsYxmQwKB1q0GsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039603; c=relaxed/simple;
	bh=gXFrmG6jEHln72CF693YGMzKjCQZLOAxrQG4Tt+4Pxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnmJzKRv9yORkcW5Hv6SW6fA+qhuhkt3C+hxFJWYTb8VvDVhANAI0Qcu/hVnTgrIN8W4nAGOpvlRom/qrY5/BhZxkKJNVnj4W3WvFlQ3wy21Dw3G1saBmaTL0WLNgQqxaj/ZOdNrA+wV0jw7riFW1o3AlMzC78o3Ze87/2F4lBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBfUezJ4; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBfUezJ4"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so6228066a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 07:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784039599; cv=none;
        d=google.com; s=arc-20260327;
        b=hyB4pwNm79Tg9E+vUr4lfts2yh5sXIEbLpNgr5Ai8F0XUAJcSr1T/5Yr7w0OSge6HO
         iesIO1yI5N5qhK+VAxpCMD7Rz1/mYm9xIvd0nZAhyCDX7BF3jObl2SrS44CbsbFiuCAI
         55lBZnRqc23NZ5tSuN5ZY7TUBLFW7eSLpNZDaBvAmHJA9R5eJysix9mlsR0rK2Znt8sJ
         LeOYS5NdMuqdOmhigWs95Mka2DJiJSZ0Oxjahm0l0M57ihxsU2IKbJoB7tSzmc+LTEOy
         0SCfAjE+81k2HVY+wDuX57QrpvP8zPoGfM6SO+CSeppSjxqb8YPTWzitCD7l7ULnXiNL
         yT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=myhkGa3cSq7N/yY58culCXKcRn2P9s26LCZA9dzv22M=;
        fh=Ny6sp0+ZqNm/zT8E7HILSAFFVx+knfzuErfhLkEdMsk=;
        b=KWX3tojGKMDLRreiLI3dT8xavbe1k2X67Op3vl1FMOgEK6u00XpbHUZF6ZQWwi/WfE
         I5gbGuiN7Qy7BSzJOEedVSvyoQwgbVjxQKkexX9SPlZ80O0Z5sPSYFXNcDd1lOWTRvrD
         lezi0A0bs8Bmz5E6rZdAGeMrD5rqvrLYbbS9vmlXTKp5FVj8pZ3HLllCK1I60iMKbs5R
         0jNDLsN+6UtYJ1EABbJCH0ouXfwfSuDgpvUAo1UPFyFBwNDc5zokTRzwTzYLtoZ0DNC/
         +xJx4/NgxIFMvZl+pBTMpt8Qj7+ygP/p27wiNNc0coa2c9q6Nia5mD75ujMALEIZ1DNc
         RWUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784039599; x=1784644399; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myhkGa3cSq7N/yY58culCXKcRn2P9s26LCZA9dzv22M=;
        b=dBfUezJ47ekK7SmRkxPAn7qKA/64f8Nu42+m/AQQsYBbpgK8GoYVeMBc2qy/3F59RJ
         nQt8K7UV5U2e/PmahuiJs7JRjrgcYBEMajOO0fv2C72vpch51Ps2e0Za74rr4tTxal0w
         vcXXO4jz9p27zeGrTaPBMWNoUZKj9a/xUmnEmzb2fT7UQ4fMPuib5P35elAk3u1UpBLg
         5NLRLKsQII2P9UyOfbD9zR2YW9cESLyFhMWrAFIPFGmDJeSlHsOg9nx4x2Iaor/eO7Hi
         e55PST+tcvp7XNXZIQp+/7dEPdhqO9R5oNI5osvTBdotRmIxSYYuT2clQF1L9kkRGHyh
         R+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039599; x=1784644399;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=myhkGa3cSq7N/yY58culCXKcRn2P9s26LCZA9dzv22M=;
        b=k+4h78tJKjeYygJ++vdZY3hFLGAM86+J2i4Oakdsx73m5k1JNWSI9O2+lPsgsd4sPF
         uuDPIIWA05HiUQHFFN9RqH+iiSnrbnf17vCbCjlneRkCSXYPoqz5XfKzt404e0HCAJbR
         CBs2Uj6bdix0cvO9Ve31GrYjTmFzO9WU3k6VgI5QWLhLJff5wK9SECPJny6V4lKPwW4s
         rQNkOiQ32Kn1wJL/j1n1i9WuaUx56UFHR/CLpkihpVd+qHqwc5nPLhGRIjhI73sHN3FA
         ZHoVB+AklLAgICjsTVfdNyqoXaDxI9vMQjwu+gstFUwCT8/x2uoQvy0nrC6eVMYCtUAo
         Uryg==
X-Forwarded-Encrypted: i=1; AHgh+RqBl/BAOl013AUo8mty725S/J05DYyygzGc+rJB88p1aAiD2pPV5Pd5iY9eyvilFzFtfK5yZ3Z/1v1jMO1hQiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRze5wKUM7ZJUjWpTbTBQiBVbIOp1MWfvMvtJj1B4K7348TZB
	de/GC3TPhTY+ZsyBuvyeySM/81BqpfMHGDZmABwBL+sq2xq4GKo9x9FQ1l3wk0Kr85hiBDzBsJi
	6ugi+udEfAsL6unZlXdCVtnxN1ze4oGo=
X-Gm-Gg: AfdE7cnG5VpM1EfoC7VSV2c6F98l6OvEf+T9i40fORqz+Tj0CXr5bVZTTjXjOAhqo/9
	SQBPToKHohmOB2i+5/xH2Z4/ZQtWiW6VGHmtDF3emEcOZJkK6kuCl50jDMU6leNUfzbYWN2PCFg
	OBF78EidCGGerWN0gbrql58Z1dOZRYT1mj+ZWVs9Zl5GtJSIva286YpEmO9C+NQExlMHy9z/vWe
	/2yd+Mmc9qqlJuFcT2PLB8xOsZKIjTX+CkFrXStCRWmJeecsbI5P3gIRWmtFpb1kGU6FQSq4D/Z
	Hk1px0oBe/SfWd1N61ELbn0G9/waQ8j2kBg2LaKlRBLHDjcLmsrtSzU3JxJqTA==
X-Received: by 2002:a17:906:4791:b0:c16:71:d9ce with SMTP id
 a640c23a62f3a-c1667996520mr142371366b.8.1784039599064; Tue, 14 Jul 2026
 07:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b0a22171f3ed68e156a2fa84383e99c23ec6b2ff.1784037977.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <b0a22171f3ed68e156a2fa84383e99c23ec6b2ff.1784037977.git.christophe.jaillet@wanadoo.fr>
From: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
Date: Tue, 14 Jul 2026 19:59:36 +0530
X-Gm-Features: AUfX_mxwZgJqJ1IU2yY6JoQF_Xog1NgxPfEe0ScKaP2Rhn8fgDalvg7vZYXv3JM
Message-ID: <CA+LZ_WZXo2Dv_xTXT+raGCg=HMfcJ1O=8W6wJ2MAy9-iEYM4Vw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: Constify struct dma_descriptor_metadata_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:45, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct dma_descriptor_metadata_ops' in not modified in these drivers.
>
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text    data     bss     dec     hex filename
>  120635   21584      64  142283   22bcb drivers/dma/xilinx/xilinx_dma.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>  120699   21520      64  142283   22bcb drivers/dma/xilinx/xilinx_dma.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
> Compile tested only.
> ---
>  drivers/dma/ti/k3-udma.c        | 2 +-
>  drivers/dma/xilinx/xilinx_dma.c | 2 +-
>  include/linux/dmaengine.h       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 1cf158eb7bdb..fb21e0df5ab7 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
>         return 0;
>  }
>
> -static struct dma_descriptor_metadata_ops metadata_ops = {
> +static const struct dma_descriptor_metadata_ops metadata_ops = {
>         .attach = udma_attach_metadata,
>         .get_ptr = udma_get_metadata_ptr,
>         .set_len = udma_set_metadata_len,
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 98b41b8f8915..bef2b031dba1 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -655,7 +655,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
>         return seg->hw.app;
>  }
>
> -static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
> +static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
>         .get_ptr = xilinx_dma_get_metadata_ptr,
>  };
>
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 6fe46c0c9452..fe33a20abc61 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -631,7 +631,7 @@ struct dma_async_tx_descriptor {
>         void *callback_param;
>         struct dmaengine_unmap_data *unmap;
>         enum dma_desc_metadata_mode desc_metadata_mode;
> -       struct dma_descriptor_metadata_ops *metadata_ops;
> +       const struct dma_descriptor_metadata_ops *metadata_ops;
>  #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
>         struct dma_async_tx_descriptor *next;
>         struct dma_async_tx_descriptor *parent;
> --
> 2.55.0
>
>
