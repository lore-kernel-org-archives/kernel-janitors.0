From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Thu, 04 May 2017 19:46:46 +0000
Subject: Re: [PATCH] scsi: pmcraid: remove redundant check to see if request_size is less than zero
Message-Id: <79da6ab7-da2c-c1fc-e384-92d68028d091@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503162901.3623-1-colin.king@canonical.com>
In-Reply-To: <20170503162901.3623-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/03/2017 09:29 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The 2nd check to see if request_size is less than zero is redundant
> because the first check takes error exit path on this condition. So,
> since it is redundant, remove it.
> 
> Detected by CoverityScan, CID#146149 ("Logically Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>

