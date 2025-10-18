Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF3628725D
	for <kernel-janitors@vger.kernel.org>; Sat, 18 Oct 2025 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760779373; cv=none; b=frD01RNbH5BoWXnIX+DjtNC+k9aYrJISbQUmqAru78ILfIrh+1TXzNWahfQ7zN9EZaj8abF3mRfwrZBtbTqcTWaG3r4WSLNSnE/mdVLrTVlqiHMp9fwirmXqaaCSBhZaWiIIbdq0aGxHRWdY7hiSvegwDJuPh0Ovtzuai7Tgd88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760779373; c=relaxed/simple;
	bh=TaNfOnzJ37bdn5EXfdLd2aTU48YjWL9W2O/pFm741og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhNIrr3q0oVQroCnwosmHKCzoVEVds0uyvzj3cjrFc4CTwRapikHjvPghcxpcwuj1NSa9i1G4RKoQBXEZc2OmjGGSFYN5yEjvHipmEfPa/eiHsfxsYhdNKdTIRTGGOIUQDjiSKEZnTZ8S8wgZnDIMYwl94RLrx7z+CQgCU25orQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKguXYCC; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKguXYCC"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so4361499a12.1
        for <kernel-janitors@vger.kernel.org>; Sat, 18 Oct 2025 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760779370; x=1761384170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TurObsZFmrfjBqIYEt3cBVpmlVp4mzQxFn3YwyTBUP0=;
        b=bKguXYCCOLX+jMX4AR6a2vfDNmZIPJ2zHZMW+NdflzXyraDI4hat8pQl6iz8Qo6zn1
         4Js2W7/9eUFXNeJ8vpejEMyRClMU/p6cGV2kDS1c4yZ3JvFF4OA5zVnFu01fRrdehSwk
         g+B3Aodl5STcsGIey0S4+ZipJtvt1eGlhDbIKqFHhepwahAIzhkQ9qPzpXYA/14olhPO
         RPpSDaeeX4F2TJdSzU8pF6pKKUKHQaoUk/SG03V1kz3bT7WTvqnbbi4dpLdcO6/gVRPj
         P1vaYIkcG/jQ7FP6+YCTiet2l8ip3mwatkbNSAfg529LoAdPdD2cZElDx0IsY8qPqmdx
         aeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760779370; x=1761384170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TurObsZFmrfjBqIYEt3cBVpmlVp4mzQxFn3YwyTBUP0=;
        b=OZQEbSk6wVvIpBhsM0PViRjkLbXrqAJqgV8Yf+4ut8vJ26q+0tyzbm4O3id6EiQxAG
         oy/tJNRNbyaOhY7Dkei2zL2CprQNiu8q/umg5W313myEjIZvS2Vo/Fw/U0CGRPia8hbi
         FDJlN5yNKYU1eZR615+9QArdl0ju0RXMLEZhR+lCoxU5gVjJz0qjCZhLkxBIzQJfIwDh
         0ZzAdLlqEoa+BWG8oBU9HdxugdT2UD6jbA23zacCos67lpR11TbZPcXZk0NTOCTNW86R
         63GXMKVLNkpQJMVt0ftO9qZvB97+uTcFltrRsDT7vqZbYw3WdgHecp4vP/0kwc5lfkPN
         40PA==
X-Forwarded-Encrypted: i=1; AJvYcCVBxxyeZRqTGNi4F3/LANu2SR0eutQxqKfdLi4vsvsLm+M74vArGjQOSSnxcOHuf4Tjl3NsJ5DFGBk6y88Me/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTDFnzVJTF1eoljCsWoubhhQXcZFb79oVsx4xEZpatBcKYL1F5
	XObkVH24qRbWKwKsB2g7166JfYFiJAFUmMJ8LJMaMA3jaXNdbOUk/Ruf9u44lj1VJ1IBkzF8KOW
	H5Hl/N1DyQkG9eTF89n7RJkWixyyZpGw=
X-Gm-Gg: ASbGncuazUr0euHGPs1E5YzPcMmVP8u6XYNCu2zT+wVUGkbTVdSlCyokVD81rqthUrY
	BccHmE6BpnnUMXR4v5fgj9+alAhtMajXqYsVKsadUunlnHNxY4eh0GtQ31vWgNeOADXL1kYQUhU
	aOM7uxK8rbgxdNRoy6f2uuiDjlllQCAP24lKHlOUmfWyk2ELZXWFvbuEFaj1K6rr1/xCqjwE/lG
	Mi2iepkfQAOv0todgGMDCfopEiYo3ylB4Ll9+9+Isz2ko6ocb2mT9o++ivrjXKiPZQ23A==
X-Google-Smtp-Source: AGHT+IHw19pBZ9IqmqMp9HxxNmCsj695WdYgJZRejOrWZTvR3/bpEeF5am+muoYu9/EE8QnKVNq6O32MbmibLE6n32Q=
X-Received: by 2002:a05:6402:d09:b0:633:7b1e:9aa3 with SMTP id
 4fb4d7f45d1cf-63c1f6f6269mr5785386a12.34.1760779370419; Sat, 18 Oct 2025
 02:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014113234.44418-2-linux.amoon@gmail.com> <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
In-Reply-To: <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 18 Oct 2025 14:52:34 +0530
X-Gm-Features: AS18NWDbaJ8hdNv-j0Yxl1ICNkckxlgqQRK21f2Q02tESiNZuDiGqp2OynZDz4k
Message-ID: <CANAwSgTtaAtCxtF+DGS-Ay4O3_9JMwk-fJ27yoijhWWbF2URrg@mail.gmail.com>
Subject: Re: [PATCH 1/3] PCI: j721e: Propagate dev_err_probe return value
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-pci@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

Thanks for the review comments.
On Sat, 18 Oct 2025 at 14:26, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Ensure that the return value from dev_err_probe() is consistently assigned
> > back to ret in all error paths within j721e_pcie_probe(). This ensures
> > the original error code are propagation for debugging.
>
> I find the change description improvable.
>
Ok, I will update this once I get some more feedback on the changes.

>
> I propose to take another source code transformation approach better into account.
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L5031-L5075
>
> Example:
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/pci/controller/cadence/pci-j721e.c#L444-L636
>
>         ret = dev_err_probe(dev, cdns_pcie_init_phy(dev, cdns_pcie), "Failed to init phy\n");
>         if (ret)
>                 goto err_get_sync;
>
No, the correct code ensures that dev_err_probe() is only called when
an actual error
has occurred, providing a clear and accurate log entry. For deferred
probe (-EPROBE_DEFER),
it will correctly log at a debug level, as intended for that scenario.
For other errors,
it will provide a standard error message.
>
> How do you think about to achieve such a source code variant also with the help of
> the semantic patch language (Coccinelle software)?
I do not have any idea about this.
>
> Regards,
> Markus
Thanks
-Anand
