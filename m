From: Minchan Kim <minchan.kim@gmail.com>
Date: Tue, 06 Apr 2010 11:04:03 +0000
Subject: Re: [patch] proc: copy_to_user() returns unsigned
Message-Id: <v2p28c262361004060404u63146873x725d8927c47a3329@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100406104539.GC21229@bicker>
In-Reply-To: <20100406104539.GC21229@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Minchan Kim <minchan.kim@gmail.com>, Matt Mackall <mpm@selenic.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I got confused when I see the title of patch.
That's because I understood copy_to_user returns unsigned.
Please, change title to describe your patch.

[PATCH] proc : fix wrong usage of copy_to_user's return value.

Maybe you could name it well than me who is a not native English.

On Tue, Apr 6, 2010 at 7:45 PM, Dan Carpenter <error27@gmail.com> wrote:
> copy_to_user() returns the number of bytes left to be copied.
>
> This was a typo from: d82ef020cf31504c816803b1def94eb5ff173363
> "proc: pagemap: Hold mmap_sem during page walk".
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Minchan Kim <minchan.kim@gmail.com>



-- 
Kind regards,
Minchan Kim
