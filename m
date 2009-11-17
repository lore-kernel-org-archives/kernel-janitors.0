From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 17 Nov 2009 16:14:13 +0000
Subject: Re: Patch for fixing compilation warning
Message-Id: <20091117081413.51902d64.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9e8c6460911170332j1e1704bbtdbd681ab78ffc6ba@mail.gmail.com>
In-Reply-To: <9e8c6460911170332j1e1704bbtdbd681ab78ffc6ba@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 17 Nov 2009 17:02:20 +0530 Meenakshi Khorana wrote:

> I am hereby submitting my first patch for removing the following
> compile time warning

What kernel version is this patch for?
This source file has been removed in recent kernels.


> kernel/marker.c: In function `remove_marker':
> kernel/marker.c:435: warning: `e' might be used uninitialized in this function

Did you analyze this remove_marker() function to see if the gcc
warning is correct?  Sometimes this warning is just noise.


> Please provide the feedback on same.
> 
> Signed-off-by: Meenakshi <khurana.meenakshi@gmail.com>
> 
> --- kernel/marker.c.orig        2009-11-17 16:41:29.000000000 +0530
> +++ kernel/marker.c     2009-11-17 16:41:41.000000000 +0530
> @@ -432,7 +432,7 @@ static int remove_marker(const char *nam
>  {
>         struct hlist_head *head;
>         struct hlist_node *node;
> -       struct marker_entry *e;
> +       struct marker_entry *e = NULL;

gmail converted tabs to spaces in the -+ lines above, so the patch
would not apply cleanly if this source file were still in use.

gmail is known for doing this.  Please see
Documentation/email-clients.txt in the kernel source tree for help.

>         int found = 0;
>         size_t len = strlen(name) + 1;
>         u32 hash = jhash(name, len-1, 0);


---
~Randy
