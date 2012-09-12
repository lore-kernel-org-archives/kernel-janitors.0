From: James Morris <jmorris@namei.org>
Date: Wed, 12 Sep 2012 03:12:42 +0000
Subject: Re: [PATCH] tpm: fix tpm_acpi sparse warning on different address spaces
Message-Id: <alpine.LRH.2.02.1209121312300.4482@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120830143839.GA9589@linux.vnet.ibm.com> <20120830174556.GD20741@mwanda> <20120830192155.GA25524@linux.vnet.ibm.com> <20120902163030.GB1840@mwanda> <20120904161819.GB20588@linux.vnet.ibm.com>
In-Reply-To: <20120904161819.GB20588@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kent Yoder <key@linux.vnet.ibm.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, tpmdd-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

On Tue, 4 Sep 2012, Kent Yoder wrote:

> acpi_os_map_memory expects its return value to be in the __iomem address
> space. Tag the variable we're using as such and use memcpy_fromio to
> avoid further sparse warnings.
> 
> Signed-off-by: Kent Yoder <key@linux.vnet.ibm.com>

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next


-- 
James Morris
<jmorris@namei.org>
