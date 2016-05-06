From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 May 2016 08:39:42 +0000
Subject: re: x86/platform/UV: Add obtaining GAM Range Table from UV BIOS
Message-Id: <20160506083942.GA10649@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Mike Travis,

This is a semi-automatic email about new static checker warnings.

The patch ef93bf803999: "x86/platform/UV: Add obtaining GAM Range 
Table from UV BIOS" from Apr 29, 2016, leads to the following Smatch 
complaint:

arch/x86/platform/uv/bios_uv.c:207 uv_bios_init()
	 error: we previously assumed 'uv_systab' could be null (see line 206)

arch/x86/platform/uv/bios_uv.c
   205			uv_systab = ioremap(efi.uv_systab, uv_systab->size);
   206			if (!uv_systab) {
                             ^^^^^^^^^
Check.

   207				pr_err("UV: UVsystab: ioremap(%d) failed!\n",
   208					uv_systab->size);
                                        ^^^^^^^^^^^^^^^
NULL deref.

   209				return;

regards,
dan carpenter
