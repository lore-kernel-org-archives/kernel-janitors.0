From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 23 Sep 2011 07:29:57 +0000
Subject: Re: [patch] Input: potential info leak in input_event_to_user()
Message-Id: <20110923072957.GA613@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110923062207.GF4387@elgon.mountain>
In-Reply-To: <20110923062207.GF4387@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 23, 2011 at 09:22:07AM +0300, Dan Carpenter wrote:
> Smatch has a new check for Rosenberg type information leaks where
> structs are copied to the user with uninitialized stack data in them.
> 
> The issue here is that struct input_event_compat has a hole in it.
> 
> struct input_event_compat {
>         struct compat_timeval {
>         } time;                             /*     0     0 */
> 
>         /* XXX 8 bytes hole, try to pack */
> 
>         short unsigned int         type;    /*     8     2 */

Hm, are you sure? 8-bytes is way too much. I'd expect type to be aligned
on 2-byte boundary, at least on x86_64...

> 
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/input/input-compat.c b/drivers/input/input-compat.c
> index e46a867..007850a 100644
> --- a/drivers/input/input-compat.c
> +++ b/drivers/input/input-compat.c
> @@ -44,6 +44,8 @@ int input_event_to_user(char __user *buffer,
>  	if (INPUT_COMPAT_TEST) {
>  		struct input_event_compat compat_event;
>  
> +		memset(&compat_event, 0, sizeof(compat_event));
> +
>  		compat_event.time.tv_sec = event->time.tv_sec;
>  		compat_event.time.tv_usec = event->time.tv_usec;
>  		compat_event.type = event->type;

-- 
Dmitry
