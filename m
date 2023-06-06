Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECE3C7EE33
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 13:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237892AbjFFNii (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 09:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237686AbjFFNid (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 09:38:33 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BDC10C3
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 06:38:31 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30d5931d17aso2803551f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686058710; x=1688650710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=85EFiLI503ORP5JesjlHbOh64K/GjvzvL/eTRP3rkhQ=;
        b=fOsE1JpsNSV4Xsjr/6+EEdOeMhcOq7zLmJabYRzqIsqIc+SL6Gk9bQ+6bKvymplh5Q
         FhjITFvmNcueBHvslgiBV5ibyGLwLOzgBOULPc+4CXI9BmDagMTcKfSyWhGpJO/iMbiE
         NJ2ob/WCmiHiA/pYEdmuG/xKKU7EmSBRyaOuVNr0vl+lGjEFDL1d/9UT/E2g5iUhRhk9
         9yepA3t76U0HuQJ/xUmtFMw3L+lkHk8DCesnJoofYTE3aOagXypmWF6wedDPapMu4Pkg
         tGR/yp8uXHJmQBV/a27yYFXRP1V9YtH2wlhfBanDvQvWl7Qf5vqR6+xK7dC/89qo7S0H
         qRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686058710; x=1688650710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85EFiLI503ORP5JesjlHbOh64K/GjvzvL/eTRP3rkhQ=;
        b=JZhKK52I9+oD8OftaJoXSmE5cH5NytpCTKcJIjlcROZulcDpQz3Ye4dnXvJisU123p
         6MnYH/ny52WgDWV7FYaddgYHDfDZF6wHv8ZpdFHvosYzJJ9LVYVPetsUab+lYanOz0RJ
         ok5X84ZPYr7Z1gxGww6UiYZz76xeN/MBZsYmk99VjRUFNxWkngC+fw+F2FILzJqd+hpr
         RYO9IgraD9e/FtxEocNkgNKUPySG18I2FIrHy8yPsD1tsuRCssNveqFFGLmBBJYpM41Z
         tuvaDlZTiPd5sFfYJNe+dmm61yU2LZ8xXxVxD/FK+PSQKCHbean3KUaLdePkCJQAZnu0
         oMAg==
X-Gm-Message-State: AC+VfDwsajP51NazRnDktHMx7CltS6B+MPXWzY8p9nZd7nCmFGBzty2l
        mymF1sa5I5P5vuzcNo3YLeP8dQ==
X-Google-Smtp-Source: ACHHUZ4AMsKpUttX2fYo2DbgD1pFk1gewZgB0HIuULY5Ayuj9wHoMlOSB/ECcbPpKgJ8R9mQgHbpTQ==
X-Received: by 2002:adf:ea0a:0:b0:30e:52de:9ccf with SMTP id q10-20020adfea0a000000b0030e52de9ccfmr788222wrm.68.1686058709896;
        Tue, 06 Jun 2023 06:38:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v10-20020a1cf70a000000b003f41bb52834sm17664547wmh.38.2023.06.06.06.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:38:28 -0700 (PDT)
Date:   Tue, 6 Jun 2023 16:38:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Franziska Naepelt <franziska.naepelt@googlemail.com>,
        keyrings@vger.kernel.org, dhowells@redhat.com, dwmw2@infradead.org,
        linux-kernel@vger.kernel.org,
        Franziska Naepelt <franziska.naepelt@gmail.com>,
        kernel test robot <lkp@intel.com>,
        Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
        Linux Kernel Janitors <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] certs/extract-cert: Fix checkpatch issues
Message-ID: <e39efb7f-5d8f-4433-83b3-8eea8a6c0486@kadam.mountain>
References: <20230601190508.56610-1-franziska.naepelt@gmail.com>
 <20230602085902.59006-1-franziska.naepelt@gmail.com>
 <ZH8mhIrjyBvTF4oZ@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH8mhIrjyBvTF4oZ@debian.me>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 06, 2023 at 07:28:52PM +0700, Bagas Sanjaya wrote:
> On Fri, Jun 02, 2023 at 10:59:02AM +0200, Franziska Naepelt wrote:
> > The following issues are fixed:
> > - WARNING: Missing or malformed SPDX-License-Identifier tag
> > - ERROR: trailing statements should be on next line
> > - WARNING: braces {} are not necessary for single statement blocks
> > - ERROR: space required before the open parenthesis '('
> > - ERROR: code indent should use tabs where possible
> > - WARNING: please, no spaces at the start of a line
> > - WARNING: Missing a blank line after declarations
> 
> Again, write the patch description in imperative mood (e.g. "Do foo").
> 

Why do you care about imperative tense?  Imperative tense doesn't
matter.  What matters is that you can understand the issue and how it
looks like to the user.  I was working with a group of foreign students
and it was painful to see the contortions that they went through to make
a commit message imperative.  It's like saying "Bake a cake", "Ok, now
bake it while juggling."  The cake ends up worse.  And the commit
message end up worse when we force nonsense rules like this.

That said the rest of your comments are correct.

Franziska, I kind of feel like you should start in drivers/staging/
because you're sending beginner patches to kind of core parts of the
kernel where people are busy.  Most likely your going to have to send a
bunch of iterations of the patch.  In drivers/staging/ we don't mind
reviewing newbie patches.

regards,
dan carpenter

