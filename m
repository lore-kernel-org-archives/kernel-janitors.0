From: Kent Yoder <key@linux.vnet.ibm.com>
Date: Thu, 30 Aug 2012 19:21:55 +0000
Subject: Re: [PATCH] tpm: fix tpm_acpi sparse warning on different address spaces
Message-Id: <20120830192155.GA25524@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120830143839.GA9589@linux.vnet.ibm.com>
 <20120830174556.GD20741@mwanda>
In-Reply-To: <20120830174556.GD20741@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, tpmdd-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

On Thu, Aug 30, 2012 at 10:45:56AM -0700, Dan Carpenter wrote:
> On Thu, Aug 30, 2012 at 09:38:41AM -0500, Kent Yoder wrote:
> > acpi_os_map_memory expects its return value to be in the __iomem address
> > space. Cast it back later when used in a memcpy to avoid the same sparse
> > warning there.
> > 
> > Signed-off-by: Kent Yoder <key@linux.vnet.ibm.com>
> 
> I can't download linux-next right now but I don't think this is the
> correct fix.  I don't think you can memcpy() directly from __iomem.
> The static checker is warning about a valid bug which should be
> addressed instead of just casted away and silenced.

  I took a look at other uses of the return from acpi_os_map_memory(),
such as acpi_tb_parse_fadt(), which passes the returned pointer to
acpi_tb_create_local_fadt(), which uses ACPI_MEMCPY on it, which is just
memcpy.  This code lives in drivers/acpi.

Kent

> 
> regards,
> dan carpenter
> 
> 

