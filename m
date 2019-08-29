From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 29 Aug 2019 21:45:05 +0000
Subject: Re: [PATCH] scsi: fcoe: remove redundant call to skb_transport_header
Message-Id: <yq1blw7sl26.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815091454.13430-1-colin.king@canonical.com>
In-Reply-To: <20190815091454.13430-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 15 Aug 2019 10:14:54 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hannes Reinecke <hare@suse.de>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Pointer fh is being assigned a return value from the call to
> skb_transport_header however this value is never read and fh is being
> re-assigned immediately afterwards with a new value.  Since there are
> side-effects from calling skb_transport_header the call is redundant
> and can be removed.

Applied to 5.4/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
