From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 01 Oct 2012 22:18:00 +0000
Subject: Re: [PATCH] HID: picoLCD: Remove use of deprecated function
Message-Id: <alpine.LNX.2.00.1210020017200.23544@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346942780-8091-1-git-send-email-emilgoode@gmail.com> <20120906221252.1402ba50@neptune.home> <20120906201538.GK29092@google.com>
In-Reply-To: <20120906201538.GK29092@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tejun Heo <tj@kernel.org>
Cc: =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>, Emil Goode <emilgoode@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 6 Sep 2012, Tejun Heo wrote:

> > > Sparse is giving a warning:
> > > drivers/hid/hid-picolcd_fb.c:611:2: warning:
> > > 	‘flush_delayed_work_sync’ is deprecated
> > > 	(declared at include/linux/workqueue.h:454)
> > > 	[-Wdeprecated-declarations]
> > > 
> > > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> > 
> > Acked-by: Bruno Prémont <bonbons@linux-vserver.org>
> > 
> > This matches a patch by Tejun a few weeks ago which was partially
> > skipped in -next due to merge conflict with code split in picoLCD.
> > 
> > See http://comments.gmane.org/gmane.linux.kernel.next/23740
> > 
> > For the sake of proper bisectability, this should go in after
> > Tejun's workqueue changes (if needed at all depending on how merge
> > happens during pull by Linus).
> 
> Yeah, we either can ask Linus to fix it up during merge or send a
> separate patch afterwards.  In this case, I don't think it matters too
> much either way.  I tend to send out pull request fairly early in the
> merge window, I'll try to remember to poke Linus about the merge
> conflict.

Linus has just pulled from me, so if you could take care of this merge 
conflict, that'd be awesome.

Thanks,

-- 
Jiri Kosina
SUSE Labs
