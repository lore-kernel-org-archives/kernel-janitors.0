From: Tejun Heo <tj@kernel.org>
Date: Fri, 11 Mar 2016 17:41:04 +0000
Subject: Re: [patch] ata: ahci_xgene: dereferencing uninitialized pointer in probe
Message-Id: <20160311174104.GH24046@htj.duckdns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160310074532.GA7163@mwanda>
In-Reply-To: <20160310074532.GA7163@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Suman Tripathi <stripathi@apm.com>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Mar 10, 2016 at 10:45:32AM +0300, Dan Carpenter wrote:
> If the call to acpi_get_object_info() fails then "info" hasn't been
> initialized.  In that situation, we already know that "version" should
> be XGENE_AHCI_V1 so we don't actually need to dereference "info".
> 
> Fixes: c9802a4be661 ('ata: ahci_xgene: Add AHCI Support for 2nd HW version of APM X-Gene SoC AHCI SATA Host controller.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to libata/for-4.6.

Thanks.

-- 
tejun
