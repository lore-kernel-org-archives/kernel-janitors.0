From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 17 Sep 2012 00:41:14 +0000
Subject: drivers/platform/x86/acer-wmi.c: ERROR: obj is NULL but dereferenced
Message-Id: <20120917004114.GC12394@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Chun-Yi,

coccinelle warns about:

  drivers/platform/x86/acer-wmi.c:1200:17-21: ERROR: obj is NULL but dereferenced.
  drivers/platform/x86/acer-wmi.c:891:17-21: ERROR: obj is NULL but dereferenced.
  drivers/platform/x86/acer-wmi.c:1953:17-21: ERROR: obj is NULL but dereferenced.

Which are first introduced by commit

commit 987dfbaa65b2c3568b85e29d2598da08a011ee09
Author:     Lee, Chun-Yi <joeyli.kernel@gmail.com>
AuthorDate: Fri May 27 14:52:14 2011 +0800
Commit:     Matthew Garrett <mjg@redhat.com>
CommitDate: Fri May 27 12:40:10 2011 -0400

    acer-wmi: support integer return type from WMI methods

Thanks,
Fengguang
