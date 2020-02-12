From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 12 Feb 2020 13:47:31 +0000
Subject: Re: [PATCH] HID: hiddev: Fix race in in hiddev_disconnect()
Message-Id: <nycvar.YFH.7.76.2002121447190.3144@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200115174628.zxpxbpa6bwspjajg@kili.mountain>
In-Reply-To: <20200115174628.zxpxbpa6bwspjajg@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, syzbot <syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, andreyknvl@google.com, syzkaller-bugs@googlegroups.com, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 15 Jan 2020, Dan Carpenter wrote:

> Syzbot reports that "hiddev" is used after it's free in hiddev_disconnect().
> The hiddev_disconnect() function sets "hiddev->exist = 0;" so
> hiddev_release() can free it as soon as we drop the "existancelock"
> lock.  This patch moves the mutex_unlock(&hiddev->existancelock) until
> after we have finished using it.
> 
> Reported-by: syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com
> Fixes: 7f77897ef2b6 ("HID: hiddev: fix potential use-after-free")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-5.6/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs
