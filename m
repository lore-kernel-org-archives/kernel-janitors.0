From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 25 Feb 2020 17:40:17 +0000
Subject: Re: [PATCH 2/2] libnvdimm: Out of bounds read in __nd_ioctl()
Message-Id: <CAPcyv4h99vYcxgJ_9NKtYbhAGsifTG0JCRYq-j2t_CQinHZVcw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200225161927.hvftuq7kjn547fyj@kili.mountain> <20200225162055.amtosfy7m35aivxg@kili.mountain>
In-Reply-To: <20200225162055.amtosfy7m35aivxg@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Feb 25, 2020 at 8:21 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "cmd" comes from the user and it can be up to 255.  It it's more
> than the number of bits in long, it results out of bounds read when we
> check test_bit(cmd, &cmd_mask).  The highest valid value for "cmd" is
> ND_CMD_CALL (10) so I added a compare against that.
>
> Fixes: 62232e45f4a2 ("libnvdimm: control (ioctl) messages for nvdimm_bus and nvdimm devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good, applied.
