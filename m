From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 02 Jun 2017 21:32:21 +0000
Subject: Re: [PATCH] Remove an extra out label in _fcoe_create function
Message-Id: <yq1y3tahy8q.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d0539e8-ec2e-eac3-a91b-bfda55e83eca@redhat.com>
In-Reply-To: <0d0539e8-ec2e-eac3-a91b-bfda55e83eca@redhat.com> (Milan
        P. Gandhi's message of "Thu, 1 Jun 2017 17:38:55 +0530")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Milan P. Gandhi" <mgandhi@redhat.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Laurence Oberman <loberman@redhat.com>, Johannes Thumshirn <jth@kernel.org>


Milan,

> This patch removes an extra out label in _fcoe_create function
> where we return if creation of FCOE interface is failed.

Applied to 4.13/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
