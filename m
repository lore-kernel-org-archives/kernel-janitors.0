Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25C8C433E0
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B07F164EC0
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354893AbhCCGHv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 01:07:51 -0500
Received: from smtprelay0018.hostedemail.com ([216.40.44.18]:46190 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232490AbhCCCtC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Mar 2021 21:49:02 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 42E2418225631;
        Wed,  3 Mar 2021 02:47:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: tin16_1602863276c1
X-Filterd-Recvd-Size: 2532
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Wed,  3 Mar 2021 02:47:52 +0000 (UTC)
Message-ID: <6b8b250a06a98ce42120a14824531a8641f5e8aa.camel@perches.com>
Subject: Re: [Cocci] linux-kernel janitorial RFP: Mark static arrays as const
From:   Joe Perches <joe@perches.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     kernelnewbies <kernelnewbies@kernelnewbies.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        cocci <cocci@systeme.lip6.fr>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Tue, 02 Mar 2021 18:47:51 -0800
In-Reply-To: <alpine.DEB.2.22.394.2103022241050.2906@hadrien>
References: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
         <alpine.DEB.2.22.394.2103022241050.2906@hadrien>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 2021-03-02 at 22:41 +0100, Julia Lawall wrote:
> 
> On Tue, 2 Mar 2021, Joe Perches wrote:
> 
> > Here is a possible opportunity to reduce data usage in the kernel.
> 
> Does it actually reduce data usage?

Yes, at least for gcc.  For instance:

$ gcc --version
gcc (Ubuntu 10.2.0-13ubuntu1) 10.2.0

And with the diff below (x86-64 defconfig with hwmon/pmbus and max20730)

$ diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 9dd3dd79bc18..b824eab95456 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -434,7 +434,7 @@ static long direct_to_val(u16 w, enum pmbus_sensor_classes >
        return d;
 }
 
-static u32 max_current[][5] = {
+static const u32 max_current[][5] = {
        [max20710] = { 6200, 8000, 9700, 11600 },
        [max20730] = { 13000, 16600, 20100, 23600 },
        [max20734] = { 21000, 27000, 32000, 38000 },

$ size drivers/hwmon/pmbus/max20730.o*
   text	   data	    bss	    dec	    hex	filename
   9245	    256	      0	   9501	   251d	drivers/hwmon/pmbus/max20730.o.gcc.new
   9149	    352	      0	   9501	   251d	drivers/hwmon/pmbus/max20730.o.gcc.old

with clang-11 it doesn't seem to make a difference:

$ /usr/bin/clang --version
Ubuntu clang version 11.0.0-2

$ size drivers/hwmon/pmbus/max20730.o*
   text	   data	    bss	    dec	    hex	filename
   9166	    256	      1	   9423	   24cf	drivers/hwmon/pmbus/max20730.o.clang-11.new
   9166	    256	      1	   9423	   24cf	drivers/hwmon/pmbus/max20730.o.clang-11.old


