From: James Smart <james.smart@broadcom.com>
Date: Thu, 14 Sep 2017 14:47:59 +0000
Subject: Re: [PATCH] scsi: lpfc: remove redundant null check on eqe
Message-Id: <9d36fb68-7997-cba7-8e27-5b28306e443c@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908080201.9592-1-colin.king@canonical.com>
In-Reply-To: <20170908080201.9592-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/8/2017 1:02 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer eqe is always non-null inside the while loop, so the
> check to see if eqe is NULL is redudant and hence can be removed.
>
> Detected by CoverityScan CID#1248693 ("Logically Dead Code")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>

Yep. thank you

Signed-off-by: James Smart <james.smart@broadcom.com>

