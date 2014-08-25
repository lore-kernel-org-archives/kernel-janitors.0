From: Jonas Gorski <jogo@openwrt.org>
Date: Mon, 25 Aug 2014 19:09:53 +0000
Subject: Re: [PATCH 4/7] MIPS: BCM63xx: delete double assignment
Message-Id: <CAOiHx=m_-GmRwAmPOWFg8w9pFMPU8Vn9U-UO+k=jDdDxNH7R3Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408818808-18850-1-git-send-email-Julia.Lawall@lip6.fr>
 <1408818808-18850-5-git-send-email-Julia.Lawall@lip6.fr> <20140825112754.GE27724@linux-mips.org>
In-Reply-To: <20140825112754.GE27724@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, joe@perches.com, kernel-janitors@vger.kernel.org, MIPS Mailing List <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Aug 25, 2014 at 1:27 PM, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Sat, Aug 23, 2014 at 08:33:25PM +0200, Julia Lawall wrote:
>
>> Delete successive assignments to the same location.  In each case, the
>> duplicated assignment is modified to be in line with other nearby code.
>>
>> A simplified version of the semantic match that finds this problem is as
>> follows: (http://coccinelle.lip6.fr/)
>
> Looking good, applied.

Huh, somehow gmail decided the original emails were spam.

> Thanks,
>
>   Ralf

Also thanks from me for cleaning up behind me! These mistakes were
definitely mine.


Jonas
