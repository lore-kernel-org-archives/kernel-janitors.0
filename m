From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 May 2016 08:35:28 +0000
Subject: re: x86/platform/UV: Support UV4 socket address changes
Message-Id: <20160506083528.GA10231@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Mike Travis,

This is a semi-automatic email about new static checker warnings.

The patch 1de329c10d9f: "x86/platform/UV: Support UV4 socket address 
changes" from Apr 29, 2016, leads to the following Smatch complaint:

arch/x86/kernel/apic/x2apic_uv_x.c:1201 decode_uv_systab()
	 error: we previously assumed 'st' could be null (see line 1199)

arch/x86/kernel/apic/x2apic_uv_x.c
  1198		st = uv_systab;
  1199		if ((!st || st->revision < UV_SYSTAB_VERSION_UV4) && !is_uv4_hub())
                      ^^
New check for NULL.

  1200			return;
  1201		if (st->revision != UV_SYSTAB_VERSION_UV4_LATEST) {
                    ^^^^^^^^^^^^
Unchecked dereference in the is_uv4_hub() case.  Perhaps the parenthesis
are not in the right place or the check for NULL can be removed?

  1202			pr_crit(
  1203			"UV: BIOS UVsystab version(%x) mismatch, expecting(%x)\n",

regards,
dan carpenter
