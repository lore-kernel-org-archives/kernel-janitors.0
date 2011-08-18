From: Dan Carpenter <error27@gmail.com>
Date: Thu, 18 Aug 2011 16:21:44 +0000
Subject: Re: [patch 1/2 -next] hid-lg4ff: silence sparse complaint
Message-Id: <20110818162144.GD21927@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110818134226.GA21927@shale.localdomain>
 <CAMvewQJ=6-3LgDwAEgJ6TaQSBWiSC5ZTb-14V60ZN0Lh2TYbAQ@mail.gmail.com>
In-Reply-To: <CAMvewQJ=6-3LgDwAEgJ6TaQSBWiSC5ZTb-14V60ZN0Lh2TYbAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zic Rim <zicrim@gmail.com>
Cc: Jiri Kosina <jkosina@suse.cz>, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 18, 2011 at 07:50:45PM +0530, Zic Rim wrote:
> > device_attribute *attr, char *buf)
> >  {
> > -       struct lg4ff_device_entry *entry = 0;
> > +       struct lg4ff_device_entry *uninitialized_var(entry);
> >
> 
> I think this is better      struct lg4ff_device_entry *entry = NULL ;
> 

We only have the initialization to silence a gcc warning.  My way is
more explicit.  If we set entry = NULL then other static analysis
tools complain about a potential NULL dereference.

regards,
dan carpenter

