From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Sat, 25 Feb 2006 13:50:47 +0000
Subject: Re: [KJ] linux-2.6.15.4/drivers/i2c/i2c-core.c.bak:  EPERM -> EINVAL
Message-Id: <200602251450.48020.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44004DD8.2040606@bfs.de>
In-Reply-To: <44004DD8.2040606@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 25 February 2006 14:06, walter harms wrote:
> hi all,
> imho EBUSY would indicate someone else is using it. But < 0 should never
> happen (integer overflow ?). even BUG() would be ok but the author
> decided otherwise and i do not what to change that.
Oh wait, I thought the function would try to set something up and fail at 
that.  Didn't see it was only trying to release stuff.

> tim: do you know this ?
> http://dev1.boomersdomain.com/cgi-bin/store_pedalinghistory_2/01068.html
Hahahaha, yes, that does look familiar.

Tim
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
