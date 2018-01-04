From: Geoff Levand <geoff@infradead.org>
Date: Thu, 04 Jan 2018 20:44:00 +0000
Subject: Re: [PATCH] ps3_gelic_net: Delete an error message for a failed memory allocation in gelic_descr_pre
Message-Id: <611a3611-a5ef-9681-7b60-77b83922d6c9@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9613bfbf-11cc-1e66-484a-84fcda022861@users.sourceforge.net>
In-Reply-To: <9613bfbf-11cc-1e66-484a-84fcda022861@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 01/03/2018 06:40 AM, SF Markus Elfring wrote:
> Omit an extra message for a memory allocation failure in this function.

I applied this to my ps3-queue branch.

As I mentioned to you several times before, please keep
the commit subject line to less than 50 characters.
Also, in this case the prefix would be 'net/ps3_gelic_net:"

-Geoff
