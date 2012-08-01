From: Brassow Jonathan <jbrassow@redhat.com>
Date: Wed, 01 Aug 2012 15:33:07 +0000
Subject: Re: [md:for-next 18/18] dm-raid.c:(.text+0x11f6d5): undefined reference to `md_raid10_congested'
Message-Id: <C06B1455-851F-479F-8A76-543DD6592F15@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120801125102.GA19751@localhost>
In-Reply-To: <20120801125102.GA19751@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Aug 1, 2012, at 7:51 AM, Fengguang Wu wrote:

> Hi Jonathan,
> 
> Kernel build failed on
> 
> tree:   git://neil.brown.name/md for-next
> head:   63f33b8dda88923487004b20fba825486d009e7b
> commit: 63f33b8dda88923487004b20fba825486d009e7b [18/18] DM RAID: Add support for MD RAID10
> config: i386-randconfig-k016 (attached as .config)
> 
> All related error/warning messages:
> 
> drivers/built-in.o: In function `raid_is_congested':
> dm-raid.c:(.text+0x11f6d5): undefined reference to `md_raid10_congested'


Seems that the previous patches that this patch depends on are not applied in your case.  Looking here:
http://neil.brown.name/git?p=md;a=shortlog;h=refs/heads/for-next
it seems that Neil has taken the prerequisites (in this case, "MD RAID10: export md_raid10_congested").

 brassow