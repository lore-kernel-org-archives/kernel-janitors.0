From: Alexander Lyakas <alex.bolshoy@gmail.com>
Date: Thu, 27 Sep 2012 07:45:51 +0000
Subject: Re: [md:for-next 32/33] drivers/md/raid5.c:2866:3: warning: format '%lu' expects argument of type 'l
Message-Id: <CAGRgLy4X7pe0S2rqWFyrJ=jrEoBg-VQYOnYvM_rpSPcG0OTqxg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926013908.GE8522@localhost>
In-Reply-To: <20120926013908.GE8522@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks, Neil.

On Wed, Sep 26, 2012 at 3:52 AM, NeilBrown <neilb@suse.de> wrote:
> On Wed, 26 Sep 2012 09:39:08 +0800 Fengguang Wu <fengguang.wu@intel.com>
> wrote:
>
>> Hi Alexander,
>>
>> FYI, there are new compile warnings show up in
>>
>> tree:   git://neil.brown.name/md for-next
>> head:   0179d361662367ab0f80b5822b162a1c0ba9b57d
>> commit: eadb9fb1d4da32ed1b143a6fc1997c4c42ea0422 [32/33] md: When RAID5 is dirty, force reconstruct-write instead of read-modify-write.
>> config: m68k-allyesconfig
>>
>> All warnings:
>>
>> drivers/md/raid5.c: In function 'handle_stripe_dirtying':
>> drivers/md/raid5.c:2866:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'sector_t' [-Wformat]
>> drivers/md/raid5.c:2866:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'sector_t' [-Wformat]
>>
>> vim +2866 drivers/md/raid5.c
>>   2850                sector_t recovery_cp = conf->mddev->recovery_cp;
>>   2851
>>   2852                /* RAID6 requires 'rcw' in current implementation.
>>   2853                 * Otherwise, check whether resync is now happening or should start.
>>   2854                 * If yes, then the array is dirty (after unclean shutdown or
>>   2855                 * initial creation), so parity in some stripes might be inconsistent.
>>   2856                 * In this case, we need to always do reconstruct-write, to ensure
>>   2857                 * that in case of drive failure or read-error correction, we
>>   2858                 * generate correct data from the parity.
>>   2859                 */
>>   2860                if (conf->max_degraded = 2 ||
>>   2861                    (recovery_cp < MaxSector && sh->sector >= recovery_cp)) {
>>   2862                        /* Calculate the real rcw later - for now make it
>>   2863                         * look like rcw is cheaper
>>   2864                         */
>>   2865                        rcw = 1; rmw = 2;
>> > 2866                        pr_debug("force RCW max_degraded=%u, recovery_cp=%lu sh->sector=%lu\n",
>>   2867                                 conf->max_degraded, recovery_cp, sh->sector);
>>   2868                } else for (i = disks; i--; ) {
>>   2869                        /* would I have to read this buffer for read_modify_write */
>>   2870                        struct r5dev *dev = &sh->dev[i];
>>   2871                        if ((dev->towrite || i = sh->pd_idx) &&
>>   2872                            !test_bit(R5_LOCKED, &dev->flags) &&
>>   2873                            !(test_bit(R5_UPTODATE, &dev->flags) ||
>>   2874                              test_bit(R5_Wantcompute, &dev->flags))) {
>>
>> ---
>> 0-DAY kernel build testing backend         Open Source Technology Centre
>> Fengguang Wu, Yuanhan Liu                              Intel Corporation
>
>
> Thanks again!
> I've fixed this up.
>
> NeilBrown
