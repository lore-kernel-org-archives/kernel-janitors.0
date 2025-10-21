Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF72EA17D
	for <kernel-janitors@vger.kernel.org>; Tue, 21 Oct 2025 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761041503; cv=none; b=nIpMEaLkrFLwiTxhfON2JHc45QYsRBoVumtuHhivrlIVhlZfVM5e2Epz4lIgghpSMhoFGWiau5d2jmKZUdRZiNaAvy+ugJLqB5pKyW/5qBV0IC9yLENzUFEwL9W662iH8JexdURvo4S9bDWqQghch31xMujCzhm1p35OUZqihhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761041503; c=relaxed/simple;
	bh=WiMf9dKx3lK/m+WFc7bYk8BEVUV+C2IpEy0TaPV7vQA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4Pl/csP2IKffgoTwUCoO9tSQ1eMDRnN+3klbNtu/7xaJO3h4/766ttZAf5GVRQkwvI5/69gvWBEuvoz0Ln9hHBoDn1YkdfFu3oFAC02o1W68yJjB+wE2FOb3zUcZcFj8IEb4IfbTt4Abl/cQZI9Rx8HUE94cL8voAxiWHJe3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b2fmxSKX; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b2fmxSKX"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b64cdbb949cso881411066b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Oct 2025 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761041498; x=1761646298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWn298GnuRBsbGfuPpfpx5jbtRMR1Y9OyRz1ODcUKUo=;
        b=b2fmxSKXL0wByu96jWuJXkdBj6GoTipFb/7tR6QSYay2JhCAzKEpCH1Tz34LEnCi2c
         fpnLy5f2ft8802Fpb2c0gwu04bx/car4w6S/ikv2DthfS7lQrUjBWhbxSwBhjQaLABrH
         zRESNVJhXDMnQgVWwb7hK+nurwADTfrmCh5Np0mlXgWTcj+h5w/rJd3borkya2b/A4wX
         nYTsyg/TkQdB0X+vOLrjK0Z3lf2BNyJ8vNcTg7Q+Ady9ancLfefvtlwi/8L9B1wMyZQv
         mj851BawoNRK8mvj48BP/ygNrEZJqjPjje5WWj/XUyE6z0wh+nHXFeA0/qTb0taJDImx
         N34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041498; x=1761646298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWn298GnuRBsbGfuPpfpx5jbtRMR1Y9OyRz1ODcUKUo=;
        b=OHUDs/IXlpEpghWwC70Ka9qydiYiuAt5APCw3fVb72U2y8cnp4KeFOUCdpEP34uSIM
         NfdE+QY04+b6Fpwiv8+PVkoutEki+FjL6kibiGj42P9aheq3S4eaRy49YQcfDhOoJl3n
         npeTlhnoFqnyeNGCUVa2mi1djR893vnaLNeid/iXY7SH+/bWfF4HeUvniGQorphivmCi
         npkCW9n6EJQdhSXXnSKMbf7RsoSwi9tGNJ9vyEyfcny8F1SqPvDMXijUUuknqqXG9Epu
         IzH8Vy8gUMRVCaUzKlC/L710nB4mLew1s7Wcy9u9/WHwCGgrjombKu4+s3tQJ2HyRK82
         dRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbwGwC0knhkydeGeP8rqJoDvQnoynQ8SilZL1TDufPYJ5EQRkWUVImUxp+8o9cindzGqYZC1F3L3aq/IsaAvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDRauDY49e9jOlpxdw1owLdQwaDCqDdGJMZBujtnx5IyYnVyf
	gHqgGfKRYfUo+5p1GJehGT9ivkNjtwJm76cHy9Gyl4oBmHY9tXN96XEzPMbQdKEimCI=
X-Gm-Gg: ASbGncsKx55t0Av3WfEHyG7sYPvCxvLQZyhaZ6VmMNzxWUG8GlBkoO7MuWL1AC61AXD
	rv9Ls+hv+LuR1SgQ/vdYfvYMJhEfaowTYIyi8CKbm/z7kCT8mJktMNvwiKyr/qBlddvHpZyYCdv
	VWhUDyBrcaBmCanXgTukKg+xjLCyFtvSVJOsJ8kxaqNblmUgMI1Ja1yxjLw37x/dC6SYjWwT0gT
	WWDUUR1MES9j3eBh4qiFqe+OESJBw1ybJEGIrcaQWV79YLJGDvOifQDWGGZ3xEublCGd79c254i
	UxDTNyN7V+bByO83fk7EuhYfiM5YAVb7/4AytBAly/VZ8ptEcpH4oHjxbwYjMRfhZg84ba+5X6r
	6B0OFW0HFrd54LsudX9TNgQk0sI6Lpvgo0Umy9uS1+pcQXz0e4l+5W2tX3J2VGSQRtM0GXrHikT
	ftb4ckHwhpumpEciWXX4v9SRZuWFrMY7UvQgXpYiI7k7RHaNvVurs=
X-Google-Smtp-Source: AGHT+IGtc+wMv+0/UvOWo4ZlIFtKwvrLvoQzsHEcKxZ/ii2ij83WJTxb9LrL3zXX8owfzEY1HOLjPA==
X-Received: by 2002:a17:906:dc90:b0:b3d:c47c:7ce9 with SMTP id a640c23a62f3a-b6475706b58mr2122637066b.54.1761041497898;
        Tue, 21 Oct 2025 03:11:37 -0700 (PDT)
Received: from localhost (host-87-9-62-200.retail.telecomitalia.it. [87.9.62.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8391547sm1041437966b.22.2025.10.21.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:11:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Oct 2025 12:13:49 +0200
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Anand Moon <linux.amoon@gmail.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] misc: rp1: Omit two variable reassignments in rp1_probe()
Message-ID: <aPdc3Zm4GrJUs9s3@apocalypse>
References: <28b3e6b0-0090-4256-8dd6-5a01fc4bd576@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28b3e6b0-0090-4256-8dd6-5a01fc4bd576@web.de>

Hi Markus,

thanks for your patch!

On 15:00 Mon 20 Oct     , Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 20 Oct 2025 14:51:43 +0200
> Subject: [PATCH] misc: rp1: Omit two variable reassignments in rp1_probe()
> 
> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete two redundant variable reassignments.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

> ---
>  drivers/misc/rp1/rp1_pci.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> index 803832006ec8..3baea1a24549 100644
> --- a/drivers/misc/rp1/rp1_pci.c
> +++ b/drivers/misc/rp1/rp1_pci.c
> @@ -226,8 +226,7 @@ static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	err = pcim_enable_device(pdev);
>  	if (err < 0) {
> -		err = dev_err_probe(&pdev->dev, err,
> -				    "Enabling PCI device has failed");
> +		dev_err_probe(&pdev->dev, err, "Enabling PCI device has failed");
>  		goto err_put_node;
>  	}
>  
> @@ -243,8 +242,7 @@ static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	err = pci_alloc_irq_vectors(pdev, RP1_INT_END, RP1_INT_END,
>  				    PCI_IRQ_MSIX);
>  	if (err < 0) {
> -		err = dev_err_probe(&pdev->dev, err,
> -				    "Failed to allocate MSI-X vectors\n");
> +		dev_err_probe(&pdev->dev, err, "Failed to allocate MSI-X vectors\n");
>  		goto err_put_node;
>  	} else if (err != RP1_INT_END) {
>  		dev_err(&pdev->dev, "Cannot allocate enough interrupts\n");
> -- 
> 2.51.1
> 
