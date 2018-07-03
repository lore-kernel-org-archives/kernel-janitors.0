From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 03 Jul 2018 19:32:56 +0000
Subject: Re: [PATCH] sgi-xp: remove redundant pointers ch and rp
Message-Id: <CAK8P3a3A_qN_DjfT8ck3Xr87Li6wa8oPEHBMJ-Bu1EONN=jS5w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703072305.29169-1-colin.king@canonical.com>
In-Reply-To: <20180703072305.29169-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Cliff Whickman <cpw@sgi.com>, Robin Holt <robinmholt@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jul 3, 2018 at 9:23 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointers ch and rp are set but are never used hence they are
> redundant and can be removed.
>
> Cleans up clang warnings:
> warning: variable 'ch' set but not used [-Wunused-but-set-variable]
> warning: variable 'rp' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/misc/sgi-xp/xpc_channel.c   | 3 ---
>  drivers/misc/sgi-xp/xpc_partition.c | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/drivers/misc/sgi-xp/xpc_channel.c b/drivers/misc/sgi-xp/xpc_channel.c
> index 128d5615c804..05a890ce2ab8 100644
> --- a/drivers/misc/sgi-xp/xpc_channel.c
> +++ b/drivers/misc/sgi-xp/xpc_channel.c
> @@ -656,7 +656,6 @@ xpc_initiate_connect(int ch_number)
>  {
>         short partid;
>         struct xpc_partition *part;
> -       struct xpc_channel *ch;
>
>         DBUG_ON(ch_number < 0 || ch_number >= XPC_MAX_NCHANNELS);
>
> @@ -664,8 +663,6 @@ xpc_initiate_connect(int ch_number)
>                 part = &xpc_partitions[partid];
>
>                 if (xpc_part_ref(part)) {
> -                       ch = &part->channels[ch_number];
> -
>                         /*
>                          * Initiate the establishment of a connection on the
>                          * newly registered channel to the remote partition.

This was left behind in 2005 when the last use of that variable
got removed in commit e54af724c1ae ("[IA64-SGI] fixes for XPC
disengage and open/close protocol")


> diff --git a/drivers/misc/sgi-xp/xpc_partition.c b/drivers/misc/sgi-xp/xpc_partition.c
> index 7284413dabfd..4e59b01ad7eb 100644
> --- a/drivers/misc/sgi-xp/xpc_partition.c
> +++ b/drivers/misc/sgi-xp/xpc_partition.c
> @@ -415,7 +415,6 @@ xpc_discovery(void)
>         int region_size;
>         int max_regions;
>         int nasid;
> -       struct xpc_rsvd_page *rp;
>         unsigned long *discovered_nasids;
>         enum xp_retval ret;
>
> @@ -432,8 +431,6 @@ xpc_discovery(void)
>                 return;
>         }
>
> -       rp = (struct xpc_rsvd_page *)xpc_rsvd_page;
> -

And this one in
4b38fcd48582 ("[IA64-SGI] XPC changes to support more than 2k nasids")

Both changes look correct to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>
