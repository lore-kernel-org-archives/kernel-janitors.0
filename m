From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 18 Dec 2009 14:19:02 +0000
Subject: Re: [PATCH 08/10] Fix misspellings of "invocation" in comments.
Message-Id: <alpine.LNX.2.00.0912181518320.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1260567342-8327-9-git-send-email-adam.buchbinder@gmail.com>
In-Reply-To: <1260567342-8327-9-git-send-email-adam.buchbinder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 11 Dec 2009, Adam Buchbinder wrote:

> Some comments misspell "invocation"; this fixes them. No code
> changes.
> 
> Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
> ---
>  drivers/staging/wlan-ng/hfa384x_usb.c |    2 +-
>  fs/buffer.c                           |    2 +-
>  fs/mpage.c                            |    2 +-
>  include/linux/mmzone.h                |    2 +-
>  kernel/sched_cpupri.c                 |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

I have removed the "staging" bit (see my other mail) and applied the rest. 
Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
