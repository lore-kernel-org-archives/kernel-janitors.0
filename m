From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 25 Feb 2020 17:39:32 +0000
Subject: Re: [PATCH 1/2] acpi/nfit: improve bounds checking for 'func'
Message-Id: <CAPcyv4ht6kicLV_uk5Rt7a7iAxXrwuVoN2m6uVSw0h3qiE4AhA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200225161927.hvftuq7kjn547fyj@kili.mountain>
In-Reply-To: <20200225161927.hvftuq7kjn547fyj@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, Linux ACPI <linux-acpi@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Feb 25, 2020 at 8:20 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The 'func' variable can come from the user in the __nd_ioctl().  If it's
> too high then the (1 << func) shift in acpi_nfit_clear_to_send() is
> undefined.  In acpi_nfit_ctl() we pass 'func' to test_bit(func, &dsm_mask)
> which could result in an out of bounds access.
>
> To fix these issues, I introduced the NVDIMM_CMD_MAX (31) define and
> updated nfit_dsm_revid() to use that define as well instead of magic
> numbers.
>
> Fixes: 11189c1089da ("acpi/nfit: Fix command-supported detection")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

I'll apply this to my fixes branch.
