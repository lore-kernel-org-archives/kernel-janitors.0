From: Saurav Kashyap <saurav.kashyap@qlogic.com>
Date: Mon, 17 Sep 2012 16:13:15 +0000
Subject: Re: [scsi:for-next 92/128] drivers/scsi/qla2xxx/qla_isr.c:1684:56: warning: 'rval' may be used unini
Message-Id: <CC7D49BC.E02F%saurav.kashyap@qlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347885307.2397.21.camel@dabdike.int.hansenpartnership.com>
In-Reply-To: <1347885307.2397.21.camel@dabdike.int.hansenpartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Bottomley <jbottomley@parallels.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Yuanhan Liu <yuanhan.liu@intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Chad Dupuis <chad.dupuis@qlogic.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>




>On Sat, 2012-09-15 at 07:57 +0800, Fengguang Wu wrote:
>> Hi Saurav,
>>
>> FYI, there are new compile warnings show up in
>>
>> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git
>>for-next
>> head:   71cfff4af0525891941199b142b759d00b293959
>> commit: 387fddaa3564503c9f82d091d2ebe390f3af62a1 [92/128] [SCSI]
>>qla2xxx: Implementation of bidirectional.
>> config: x86_64-allmodconfig
>>
>> All error/warnings:
>>
>> drivers/scsi/qla2xxx/qla_isr.c: In function 'qla2x00_status_entry':
>> drivers/scsi/qla2xxx/qla_isr.c:1684:56: warning: 'rval' may be used
>>uninitialized in this function [-Wmaybe-uninitialized]
>> drivers/scsi/qla2xxx/qla_isr.c:1558:11: note: 'rval' was declared here
>
>Hmm, that's actually fixed by a later patch in the series:
>
>commit 2d7a7dc9bf4772b6ed711cadeee0bce9bace2a94
>Author: Saurav Kashyap <saurav.kashyap@qlogic.com>
>Date:   Wed Aug 22 14:21:12 2012 -0400
>
>    [SCSI] qla2xxx: Fix rval may be used uninitialized in this function
>warning.
>
>Note to qlogic: please don't do this in future.  I'll combine these two
>patches so we get a single series with no introduced and later fixed
>warnings.

Hi James,
We will take care of this in future.

Thanks,
~Saurav


This message and any attached documents contain information from QLogic Corporation or its wholly-owned subsidiaries that may be confidential. If you are not the intended recipient, you may not read, copy, distribute, or use this information. If you have received this transmission in error, please notify the sender immediately by reply e-mail and then delete this message.

