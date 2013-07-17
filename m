From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 17 Jul 2013 12:20:16 +0000
Subject: Re: [patch] Squashfs: sanity check information from disk
Message-Id: <20130717122015.GA5636@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130715161058.GA23687@elgon.mountain>
 <CAB3wodeBWvgF9oKb9OVXNABiafhvLticB=x8s=R81RRv9Yd6kA@mail.gmail.com>
In-Reply-To: <CAB3wodeBWvgF9oKb9OVXNABiafhvLticB=x8s=R81RRv9Yd6kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip.lougher@gmail.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 17, 2013 at 05:20:31AM +0100, Phillip Lougher wrote:
> On 15 July 2013 17:17, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > We read the size of the name from the disk, but a larger name than
> > expected would cause memory corruption.
> 
> Thanks for the patch, it's queued for the next merge window. There's
> one mistake with the patch, but I can fix it when it's applied, or you
> can send a revised patch (see later).

I wouldn't call it a "mistake", it's just a difference in prefered
styles.  The two statements:

	if (size >= SQUASHFS_NAME_LEN + 1) {
and
	if (size > SQUASHFS_NAME_LEN) {

These statements are equivalent.  But I can change it, no worries.

regards,
dan carpenter

