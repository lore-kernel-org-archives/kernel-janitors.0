From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 07 Aug 2017 16:44:07 +0000
Subject: Re: [PATCH] z2ram: Delete four error messages for a failed memory allocation in z2_open()
Message-Id: <1a4e615a-1744-66a4-35cb-04f4ff9a52f7@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <83b6c012-07ca-39df-cfd4-0c4791ecda3d@users.sourceforge.net>
 <91f7d9cd-3428-b3f0-1833-3a7f63de505a@kernel.dk>
 <1502124184.2219.26.camel@perches.com>
In-Reply-To: <1502124184.2219.26.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, SF Markus Elfring <elfring@users.sourceforge.net>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

On 08/07/2017 10:43 AM, Joe Perches wrote:
> On Mon, 2017-08-07 at 10:08 -0600, Jens Axboe wrote:
>> On 08/07/2017 10:06 AM, SF Markus Elfring wrote:
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Mon, 7 Aug 2017 17:56:53 +0200
>>>
>>> Omit extra messages for a memory allocation failure in this function.
>>
>> Please stop sending these, thanks.
> 
> It would be pretty funny if Markus actually had a working
> Amiga / Zorro II board running the latest kernel and had
> actually tested this patch.

Doesn't look like he even compiles then. Which means that the investment
I have to make in reviewing them is that much greater, it's just not
worth it.

-- 
Jens Axboe

