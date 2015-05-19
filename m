From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 May 2015 15:20:19 +0000
Subject: Re: Breaking lines in function headers
Message-Id: <20150519152018.GC4150@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <555B3901.3090707@wimdewith.com>
In-Reply-To: <555B3901.3090707@wimdewith.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 19, 2015 at 05:14:49PM +0200, Wim de With wrote:
> On 19-5-2015 16:08, Dan Carpenter wrote:
> > First of gmail always marks your emails as spam so I only see the
> > replies.
> 
> That might be because of my SPF/DMARC configuration. I think it's fixed now.
> 
> > Both declaration formats are acceptable.
> > 
> > These days instead of "substantially to the right" most people
> > insist that they be aligned.  I think checkpatch.pl --strict enforces
> > this.
> 
> So as long as I use the same style consistently in a source file, I'm good?
> 

I'm slightly confused what you mean.  If you're asking if you should
redo the visorchipset.c patch then don't bother with that.  The original
code is fine.

regards,
dan carpenter 

