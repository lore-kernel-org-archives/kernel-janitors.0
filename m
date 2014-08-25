From: Ralf Baechle <ralf@linux-mips.org>
Date: Mon, 25 Aug 2014 11:27:54 +0000
Subject: Re: [PATCH 4/7] MIPS: BCM63xx: delete double assignment
Message-Id: <20140825112754.GE27724@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408818808-18850-1-git-send-email-Julia.Lawall@lip6.fr>
 <1408818808-18850-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1408818808-18850-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On Sat, Aug 23, 2014 at 08:33:25PM +0200, Julia Lawall wrote:

> Delete successive assignments to the same location.  In each case, the
> duplicated assignment is modified to be in line with other nearby code.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Looking good, applied.

Thanks,

  Ralf
