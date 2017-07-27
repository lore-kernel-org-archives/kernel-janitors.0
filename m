From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Jul 2017 09:00:35 +0000
Subject: Re: [PATCH 2/2] scsi: aacraid: Off by one NUL terminator
Message-Id: <20170727090035.iqqavxvuc6hntjhs@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170725195110.uwrzzkzvrbfqv7ld@mwanda>
 <yq1wp6uwp9c.fsf@oracle.com>
In-Reply-To: <yq1wp6uwp9c.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Adaptec OEM Raid Solutions <aacraid@microsemi.com>, Mahesh Rajashekhara <Mahesh.Rajashekhara@pmcs.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

It would be simple enough to write it like you say, but it probably
should be done by someone who is able to test it.

regards,
dan carpenter

