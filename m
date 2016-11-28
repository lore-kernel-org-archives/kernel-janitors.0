From: Tomas Henzl <thenzl@redhat.com>
Date: Mon, 28 Nov 2016 13:48:32 +0000
Subject: Re: [PATCH v2] scsi: aic94xx: Add a missing call to kfree
Message-Id: <bc5d29b1-5004-3a12-432a-4c72bb5edae2@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161125122351.8226-1-lambert.quentin@gmail.com>
In-Reply-To: <20161125122351.8226-1-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 20161119174038.20083-1-lambert.quentin@gmail.com, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 25.11.2016 13:23, Quentin Lambert wrote:
> Most error branches following the call to kzalloc contain
> a call to kfree. This patch add these calls where they are
> missing and set the relevant pointers to NULL.
>
> This issue was found with Hector.
>
> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>

Looks good,
Reviewed-by: Tomas Henzl <thenzl@redhat.com>
Tomas

