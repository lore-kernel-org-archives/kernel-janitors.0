From: Geoff Levand <geoff@infradead.org>
Date: Wed, 18 Oct 2017 19:32:10 +0000
Subject: Re: [PATCH 0/2] PowerPC-PS3: Adjustments for three function implementations
Message-Id: <bc74497b-bf2b-01a1-b551-9374650b1f58@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <36a8ba41-7f1e-31f8-5d32-19e04393b181@users.sourceforge.net>
In-Reply-To: <36a8ba41-7f1e-31f8-5d32-19e04393b181@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 10/17/2017 11:54 AM, SF Markus Elfring wrote:
> Markus Elfring (2):
>   Delete an error message for a failed memory allocation in update_flash_db()
>   Improve a size determination in two functions

For consistency, please use 'powerpc/ps3' not 'powerpc-ps3' as
the commit log subject prefix.  Also, please try to keep the
commit log subject to 50 characters or less.

-Geoff
