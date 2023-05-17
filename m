Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E55DC77B7A
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 May 2023 05:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjEQFOc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 May 2023 01:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjEQFOb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 May 2023 01:14:31 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 87D8C35A8;
        Tue, 16 May 2023 22:14:28 -0700 (PDT)
Received: from [172.30.38.111] (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 36E23180120DC3;
        Wed, 17 May 2023 13:14:12 +0800 (CST)
Content-Type: multipart/mixed; boundary="------------6RiRB9aWvOzrHmmlk1Za6Ipu"
Message-ID: <bea72de9-5f97-16a9-6703-05789ed53c1d@nfschina.com>
Date:   Wed, 17 May 2023 13:14:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next] net: bna: bnad: Remove unnecessary (void*)
 conversions
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     rmody@marvell.com, skalluru@marvell.com,
        GR-Linux-NIC-Dev@marvell.com, davem@davemloft.net,
        edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   yunchuan <yunchuan@nfschina.com>
In-Reply-To: <20230516201739.21c37850@kernel.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------6RiRB9aWvOzrHmmlk1Za6Ipu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2023/5/17 11:17, Jakub Kicinski 写道:
> On Wed, 17 May 2023 10:27:05 +0800 wuych wrote:
>> Pointer variables of void * type do not require type cast.
> What tool are you using to find these.
> How many of such patches will it take to clean up the entire tree?


I use the scripts I found on the  kernel Newbies to find these.

website: https://kernelnewbies.org/KernelJanitors/Todo/VoidPointerConvs


--------------6RiRB9aWvOzrHmmlk1Za6Ipu
Content-Type: application/x-perl; name="type-convs.pl"
Content-Disposition: attachment; filename="type-convs.pl"
Content-Transfer-Encoding: 7bit

#!/usr/bin/perl
# This scripts goes through the kernel sources and
# prints assignments of (void*) functions that
# get type-changed:
#   type *x = (type*) function().
# The first argument is the kernel source directory, additional 
# arguments override the embedded function name list.


$kernel_dir=shift || die "Need a directory argument (kernel sources),\n" .
"and optionally function names.\n" .
"If none are given, a default list is taken.\n";

# Get source files
@ARGV=split(/\0/, `find "$kernel_dir" -type f -iname "*.c" -print0`);
die "No sources found.\n" unless @ARGV;

# Read whole files, and look for such assignments.
$/=undef;
while (<>)
{
	$changes=0;
#		- struct netdev_private *np = (struct netdev_private *)dev->priv;
#		+ struct netdev_private *np = dev->priv;
#	or just
#	   lp = (struct i596_private *) dev->priv;
	$changes++ while 
		s{ 
			( (?: struct \s+ \w+ \s* \* \s*)? \w+ \s+ = ) \s* 
				\( [\w\s\*]+ \* \s* \) \s* 
				( \w+ \s* -> \s* priv(?:ate)? \s* ; )
		}{$1 $2}xgo;

	if ($changes)
	{
		open(DIFF, qq(| diff -up --label "$ARGV" "$ARGV" --label "$ARGV" -)) 
		|| die "Cannot start diff program: $!\n";
		print DIFF $_;
		close DIFF;
	}
}

--------------6RiRB9aWvOzrHmmlk1Za6Ipu--
