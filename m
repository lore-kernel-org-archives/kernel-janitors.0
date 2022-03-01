Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091B1C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Mar 2022 11:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbiCALXg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Mar 2022 06:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbiCALXf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Mar 2022 06:23:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D3F3C49C8C
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Mar 2022 03:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646133774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pFMGRfIAmrHrnLa3rzlWjdovVbrK0w7x/Azrkml2F4k=;
        b=CxZKKkRSe0hVHBAj1hYwGPtx9sq/PYqPZQ5Z4aFCJLxNH84feo+1m7xMocd6qXvjIAIUee
        QVDMexB2obHizvGAK2pXhrzrZ0AepXP4+07QYclRH7BeOp+2jY65OFK189EJL5aoSqdKYu
        K+YKeUv098DW3WWSeTPRDLnauEaow5Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-xOS4H6B4OTSnqNa3WIN42Q-1; Tue, 01 Mar 2022 06:22:53 -0500
X-MC-Unique: xOS4H6B4OTSnqNa3WIN42Q-1
Received: by mail-ed1-f71.google.com with SMTP id h17-20020a05640250d100b004133863d836so7640058edb.0
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Mar 2022 03:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pFMGRfIAmrHrnLa3rzlWjdovVbrK0w7x/Azrkml2F4k=;
        b=E/ZS4TtfTfiP5ulJHQ/V+xRYD47QPUy7KErHDBE1GoyDnuUyUEekifYzmZtPrBf2f7
         qu9IDEQlHUbvP3p+5DbUSfJR++lwlhxcRBMIPhY2KKNZwCmRejxs24iDzWVGOuq++Nsk
         XFeuvP13ORTqQ0A6NJ7/QBYW4SYg9yvexNwQMsiHFIzs5diba3u+REz5dnDgm0BomUOh
         OLptsIW52wCBI+BYda4qAvm+q5YSldqfcntd+7EDT2+R39OUe/mtTq8DTqjWF0Z2keEV
         GUmf4GpIGSvZ0rIqi/41rhQdzcwdtFILNVkjJqoiVlSNGdGPHIcb3nuu3INCADoU2ynl
         +DMg==
X-Gm-Message-State: AOAM530cirRb2E8Bxy8CoW2aIKAZ2MFjdkHSYcFxnPk7GRu6go/lPuSi
        dlgEV6F4PO8kHj5N8NPe3AQHaVUE9lhnkYlJzK7HpFMfmoAeJhfhnvwTZRY9V3DQKLPHZV/EfeE
        VVXUpo9m3HcotMC2jES0DNlu1Il+t
X-Received: by 2002:a17:907:1de9:b0:6b9:e4f:25ec with SMTP id og41-20020a1709071de900b006b90e4f25ecmr18442058ejc.741.1646133771856;
        Tue, 01 Mar 2022 03:22:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+FvelUXqjUMkFgQlPbM4vmDcfG8aw+ARZ98e8mbNjb+ZEBkzBWNtvUDQB7qjysKVje2E3iA==
X-Received: by 2002:a17:907:1de9:b0:6b9:e4f:25ec with SMTP id og41-20020a1709071de900b006b90e4f25ecmr18442036ejc.741.1646133771584;
        Tue, 01 Mar 2022 03:22:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id et3-20020a170907294300b006d6534ef273sm4619085ejc.156.2022.03.01.03.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 03:22:50 -0800 (PST)
Message-ID: <497da433-f300-cfed-33af-02b8e9f16426@redhat.com>
Date:   Tue, 1 Mar 2022 12:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] x86/PCI: Fix use after free in
 pci_acpi_root_prepare_resources()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220301081010.GA17375@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220301081010.GA17375@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 3/1/22 09:10, Dan Carpenter wrote:
> The resource_list_destroy_entry() function frees "entry", so move the
> dereferences before the free.
> 
> Fixes: 62fabd56faaf ("x86/PCI: Disable exclusion of E820 reserved addresses in some cases")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  arch/x86/pci/acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/pci/acpi.c b/arch/x86/pci/acpi.c
> index e4617df661a9..fa89ffba2e51 100644
> --- a/arch/x86/pci/acpi.c
> +++ b/arch/x86/pci/acpi.c
> @@ -357,14 +357,14 @@ static int pci_acpi_root_prepare_resources(struct acpi_pci_root_info *ci)
>  	status = acpi_pci_probe_root_resources(ci);
>  	if (pci_use_crs) {
>  		resource_list_for_each_entry_safe(entry, tmp, &ci->resources) {
> -			if (resource_is_pcicfg_ioport(entry->res))
> -				resource_list_destroy_entry(entry);
>  			if (resource_is_efi_mmio_region(entry->res)) {
>  				dev_info(&device->dev,
>  					"host bridge window %pR is marked by EFI as MMIO\n",
>  					entry->res);
>  				pci_use_e820 = false;
>  			}
> +			if (resource_is_pcicfg_ioport(entry->res))
> +				resource_list_destroy_entry(entry);
>  		}
>  		return status;
>  	}


Thank you, I actually send a new version of that commit to replace the original
one also addressing some other issues:

https://lore.kernel.org/linux-acpi/20220228105259.230903-1-hdegoede@redhat.com/

I expect Rafael to pick up the new version, resolving this. But maybe
Rafael prefers a follow up commit instead ?

Regards,

Hans

