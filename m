From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 18 Oct 2019 16:16:33 +0000
Subject: Re: [PATCH] acpi/nfit: unlock on error in scrub_show()
Message-Id: <CAPcyv4jm7kiayfHnBcm7mNW2NeJ81LeUVphMYG0Tq50is-tQ0A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191018123534.GA6549@mwanda>
In-Reply-To: <20191018123534.GA6549@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, Keith Busch <keith.busch@intel.com>, Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, Linux ACPI <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Oct 18, 2019 at 5:37 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We change the locking in this function and forgot to update this error
> path so we are accidentally still holding the "dev->lockdep_mutex".
>
> Fixes: 87a30e1f05d7 ("driver-core, libnvdimm: Let device subsystems add local lockdep coverage")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me, thanks Dan.
