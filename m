From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 28 Mar 2017 01:54:48 +0000
Subject: Re: [PATCH] scsi: osd_uld: remove an unneeded NULL check
Message-Id: <yq14lye6u8n.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170323104142.GD20154@mwanda>
In-Reply-To: <20170323104142.GD20154@mwanda> (Dan Carpenter's message of "Thu,
        23 Mar 2017 13:41:42 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boaz Harrosh <ooo@electrozaur.com>, Benny Halevy <bhalevy@primarydata.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, osd-dev@open-osd.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> We don't call the remove() function unless probe() succeeds so "oud"
> can't be NULL here.  Plus, if it were NULL, we dereference it on the
> next line so it would crash anyway.

Applied to 4.12/scsi-queue (by hand).

-- 
Martin K. Petersen	Oracle Linux Engineering
