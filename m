From: Krishna Gudipati <kgudipat@Brocade.com>
Date: Wed, 25 Jul 2012 17:20:21 +0000
Subject: RE: bfa_ioc.c: code aligned with following code
Message-Id: <B5EE62D80D50B84BB9E5174F7FCCE80A28399E8005@HQ1-EXCH02.corp.brocade.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120725135917.GB27724@localhost>
In-Reply-To: <20120725135917.GB27724@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang Wu,

I will include a patch to fix the indentation in our next submission. Thanks for notifying.

Thanks,
Krishna

-----Original Message-----
From: Fengguang Wu [mailto:fengguang.wu@intel.com] 
Sent: Wednesday, July 25, 2012 6:59 AM
To: Krishna Gudipati
Cc: James Bottomley; kernel-janitors@vger.kernel.org; Jing Huang
Subject: bfa_ioc.c: code aligned with following code


Hi James,

coccinelle complaints:

drivers/scsi/bfa/bfa_ioc.c:3397:3-18: code aligned with following code on line 3399

and the code does look weird..

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
