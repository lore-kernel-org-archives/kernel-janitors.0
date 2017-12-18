From: Geoff Levand <geoff@infradead.org>
Date: Mon, 18 Dec 2017 18:22:27 +0000
Subject: Re: [PATCH 2/2] ps3: Improve a size determination in five functions
Message-Id: <128a40fe-0998-2d6c-ad56-e7b63fce7f12@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b6464bc-a408-de2a-1b54-cb7794b92506@users.sourceforge.net>
 <7aed1208-aa55-edb6-54be-f47fb1498bfd@users.sourceforge.net>
In-Reply-To: <7aed1208-aa55-edb6-54be-f47fb1498bfd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

On 12/16/2017 05:54 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 16 Dec 2017 14:21:04 +0100
> 
> Replace the specification of data structures by variable references
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.

This would be OK, but you are also removing empty lines and changing
the coding format.

Please update the patch to only make the sizeof changes.

-Geoff
