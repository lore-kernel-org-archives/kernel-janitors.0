From: Bart Van Assche <bvanassche@acm.org>
Date: Sun, 26 Jan 2020 16:46:09 +0000
Subject: Re: [PATCH][next] scsi: megaraid_sas: fix indentation issue
Message-Id: <be4d6a2a-fd83-f2ad-450a-c00b95def734@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126154757.42530-1-colin.king@canonical.com>
In-Reply-To: <20200126154757.42530-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2020-01-26 07:47, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two statments that are indented one level too deeply, remove
                ^^^^^^^^^
                statements?
> the extraneous tabs.

Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
