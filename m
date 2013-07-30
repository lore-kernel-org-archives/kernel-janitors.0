From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
Date: Tue, 30 Jul 2013 09:35:21 +0000
Subject: Re: What version should I be patching against?
Message-Id: <m3k3k85r1i.fsf@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51F74061.107@gmail.com>
In-Reply-To: <51F74061.107@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Wow...  Yes.  That information is totally out of date.  Do patches
> against the daily linux-next.  Don't do them against mainline.

these commands would be useful to add

$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
$ cd linux
$ git remote add linux-next git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
$ git fetch linux-next
$ git fetch --tags linux-next
... # later on
$ git remote update
...

-- 
Nikola
