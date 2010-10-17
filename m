From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 17 Oct 2010 17:50:06 +0000
Subject: Re: [PATCH 6/8] char: synclink: fix information leak to userland
Message-Id: <20101017175006.GA14278@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287326493-8134-1-git-send-email-segooon@gmail.com>
 <4CBB177C.9050007@suse.cz>
 <20101017153839.GA11029@albatros>
 <20101017173609.GS6614@bicker>
In-Reply-To: <20101017173609.GS6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Jiri Slaby <jslaby@suse.cz>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

On Sun, Oct 17, 2010 at 19:36 +0200, Dan Carpenter wrote:
> On Sun, Oct 17, 2010 at 07:38:39PM +0400, Vasiliy Kulikov wrote:
> > On Sun, Oct 17, 2010 at 17:34 +0200, Jiri Slaby wrote:
> > > On 10/17/2010 04:41 PM, Vasiliy Kulikov wrote:
> > > > Structure new_line is copied to userland with some padding fields unitialized.
> > > > It leads to leaking of stack memory.
> > > 
> > > I think your tool has a bug. I must admit I fail to see the padding
> > > which would cause leaks. Could you elaborate?
> > 
> > I didn't use any tool except "grep copy_to_user" :)
> > 
> 
> It seems like you should be able to use pahole to make a list of
> structs with padding and then a checker script to find places where
> information is leaked.

Not all of these patches fix only padding zeroing, some of them fix
uninitialized fields.  One struct has partly initialized array.

> Also someone complained to me about when I added a memset() in a fast
> path.

All these cases are ioctl() handlers or similar.  I don't think ioctl()
should be so fast to become significantly slower with single memset().

> The thought was that it might be faster to just initialize it
> instead like:
> 
> 	struct foo bar = {};
> 
> In my case just using the initializer made the code cleaner so I did it,
> but neither of us actually benchmarked it.
> 
> regards,
> dan carpenter
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Thanks,

-- 
Vasiliy
