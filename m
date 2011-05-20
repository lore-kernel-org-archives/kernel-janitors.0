From: Greg KH <greg@kroah.com>
Date: Fri, 20 May 2011 12:53:59 +0000
Subject: Re: [PATCH 01/12] staging: usbip: replace usbip_u{dbg,err,info} and
Message-Id: <20110520125359.GA9857@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305866084.git.mfm@muteddisk.com>
 <2ecbb21cffe73acfe291c3c8e5626427ed5c5b43.1305866084.git.mfm@muteddisk.com>
 <20110520050101.GA7461@kroah.com>
 <BANLkTi=N9tAA_gZXgwDDTijyUuLysnQQEQ@mail.gmail.com>
In-Reply-To: <BANLkTi=N9tAA_gZXgwDDTijyUuLysnQQEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfmooney@gmail.com>
Cc: matt mooney <mfm@muteddisk.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 19, 2011 at 10:25:25PM -0700, matt mooney wrote:
> On Thu, May 19, 2011 at 10:01 PM, Greg KH <greg@kroah.com> wrote:
> > On Thu, May 19, 2011 at 09:36:55PM -0700, matt mooney wrote:
> >> This switches all of the usbip_u{dbg,err,info} and printk statements to
> >> dev_<level>, if possible, or pr_<level> macros. And removes a few
> >> unnecessary debug statements.
> >>
> >> Signed-off-by: matt mooney <mfm@muteddisk.com>
> >
> > I've already applied this one, right?
> 
> I don't think so. I never received a notification from your email bot ;)

Sorry, my bot went to sleep, you should have received it now.  If not,
please let me know and I'll see what happened.

thanks,

greg k-h
