From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Jul 2012 12:45:51 +0000
Subject: Re: automated warning notifications
Message-Id: <20120702124551.GD4519@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120614172523.GB4400@mwanda>
 <20120615014835.GA5695@localhost>
In-Reply-To: <20120615014835.GA5695@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <wfg@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 15, 2012 at 09:48:35AM +0800, Fengguang Wu wrote:
> Hi Dan,
> 
> On Thu, Jun 14, 2012 at 08:25:23PM +0300, Dan Carpenter wrote:
> > Hi Fengguang,
> > 
> > I also check new static checker warnings and sometimes email people.
> 
> That would be nice!
> 
> > I wonder if we are duplicating each others work.  For example, did
> > you send an email asking about the following Sparse warning:
> > 
> > sound/soc/codecs/ab8500-codec.c:1959:53: warning: cast truncates bits from constant value (1013 becomes 13)
> 
> I did try sending out sparse warnings to people, some time ago...

Apparently you have started up again?  We're starting to trod on
each other's toes and people are getting annoyed with me because I
am reporting them after you...  :/

Randy has suggested that we send these automated messages to
kernel-janitors.  I don't know how the other people on kernel
janitors feel about this but I would be fine with it.

regards,
dan carpenter

