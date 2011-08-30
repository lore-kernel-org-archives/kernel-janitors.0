From: Dan Carpenter <error27@gmail.com>
Date: Tue, 30 Aug 2011 19:52:10 +0000
Subject: Re: Where can i find a task?
Message-Id: <20110830195210.GZ3705@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4E4EA626.8070204@lxsameer.com>
In-Reply-To: <4E4EA626.8070204@lxsameer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 19, 2011 at 10:36:30PM +0430, Sameer Rahmani wrote:
> Hi there.
> 
> I'm new to this ML, i'm looking for some cheap tasks to begin with,
> where can i find some?

Here is a task:

grep -n -w printk drivers/ -R | egrep 'KERN_\w+ "\\n"' | grep -v CONT 

These should probably all be using KERN_CONT (obviously you should
check them and look around for other bugs as well).  There are 38
patches worth of bugs there.

regards,
dan carpenter
