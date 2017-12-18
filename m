From: Geoff Levand <geoff@infradead.org>
Date: Mon, 18 Dec 2017 18:22:18 +0000
Subject: Re: [PATCH 1/2] ps3: Delete an error message for a failed memory allocation in two functions
Message-Id: <1fb2955d-7233-7069-7c4b-316a4eb764f0@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b6464bc-a408-de2a-1b54-cb7794b92506@users.sourceforge.net>
 <58807b28-b2b9-7e77-11b8-21db43c9d5ba@users.sourceforge.net>
In-Reply-To: <58807b28-b2b9-7e77-11b8-21db43c9d5ba@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 12/16/2017 05:51 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 16 Dec 2017 12:32:42 +0100
> 
> Omit an extra message for a memory allocation failure in these functions.

This is OK, I'll add it to my ps3-queue branch.

-Geoff
