From: John Garry <john.garry@huawei.com>
Date: Wed, 22 Jul 2020 15:59:36 +0000
Subject: Re: [PATCH] scsi: libsas: remove redundant assignment to variable res
Message-Id: <ae1d58d3-3dac-14c2-9e10-047ffcbe8c99@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200722154404.959267-1-colin.king@canonical.com>
In-Reply-To: <20200722154404.959267-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 22/07/2020 16:44, Colin King wrote:
> From: Colin Ian King<colin.king@canonical.com>
> 
> The variable res is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King<colin.king@canonical.com>

Reviewed-by: John Garry <john.garry@huawei.com>
