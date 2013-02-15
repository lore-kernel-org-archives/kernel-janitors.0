From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Fri, 15 Feb 2013 16:34:24 +0000
Subject: Re: Clang Analyzer was Re: [PATCH 3/7 v2] staging/ozwpan: Fix NULL vs zero in ozeltbuf.c (sparse war
Message-Id: <201302151734.24623.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130215084517.GB6802@mwanda> <201302151657.14726.PeterHuewe@gmx.de> <20130215161102.GK6853@mwanda>
In-Reply-To: <20130215161102.GK6853@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rupesh Gujare <rupesh.gujare@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Kernel Janitors <kernel-janitors@vger.kernel.org>

Am Freitag, 15. Februar 2013, 17:11:02 schrieb Dan Carpenter:
> Are you using this version of clang?:
> 
> http://git.linuxfoundation.org/llvmlinux.git/
> 
> regards,
> dan carpenter

Hi,

nope - plain vanilla llvm/clang, but I use some of the kernel patches from 
there:
http://git.linuxfoundation.org/?p=llvmlinux.git;a=tree;f=arch/x86_64/patches;hb=master

The main reason for not using llvmlinux is that it builds a lot more than I 
need (e.g. buildbot/qemu) but maybe I should give it a try some time.


Peter
