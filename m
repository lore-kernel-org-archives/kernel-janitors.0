From: Jiri Kosina <jkosina@suse.cz>
Date: Sat, 08 Sep 2012 19:20:06 +0000
Subject: Re: [patch] HID: picoLCD: fix a NULL test in picolcd_raw_cir()
Message-Id: <alpine.LNX.2.00.1209082119470.31277@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120907064740.GB12028@elgon.mountain> <20120907233818.62aa63d2@neptune.home>
In-Reply-To: <20120907233818.62aa63d2@neptune.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 7 Sep 2012, Bruno Prémont wrote:

> > Smatch complains that the NULL checking in this function is not
> > consistent and could lead to a NULL dereference.  The comments say that
> > we should return here if rc_dev is NULL so I've changed the test to
> > match the comment.
> 
> Good catch! Currently thanks to HID mutex around probe()/remove()
> we should never be able to see rc_dev being NULL here.
> 
> 
> Once the probe()/remove() mutex gets tied to hw_start()/hw_stop() or
> otherwise changed to allow drivers to chat with device during probe()
> ->rc_dev might be NULL in picolcd_raw_cir().
> 
> 
> Reviewed-by: Bruno Prémont <bonbons@linux-vserver.org>

Applied, thanks Dan, thanks Bruno.

-- 
Jiri Kosina
SUSE Labs
