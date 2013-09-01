From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 01 Sep 2013 23:10:31 +0000
Subject: Re: [PATCH] Staging: android: Mark local functions in binder.c as static
Message-Id: <20130901231030.GX6329@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1378066724-6340-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1378066724-6340-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Sep 01, 2013 at 10:18:44PM +0200, Bojan Prtvar wrote:
> -void binder_stat_br(struct binder_proc *proc, struct binder_thread *thread,
> +static void binder_stat_br(struct binder_proc *proc,
> +			struct binder_thread *thread,
>  		    uint32_t cmd)

The indenting needs to be updated to match as well.  Add 3 spaces before
"struct binder_thread" and move the "uint32_t cmd)" up a line.  Like
this:

static void binder_stat_br(struct binder_proc *proc,
			   struct binder_thread *thread, uint32_t cmd)
{

regards,
dan carpenter

