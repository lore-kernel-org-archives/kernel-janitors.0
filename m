From: David Miller <davem@davemloft.net>
Date: Tue, 13 Jul 2010 21:24:28 +0000
Subject: Re: [PATCH] tc35815: fix iomap leak
Message-Id: <20100713.142428.193704758.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278756199-4636-1-git-send-email-segooon@gmail.com>
	<20100713.221428.74744945.anemo@mba.ocn.ne.jp>
In-Reply-To: <20100713.221428.74744945.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: anemo@mba.ocn.ne.jp
Cc: segooon@gmail.com, kernel-janitors@vger.kernel.org, jpirko@redhat.com, eric.dumazet@gmail.com, adobriyan@gmail.com, netdev@vger.kernel.org

From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Date: Tue, 13 Jul 2010 22:14:28 +0900 (JST)

> On Sat, 10 Jul 2010 14:03:18 +0400, Kulikov Vasiliy <segooon@gmail.com> wrote:
>> If tc35815_init_one() fails we must unmap mapped regions.
>> 
>> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
>> ---
>>  drivers/net/tc35815.c |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> No, pcim_xxx APIs are _managed_ interfaces.  These resources are
> released automatically.  Actually currently nobody in kernel call
> pcim_iounmap_regions() now.
> 
> And _if_ there is any reason to call pcim_iounmap_regions()
> explicitly, it should be called in tc35815_remove_one() too.
> 
> So, NAK.

I've reverted this patch, thanks.

Can someone go over the other similar patches I applied already to
net-next-2.6 to see if they have the same problem?  If so I'll revert
them too.

BTW, I think from one perspective the pcim_*() APIs make it harder to
audit a driver because resource management is magic and implicit
rather than explicit.  It adds an extra step to the audit, and I
don't see any effort being made to do a mass conversion of all
drivers to pcim_xxx which would be the only way in my mind for this
to truly make it easier to audit drivers for resource leak problems.

If both driver types (pcim_xxx and non-pcim_xxx) exist, it just means
more work for auditors as they have oen more thing to check for
instead of less things.
