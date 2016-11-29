From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 29 Nov 2016 16:48:09 +0000
Subject: Re: [PATCH] cxgb4i: Add a missing call to neigh_release
Message-Id: <yq1inr6nsfq.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161119174214.20241-1-lambert.quentin@gmail.com>
In-Reply-To: <20161119174214.20241-1-lambert.quentin@gmail.com> (Quentin
        Lambert's message of "Sat, 19 Nov 2016 18:42:14 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Varun Prakash <varun@chelsio.com>
Cc: Quentin Lambert <lambert.quentin@gmail.com>, Karen Xie <kxie@chelsio.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Quentin" = Quentin Lambert <lambert.quentin@gmail.com> writes:

Quentin> Most error branches following the call to dst_neigh_lookup
Quentin> contain a call to neigh_release. This patch add these calls
Quentin> where they are missing.

Varun: Please review!

-- 
Martin K. Petersen	Oracle Linux Engineering
