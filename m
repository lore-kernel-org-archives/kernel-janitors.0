From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 27 Jul 2017 16:30:42 +0000
Subject: Re: [PATCH 2/2] scsi: aacraid: Off by one NUL terminator
Message-Id: <yq1wp6tvo3x.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170725195110.uwrzzkzvrbfqv7ld@mwanda>
        <yq1wp6uwp9c.fsf@oracle.com>
        <423FD6710FB8FB4F8728F93591889F9A5307D0DC@avsrvexchmbx2.microsemi.net>
In-Reply-To: <423FD6710FB8FB4F8728F93591889F9A5307D0DC@avsrvexchmbx2.microsemi.net>
        (Dave Carroll's message of "Thu, 27 Jul 2017 16:26:17 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Carroll <david.carroll@microsemi.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>, dl-esc-Aacraid Linux Driver <aacraid@microsemi.com>, Mahesh Rajashekhara <mahesh.rajashekhara@microsemi.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


Dave,

> The issue is that we are making an inquiry response from
> container/RAID info. We could also have included a "pad" byte to
> terminate the string, as the fib data is 512 bytes. My assumption is
> that somehow back in the day, someone managed to get odd characters
> into the name.
>
> Terminating the string early would truncate the name ...

So what do you propose as a fix?

-- 
Martin K. Petersen	Oracle Linux Engineering
