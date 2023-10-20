Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EEFC001DF
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 13:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377445AbjJTNzt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 09:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377419AbjJTNzs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 09:55:48 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9682210DC
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 06:55:34 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32caaa1c493so626207f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 06:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697810132; x=1698414932; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b2DzarA0xQh4ACLILXDHfJLTXlPocLj2W25IPZIhrr4=;
        b=Q4qZjk/heJPoPxmDw0AMsk8Q4046Ru0jedo4Niz3wdvWpualcLVv39s5nigvMDCKbS
         ZF2Z0vk3WfG3HedFmwkJXPrNjnj9mQk6muUiuPe4jeQw+Ou6H1wajvdh9qNBBvOEQhFs
         4bo3UF36ulVxQs9Q0Y0hU2YFP9E7kxINQWLKJ39Ys/ZX06tzvx4QEvnh7SdfIjVDf1Vr
         ntgAY4yNxU4HX2m5uf9rNDLjTaMZJ9LMxKlcI+d2bNEbSaFREW8yxn46NdObEjAtFFTs
         0/qu8G+Gq6ngCIm+YsSfebByRrohkcWhP0kHwZhxmln1aVq96XAFefB3KsaI4XcvT7TH
         8Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697810132; x=1698414932;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2DzarA0xQh4ACLILXDHfJLTXlPocLj2W25IPZIhrr4=;
        b=rvlcCiFe9QTDQKgXJbzG2ci2hYqgVGD0eXITEmnj+M/mEm9BRwZYYeHa/Q1LAQGdkX
         XYRSL3D3ax8b2Ff/VeBaVX2iErMHVyEEIL8SOg+GrmjPcawVoyR9RKgTSr443io6aHmV
         lY48WTdKk+0Igs2b2IX9JJpDCQKAIUiQeT/5iL7Vw9DjWnJdNx617Xy1ugi5RvI2lOD6
         Q2G9L+rs0YP/OZd7a9hOLghQCKtcOqlwoFiUk24CAiHGIhCUGlGQkJquaTesz6xfLYu7
         1MBUQtcZKnu2VCvsA7WHLub8iYPl9BsPfVHTKZbKSBmD92EM60eOJyJjsJQIHW8yZ473
         PDIg==
X-Gm-Message-State: AOJu0YzE6mFgOzWsfSWFhQE+xNEK2s3G6pJ3ide5zBN2wg6Ti1cxBk8y
        gkYSLE8SLaPSA4F1tbz1ANxXv/+dxYWLWeyuQTc=
X-Google-Smtp-Source: AGHT+IHAe6MtvikVSj5VKn6OKvvbvt+1EzvNWF0+fQ9uZyNMNuTFuO+7UpF+QdP0xK9EzxMcQZPLQg==
X-Received: by 2002:adf:f487:0:b0:31f:ef77:67ee with SMTP id l7-20020adff487000000b0031fef7767eemr1693076wro.40.1697810132403;
        Fri, 20 Oct 2023 06:55:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b0032da40fd7bdsm1786001wrn.24.2023.10.20.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:55:32 -0700 (PDT)
Date:   Fri, 20 Oct 2023 16:55:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     willy@infradead.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] ufs: add ufs_get_locked_folio and ufs_put_locked_folio
Message-ID: <ba3327ae-3c2a-4a5e-a809-3716c278fe15@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Matthew Wilcox (Oracle),

The patch 2aadca213a3f: "ufs: add ufs_get_locked_folio and
ufs_put_locked_folio" from Oct 16, 2023 (linux-next), leads to the
following Smatch static checker warning:

fs/ufs/util.c:248 ufs_get_locked_folio() warn: 'folio' is an error pointer or valid
fs/ufs/util.c:266 ufs_get_locked_folio() error: 'folio' dereferencing possible ERR_PTR()

fs/ufs/util.c
    243 struct folio *ufs_get_locked_folio(struct address_space *mapping,
    244                                  pgoff_t index)
    245 {
    246         struct inode *inode = mapping->host;
    247         struct folio *folio = filemap_lock_folio(mapping, index);
--> 248         if (!folio) {

Should this be if (!IS_ERR(folio)) {

    249                 folio = read_mapping_folio(mapping, index, NULL);
    250 
    251                 if (IS_ERR(folio)) {
    252                         printk(KERN_ERR "ufs_change_blocknr: read_mapping_folio error: ino %lu, index: %lu\n",
    253                                mapping->host->i_ino, index);
    254                         return folio;
    255                 }
    256 
    257                 folio_lock(folio);
    258 
    259                 if (unlikely(folio->mapping == NULL)) {
    260                         /* Truncate got there first */
    261                         folio_unlock(folio);
    262                         folio_put(folio);
    263                         return NULL;
    264                 }
    265         }
    266         if (!folio_buffers(folio))
                                   ^^^^^


    267                 create_empty_buffers(folio, 1 << inode->i_blkbits, 0);
    268         return folio;
    269 }

regards,
dan carpenter
