Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264993D3492
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842534; cv=none; b=q8WSg/dO/xuRISgC4cJ+Q6lCAYoX5ZBQ/cpRy4xJm9gUtLOF/LJbYLFM8H5DAtgtCjfdroBEvJUhnZo0PFclhPibe+uAX0XUlJSnvDMxqHvdi1eM7c9DIkd7LcQt3bqjhSwHOLuSYp+oFMGjl9DhrvZyM8POAKCiS6jOcMlMMsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842534; c=relaxed/simple;
	bh=yww7ijce7/R4P33+6reZUsjyvLWxLaeFGDJRCxuyWfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgwVDJ4f1uQL+Xu2dKy88H7wNri9lhSikpQlyLna8sUzYPWlSxgoAzTTX5ADhwjVrKiF7P6pQ60B0S9b66xMWtad+6NBtJuBR+cZLfOd5n/Lx53PwDAiLXB8hx4b/V79gpMG3XmEF7HK/uqlufJfw1/y5pTrpRiwrJAl9gbXVQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VK7r1+ZP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VK7r1+ZP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso36892965e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 10:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775842531; x=1776447331; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csD5t3z8XM4LdbYxJXz9EDmEySvC6ZW1nMCWvc2g7CY=;
        b=VK7r1+ZPrWjfKNi1dz7iton1GOQTzsJ7eyu8I4IPfTWzvJbIs5GPfrcclR8HmVXPkG
         D3vas1jbQqD3TzYDSIqCSTH4aDKQRhpLoZ/mLzpv5E0llAC9Xi3lKOEyzJ19WCFDGy3o
         keeNMwQIC1sm8UOY6rlVYuHcApmZxC1nmbTs4IXINrbbQrKeANSoaDGvtbMb1YWTceiW
         jS4fR++8Gi3qolVlVlVROP8orl+NK3bYjt6519VgqMtzxu++EhphWGx3vATqubduido0
         XBtMC9NB/RMaaQYf3Dp8xdorAV662Mm6w/JhVT1cPK4SDsgG1UzUmpT5GTYOcII5OOBv
         g2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775842531; x=1776447331;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csD5t3z8XM4LdbYxJXz9EDmEySvC6ZW1nMCWvc2g7CY=;
        b=k2UNtnSnxtGTeGluUFVCnyEaUPcnSIxBk/raR+PE/oJawc0nc4sRNKcmDjj/xAP7Xm
         AvwMBdBrIR9ZqLkpZdyxfYwRvv4StV7/2eUAVnAImNyItROgbHL3o1C4t3Ses9G2gwXG
         mzpTPeXYLml2NDdmPyn7LqIvjQL7Ypps7udnlqN14LYO7MhS/Bcc8ZjB3mIWsDpJMzal
         C/s4g1Mg/8PS10fShZzN/OYGwHUtU+qUIlUsW+RLEw/A4M6xssKWSgQ4zOSZl+sxbvQn
         6cNNd2+laLdJarJTZYzaSGnvO4zRvMQ5mIQVYFsKb+MQDb8WUsXOVNajYaDAGy84Uj5A
         coGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFbmIWEbMSuDWI1TK6bDB2DyJZeET6qa625hjRqDHF7rlmShOhpkRN+fwyOq9XOaDcg394r+P0STGukctdoO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVjNBOwmwMW6voz4hUBzBKsLX/KaJDWUbHrVis44qDCNakUffK
	ub0AJ+/jYEJVOyLKGZ34rxkscTVmrWkjD5ppuE1+viZzhknzQ6n6UZBU
X-Gm-Gg: AeBDieu1pOOHb7o3HFW8l1YX5mVKgImM4LC1l9A528IhM6BGvJx+ksf9K3suLTF18rU
	5jn136TnDHhYmL5IkCfpHyZGIeQWbXiD4/Sv2LjR5+oOM1npPdNklgWoSWDznYICjb+PVlry2ge
	SxXYMoRUyOGfYnIYZNr/1oRMzneUPO3ff6h9677XZtj4Xevr6fe10aX5UTmQ4bhLD+nk91BN8FW
	drN7+Wkl8VQEfcN/mSb8Vx6zQZbPI9pmAlHJR9DcyQNmCPQhwfiZ210IOKCNz393VtrKRu7s/01
	wIi8q8bGJc2+ce8c5cYH8heo7M9OIjWySP0Jq0/9wLqOrEbcenaCxrzkczvpr2brWtL4JjSKAkQ
	3wLm9UQz9h/8/x4J5sJWrdjWL0kfXH09t18IkZJlYsnO4sQjHxNuT53N7iDxVqxmyeYPrWP3wYb
	uIhhXGuqKcncyHujKyg8c=
X-Received: by 2002:a05:600c:c0cc:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-488d686dab1mr38060985e9.24.1775842531303;
        Fri, 10 Apr 2026 10:35:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm26224295e9.10.2026.04.10.10.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 10:35:30 -0700 (PDT)
Date: Fri, 10 Apr 2026 20:35:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mike Marshall <hubcap@omnibond.com>
Cc: devel@lists.orangefs.org, kernel-janitors@vger.kernel.org
Subject: [bug report] bufmap: manage as folios.
Message-ID: <adk038m9nU2HdCCK@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Mike Marshall,

Commit df6fd4485d7a ("bufmap: manage as folios.") from Apr 6, 2026
(linux-next), leads to the following Smatch static checker warning:

	fs/orangefs/orangefs-bufmap.c:451 orangefs_bufmap_map()
	warn: should for loop be < instead of <=? 'bufmap->desc_array[j]'

fs/orangefs/orangefs-bufmap.c
    308 static int orangefs_bufmap_map(struct orangefs_bufmap *bufmap,
    309                                 struct ORANGEFS_dev_map_desc *user_desc)
    310 {
    311         int pages_per_desc = bufmap->desc_size / PAGE_SIZE;
    312         int ret;
    313         int i;
    314         int j;
    315         int current_folio;
    316         int desc_pages_needed;
    317         int desc_folio_count;
    318         int remaining_pages;
    319         int need_avail_min;
    320         int pages_assigned_to_this_desc;
    321         size_t current_offset;
    322         size_t adjust_offset;
    323         struct folio *folio;
    324 
    325         /* map the pages */
    326         ret = pin_user_pages_fast((unsigned long)user_desc->ptr,
    327                 bufmap->page_count,
    328                 FOLL_WRITE,
    329                 bufmap->page_array);
    330 
    331         if (ret < 0)
    332                 return ret;
    333 
    334         if (ret != bufmap->page_count) {
    335                 gossip_err("orangefs error: asked for %d pages, only got %d.\n",
    336                                 bufmap->page_count, ret);
    337                 for (i = 0; i < ret; i++)
    338                         unpin_user_page(bufmap->page_array[i]);
    339                 return -ENOMEM;
    340         }
    341 
    342         /*
    343          * ideally we want to get kernel space pointers for each page, but
    344          * we can't kmap that many pages at once if highmem is being used.
    345          * so instead, we just kmap/kunmap the page address each time the
    346          * kaddr is needed.
    347          */
    348         for (i = 0; i < bufmap->page_count; i++)
    349                 flush_dcache_page(bufmap->page_array[i]);

i == bufmap->page_count at the end of this loop.

    350 
    351         /*
    352          * Group pages into folios.
    353          */
    354         ret = orangefs_bufmap_group_folios(bufmap);
    355         if (ret)
    356                 goto unpin;

Assume we hit this goto

    357 
    358         pr_info("%s: desc_size=%d bytes (%d pages per desc), total folios=%d\n",
    359                         __func__, bufmap->desc_size, pages_per_desc,
    360                         bufmap->folio_count);
    361 
    362         current_folio = 0;
    363         remaining_pages = 0;
    364         current_offset = 0;
    365         for (i = 0; i < bufmap->desc_count; i++) {
    366                 desc_pages_needed = pages_per_desc;
    367                 desc_folio_count = 0;
    368                 pages_assigned_to_this_desc = 0;
    369                 bufmap->desc_array[i].is_two_2mib_chunks = false;
    370 
    371                 /*
    372                  * We hope there was enough memory that each desc is
    373                  * covered by two THPs/folios, if not we want to keep on
    374                  * working even if there's only one page per folio.
    375                  */
    376                 bufmap->desc_array[i].folio_array =
    377                         kzalloc_objs(struct folio *, pages_per_desc);
    378                 if (!bufmap->desc_array[i].folio_array) {
    379                         ret = -ENOMEM;
    380                         goto unpin;
    381                 }
    382 
    383                 bufmap->desc_array[i].folio_offsets =
    384                         kzalloc_objs(size_t, pages_per_desc);
    385                 if (!bufmap->desc_array[i].folio_offsets) {
    386                         ret = -ENOMEM;
    387                         kfree(bufmap->desc_array[i].folio_array);
    388                         goto unpin;
    389                 }
    390 
    391                 bufmap->desc_array[i].uaddr =
    392                         user_desc->ptr + (size_t)i * bufmap->desc_size;
    393 
    394                 /*
    395                  * Accumulate folios until desc is full.
    396                  */
    397                 while (desc_pages_needed > 0) {
    398                         if (remaining_pages == 0) {
    399                                 /* shouldn't happen. */
    400                                 if (current_folio >= bufmap->folio_count) {
    401                                         ret = -EINVAL;
    402                                         goto unpin;
    403                                 }
    404                                 folio = bufmap->folio_array[current_folio++];
    405                                 remaining_pages = folio_nr_pages(folio);
    406                                 current_offset = 0;
    407                         } else {
    408                                 folio = bufmap->folio_array[current_folio - 1];
    409                         }
    410 
    411                         need_avail_min =
    412                                 min(desc_pages_needed, remaining_pages);
    413                         adjust_offset = need_avail_min * PAGE_SIZE;
    414 
    415                         bufmap->desc_array[i].folio_array[desc_folio_count] =
    416                                 folio;
    417                         bufmap->desc_array[i].folio_offsets[desc_folio_count] =
    418                                 current_offset;
    419                         desc_folio_count++;
    420                         pages_assigned_to_this_desc += need_avail_min;
    421                         desc_pages_needed -= need_avail_min;
    422                         remaining_pages -= need_avail_min;
    423                         current_offset += adjust_offset;
    424                 }
    425 
    426                 /* Detect optimal case: two 2MiB folios per 4MiB slot. */
    427                 if (desc_folio_count == 2 &&
    428                   folio_nr_pages(bufmap->desc_array[i].folio_array[0]) == 512 &&
    429                   folio_nr_pages(bufmap->desc_array[i].folio_array[1]) == 512) {
    430                         bufmap->desc_array[i].is_two_2mib_chunks = true;
    431                         gossip_debug(GOSSIP_BUFMAP_DEBUG, "%s: descriptor :%d: "
    432                                 "optimal folio/page ratio.\n", __func__, i);
    433                 }
    434 
    435                 bufmap->desc_array[i].folio_count = desc_folio_count;
    436                 gossip_debug(GOSSIP_BUFMAP_DEBUG,
    437                         " descriptor %d: folio_count=%d, "
    438                         "pages_assigned=%d (should be %d)\n",
    439                         i, desc_folio_count, pages_assigned_to_this_desc,
    440                         pages_per_desc);
    441         }
    442 
    443         return 0;
    444 unpin:
    445         /*
    446          * rollback any allocations we got so far...
    447          * Memory pressure, like in generic/340, led me
    448          * to write the rollback this way.
    449          */
    450         for (j = 0; j <= i; j++) {

The intention here is that this would unwind the bufmap->desc_count
loop but we never reached that loop.  Do we know that bufmap->page_count
is less than bufmap->desc_count?  Either way, it doesn't make sense.

I always use opportunities like this to promote my blog!
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

--> 451                 if (bufmap->desc_array[j].folio_array) {
    452                         kfree(bufmap->desc_array[j].folio_array);
    453                         bufmap->desc_array[j].folio_array = NULL;
    454                 }
    455                 if (bufmap->desc_array[j].folio_offsets) {
    456                         kfree(bufmap->desc_array[j].folio_offsets);
    457                         bufmap->desc_array[j].folio_offsets = NULL;
    458                 }
    459         }
    460         unpin_user_pages(bufmap->page_array, bufmap->page_count);
    461         return ret;
    462 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
