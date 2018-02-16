From: Jiri Kosina <jikos@kernel.org>
Date: Fri, 16 Feb 2018 12:35:10 +0000
Subject: Re: [PATCH][next] HID: asus: make array 'buf' static const, shrinks object size
Message-Id: <nycvar.YFH.7.76.1802161335000.13621@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180106155027.17561-1-colin.king@canonical.com>
In-Reply-To: <20180106155027.17561-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 6 Jan 2018, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const read-only array 'buf' on the stack but instead
> make it stati. Makes the object code smaller by 26 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   14378	   2384	     64	  16826	   41ba	linux/drivers/hid/hid-asus.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   14296	   2440	     64	  16800	   41a0	linux/drivers/hid/hid-asus.o
> 
> (gcc version 7.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to for-4.17/upstream.

-- 
Jiri Kosina
SUSE Labs

