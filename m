From: matt mooney <mfm@muteddisk.com>
Date: Fri, 20 May 2011 18:51:34 +0000
Subject: Re: [PATCH 01/12] staging: usbip: replace usbip_u{dbg,err,info} and printk with dev_ and pr_
Message-Id: <20110520185134.GC83316@haskell.muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305866084.git.mfm@muteddisk.com> <2ecbb21cffe73acfe291c3c8e5626427ed5c5b43.1305866084.git.mfm@muteddisk.com> <20110520050101.GA7461@kroah.com> <BANLkTi=N9tAA_gZXgwDDTijyUuLysnQQEQ@mail.gmail.com> <20110520125359.GA9857@kroah.com>
In-Reply-To: <20110520125359.GA9857@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: matt mooney <mfmooney@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05:53 Fri 20 May     , Greg KH wrote:
> On Thu, May 19, 2011 at 10:25:25PM -0700, matt mooney wrote:
> > On Thu, May 19, 2011 at 10:01 PM, Greg KH <greg@kroah.com> wrote:
> > > On Thu, May 19, 2011 at 09:36:55PM -0700, matt mooney wrote:
> > >> This switches all of the usbip_u{dbg,err,info} and printk statements to
> > >> dev_<level>, if possible, or pr_<level> macros. And removes a few
> > >> unnecessary debug statements.
> > >>
> > >> Signed-off-by: matt mooney <mfm@muteddisk.com>
> > >
> > > I've already applied this one, right?
> > 
> > I don't think so. I never received a notification from your email bot ;)
> 
> Sorry, my bot went to sleep, you should have received it now.  If not,
> please let me know and I'll see what happened.

Your bot must still be asleep! The patch is in your tree, but I never received
an email; it could have been a problem on my end I.

-matt
