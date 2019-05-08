From: Doug Anderson <dianders@chromium.org>
Date: Wed, 08 May 2019 15:08:44 +0000
Subject: Re: [PATCH] kdb: do a sanity check on the cpu in kdb_per_cpu()
Message-Id: <CAD=FV=WB=om5sPH+p0FN7i=RJfj0L+9-3YUz_djF4Nw30B221Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190506125018.GA13799@mwanda>
In-Reply-To: <20190506125018.GA13799@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

On Mon, May 6, 2019 at 5:50 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
> cpu in a bitmap of online cpus, but if the value is too high then it
> could read beyond the end of the bitmap and possibly Oops.
>
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
