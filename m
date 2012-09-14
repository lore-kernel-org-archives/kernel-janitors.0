From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Sep 2012 08:11:13 +0000
Subject: Re: [patch 1/2] Staging: silicom: add some range checks to proc functions
Message-Id: <20120914081113.GD13767@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120914065600.GF11886@elgon.mountain>
In-Reply-To: <20120914065600.GF11886@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 14, 2012 at 10:08:30AM +0300, Dan Carpenter wrote:
> On Fri, Sep 14, 2012 at 09:56:00AM +0300, Dan Carpenter wrote:
> > If you tried to cat more than 255 characters (the last character is for
> > the terminator) to these proc files then it would corrupt kernel memory.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Actually sorry for this, I meant to check first before sending.  Is
> it possible to do a zero size write to a proc file?  In sysfs it
> isn't but I'm not sure about proc.
> 
> I may need to redo this.

I'm just busy having a conversation with myself.  This patch is
correct.  Please apply it after all.

regards,
dan carpenter

