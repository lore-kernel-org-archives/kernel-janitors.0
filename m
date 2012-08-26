From: "devendra.aaru" <devendra.aaru@gmail.com>
Date: Sun, 26 Aug 2012 09:24:12 +0000
Subject: Re: fs/ntfs/super.c:2717:1-14: alloc with no test
Message-Id: <CAHdPZaNs99QLOD=-QeUvFj5soSJMZCPU24V=5QXuVWx0r1jC5g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120826090447.GA11098@localhost>
In-Reply-To: <20120826090447.GA11098@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Anton Altaparmakov <anton@tuxera.com>, kernel-janitors@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Sun, Aug 26, 2012 at 2:34 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
>
> Hi Anton,
>
> FYI, coccinelle warns about
>
> fs/ntfs/super.c:2717:1-14: alloc with no test, possible model on line 2718
>
> vim +2717 fs/ntfs/super.c
>   2714          sb->s_flags |= MS_RDONLY;
>   2715  #endif /* ! NTFS_RW */
>   2716          /* Allocate a new ntfs_volume and place it in sb->s_fs_info. */
>> 2717          sb->s_fs_info = kmalloc(sizeof(ntfs_volume), GFP_NOFS);

That's i think a false alarm.

>   2718          vol = NTFS_SB(sb);

The NTFS_SB(buf) {
      buf->s_fs_info;
 }

so we are validating the allocated pointer s_fs_info.

correct me if i am wrong.

Thanks,

>   2719          if (!vol) {
>   2720                  if (!silent)
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
