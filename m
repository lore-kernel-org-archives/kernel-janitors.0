From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 10 Jul 2020 08:11:00 +0000
Subject: Re: scsi: virtio_scsi: Remove unnecessary condition checks
Message-Id: <39c76c43-cd5f-40cb-7225-e2e143f8c131@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a197f532-7020-0d8e-21bf-42bb66e8daec@web.de>
 <e87746e6-813e-7c0e-e21e-5921e759da5d@redhat.com>
 <8eb9a827-45f1-e71c-0cbf-1c29acd8e310@web.de>
 <58e3feb8-1ffb-f77f-cf3a-75222b3cd524@redhat.com>
 <9815ef2d-d0da-d197-49d7-83559d750ff1@web.de>
 <d052b441-cc4d-4b2b-1442-b1a30bed2fdb@redhat.com>
In-Reply-To: <d052b441-cc4d-4b2b-1442-b1a30bed2fdb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Paolo Bonzini <pbonzini@redhat.com>, Xianting Tian <xianting_tian@126.com>, linux-scsi@vger.kernel.org, virtualization@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "James E. J. Bottomley" <jejb@linux.ibm.com>, Jason Wang <jasowang@redhat.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>

>> Can a bit more “compliance” (with the Linux coding style) matter here?
>
> No.

Please take another look at the corresponding software documentation.


>>> Having a single error loop is an advantage by itself.
>>
>> I do not see that a loop is involved in the implementation of the function “init”.
>
> s/loop/label/ sorry.

Thanks for this information.

Can the development attention grow for corresponding implementation details
around the specifcation of efficient exception handling?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=42f82040ee66db13525dc6f14b8559890b2f4c1c#n465

Regards,
Markus
