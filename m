From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 29 May 2020 10:09:06 +0000
Subject: Re: [PATCH] scsi: Fix reference count leak in iscsi_boot_create_kobj()
Message-Id: <e7ff4f24-7708-15a0-5afe-18d50c9622af@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <62ff53e5-32d0-0440-045d-881350b2e6cd@web.de>
In-Reply-To: <62ff53e5-32d0-0440-045d-881350b2e6cd@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Leech <cleech@redhat.com>, "James E. J. Bottomley" <jejb@linux.ibm.com>, Kangjie Lu <kjlu@umn.edu>, Lee Duncan <lduncan@suse.com>, "Martin K. Petersen" <martin.petersen@oracle.com>

> kobject_init_and_add() should be handled when it return an error,
> because kobject_init_and_add() takes reference even when it fails.

I find this wording approach improvable.


> Previous commit "b8eb718348b8" fixed a similar problem.

I suggest to omit this information from the commit message.


> Thus replace calling kfree() by calling kobject_put().

How do you think about a wording variant like the following?

   Thus replace a call of the function “kfree” by “kobject_put”
   because of using kernel objects in the proper way.


Please take another look also at the message field “To”.
Which recipients should be specified there first?

Regards,
Markus
