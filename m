From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 13 Oct 2011 04:36:07 +0000
Subject: Re: [patch v2] Input: force feedback - potential integer wrap in
Message-Id: <20111013043607.GC11763@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111009162524.GA14049@elgon.mountain>
 <20111010050852.GA18794@core.coreip.homeip.net>
 <20111010204830.GV30887@longonot.mountain>
 <20111011211949.GB30887@longonot.mountain>
In-Reply-To: <20111011211949.GB30887@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 12, 2011 at 12:19:49AM +0300, Dan Carpenter wrote:
> The problem here is that max_effects can wrap on 32 bits systems.
> We'd allocate a smaller amount of data than sizeof(struct ff_device).
> The call to kcalloc() on the next line would fail but it would write
> the NULL return outside of the memory we just allocated causing data
> corruption.
> 
> The call path is that uinput_setup_device() get ->ff_effects_max from
> the user and sets the value in the ->private_data struct.  From there
> it is:
> -> uinput_ioctl_handler()
>    -> uinput_create_device()
>       -> input_ff_create(dev, udev->ff_effects_max);
> 
> I've also changed ff_effects_max so it's an unsigned int instead of
> a signed int as a cleanup.

Applied (adding a temp to hold the size), thanks.

-- 
Dmitry
