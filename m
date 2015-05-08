From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 May 2015 12:18:45 +0000
Subject: Re: [patch v2] virtio_console: silence a static checker warning
Message-Id: <20150508121844.GE16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150508091624.GS14154@mwanda> <554C8221.9070304@bfs.de>
	<20150508095616.GB5527@grmbl.mre> <554C9A52.4030707@bfs.de>
In-Reply-To: <554C9A52.4030707@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Amit Shah <amit.shah@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org

On Fri, May 08, 2015 at 01:13:22PM +0200, walter harms wrote:
> The basic idea was to limit the space, having leading zeros is my idea because
> i found this more convenient in the past. Using something like "%3u" will give
> static checkers a chance to detect the required max. space.

How are you calculating the %3?

The max for "id" is currently 31.  To be honest, I'm not certain the max
for ->index.  It's something in qemu but I'm not sure what.  Who is
going to keep it updated?

The %3 is sort of meaningless.  The lower levels of the code just ignore
it don't they?

regards,
dan carpenter

