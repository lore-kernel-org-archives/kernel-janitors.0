From: Huang Ying <ying.huang@intel.com>
Date: Sat, 21 Jan 2012 00:12:06 +0000
Subject: Re: [patch] ACPI, APEI, EINJ, cleanup 0 vs NULL confusion
Message-Id: <1327104726.7922.8.camel@yhuang-dev>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120120075714.GD2295@elgon.mountain>
In-Reply-To: <20120120075714.GD2295@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2012-01-20 at 10:57 +0300, Dan Carpenter wrote:
> This function is returning pointers.  Sparse complains here:
> drivers/acpi/apei/einj.c:262:32: warning:
> 	Using plain integer as NULL pointer
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Huang Ying <ying.huang@intel.com>

Best Regards,
Huang Ying

