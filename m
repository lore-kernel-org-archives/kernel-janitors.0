Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB9DC7EE2D
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Feb 2023 11:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjB0LtM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjB0Ls6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Feb 2023 06:48:58 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535D893FB
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 03:48:50 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id bv17so5899769wrb.5
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 03:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3KkkEMBkFL+SpRQkYG8mO0IIRPmZ8l1+9M6eEDOT58U=;
        b=gyMRAlKCCLNc6Zq43sL2Gn68EPd5JsgYheOOoydbAmGdslhfx6QkLuKkdAMfie70iS
         KcYRw+oy3fkuUM/x7mBTmEOx3XptUoOWQcycgOdul/sYlfBZwT4LK6Dk/hI/zCUyDsH4
         8+18oDqkm+Q4HJZ1X1nzSTXS4D5GNZGz2MC1uDWF0fk7k48zRSHxkgrEWAjKeWs5hjCM
         zfyYXELKMXfvyAjv/D/Age4da5tCTqsuyRdsnVc3k58AiMJdm9tDPrSWg6gPlwGjsQ/K
         tJaMZ40rBb5MeL7iMdNh+4XKedREHnDrMezijgzrFW62jdvQbA6OtFnnnOKJA195d0h6
         edLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3KkkEMBkFL+SpRQkYG8mO0IIRPmZ8l1+9M6eEDOT58U=;
        b=biDgzcG/txELff/IW5JWSl0H5A1bvnVyKg/FoGac5FhSsCxmohKObwWtxPhZyCCkBT
         nGWMsdHWLodgEfpKE3K9ONaqOpxoXarUmFb2b5yrWhSRjwfHMIsQXBWYHUM15ghDQ2pQ
         q58uLgBpcwKpif9RkIgfsRTQfPfYzIHRmTGhrSnjo0BG5Cg9mERNGM6gac+8VJlRuhL1
         5sMizX1/fYRceD5hrRLDq54A2tLmjpjR5jM8ZeJAhD1hR7aggR3H8E5R9dn5on7Vtr88
         mZnfZpZM+UhKMYc/KucmDpuYOFDN4ZcyDjXxgUhlHJKQXol/XYAT54SZBHESpPQfjeTA
         NNjw==
X-Gm-Message-State: AO0yUKV7sgmrMaU1sZkU11bFkS68VxOqLhv0maIQZyYpkqFjvtaA8rN/
        6dmce2kejLE9GYXT4EcrZbc=
X-Google-Smtp-Source: AK7set+megi08C6GLvZQ3YduK3Ssoi6s1oKQy545U6bc9s9+NPwwkuV3EqNyEW93GPerDbWcK8On7w==
X-Received: by 2002:adf:cd8b:0:b0:2c7:bfe:4f60 with SMTP id q11-20020adfcd8b000000b002c70bfe4f60mr16139383wrj.15.1677498528643;
        Mon, 27 Feb 2023 03:48:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u5-20020a5d6ac5000000b002c5a1bd5280sm6804828wrw.95.2023.02.27.03.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:48:48 -0800 (PST)
Date:   Mon, 27 Feb 2023 14:48:44 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     dhowells@redhat.com
Cc:     kernel-janitors@vger.kernel.org,
        Steve French <stfrench@microsoft.com>
Subject: [bug report] netfs: Add a function to extract an iterator into a
 scatterlist
Message-ID: <Y/yYnAhoAYDBKixX@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

[ Julia sent a message about this in Jan, but that was like a million
  years ago so I'm resending.  -dan ]

Hello David Howells,

The patch 018584697533: "netfs: Add a function to extract an iterator
into a scatterlist" from Oct 27, 2022, leads to the following Smatch
static checker warning:

fs/netfs/iterator.c:137 netfs_extract_user_to_sg() warn: count down condition reversed? 'npages < 0'
fs/netfs/iterator.c:137 netfs_extract_user_to_sg() warn: unsigned 'npages' is never less than zero.

fs/netfs/iterator.c
    109 static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
    110                                         ssize_t maxsize,
    111                                         struct sg_table *sgtable,
    112                                         unsigned int sg_max,
    113                                         iov_iter_extraction_t extraction_flags)
    114 {
    115         struct scatterlist *sg = sgtable->sgl + sgtable->nents;
    116         struct page **pages;
    117         unsigned int npages;
    118         ssize_t ret = 0, res;
    119         size_t len, off;
    120 
    121         /* We decant the page list into the tail of the scatterlist */
    122         pages = (void *)sgtable->sgl + array_size(sg_max, sizeof(struct scatterlist));
    123         pages -= sg_max;
    124 
    125         do {
    126                 res = iov_iter_extract_pages(iter, &pages, maxsize, sg_max,
    127                                              extraction_flags, &off);
    128                 if (res < 0)
    129                         goto failed;
    130 
    131                 len = res;
    132                 maxsize -= len;
    133                 ret += len;
    134                 npages = DIV_ROUND_UP(off + len, PAGE_SIZE);
    135                 sg_max -= npages;
    136 
--> 137                 for (; npages < 0; npages--) {
                               ^^^^^^^^^^
This was supposed to be npages >= 0 or > 0 probably.   Also signedness
bug.

    138                         struct page *page = *pages;
    139                         size_t seg = min_t(size_t, PAGE_SIZE - off, len);
    140 
    141                         *pages++ = NULL;
    142                         sg_set_page(sg, page, len, off);
    143                         sgtable->nents++;
    144                         sg++;
    145                         len -= seg;
    146                         off = 0;
    147                 }
    148         } while (maxsize > 0 && sg_max > 0);
    149 
    150         return ret;
    151 
    152 failed:
    153         while (sgtable->nents > sgtable->orig_nents)
    154                 put_page(sg_page(&sgtable->sgl[--sgtable->nents]));
    155         return res;
    156 }

regards,
dan carpenter
