From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 24 Oct 2017 08:07:53 +0000
Subject: Re: [v2] axonram: Delete an unnecessary variable initialisation in axon_ram_probe()
Message-Id: <3yLm966YSTz9sNV@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <96042828-9707-8af9-664a-5c71818dd817@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, kbuild test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@fb.com>, Dan Williams <dan.j.williams@intel.com>, Paul Mackerras <paulus@samba.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, kbuild-all@01.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 2017-09-05 at 17:11:31 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 5 Sep 2017 18:47:02 +0200
> 
> The local variable "rc" will eventually be set only to an error code.
> Thus omit the explicit initialisation at the beginning.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a7cd4586210c69c19aef26f4f83d3e

cheers
