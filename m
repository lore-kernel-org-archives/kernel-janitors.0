From: Greg KH <greg@kroah.com>
Date: Tue, 27 Jul 2004 22:10:59 +0000
Subject: [Kernel-janitors] Re: [PATCH] pci/cpci_hotplug_core: replace
Message-Id: <20040727221059.GA21125@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89781983130300214=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0407271755360.26002@rancor.yyz.somanetworks.com>
In-Reply-To: <Pine.LNX.4.58.0407271755360.26002@rancor.yyz.somanetworks.com>
To: kernel-janitors@vger.kernel.org

--===============89781983130300214==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 06:04:19PM -0400, Scott Murray wrote:
> On Tue, 27 Jul 2004, Nishanth Aravamudan wrote:
> 
> > I would appreciate any comments from the janitors list. This is one (of
> > many) cases where I made a decision about replacing
> > 
> > set_current_state(TASK_INTERRUPTIBLE);
> > schedule_timeout(some_time);
> > 
> > with
> > 
> > msleep(jiffies_to_msecs(some_time));
> > 
> > msleep() is not exactly the same as the previous code, but I only did
> > this replacement where I thought long delays were *desired*. If this is
> > not the case here, then just disregard this patch. 
> 
> msleep sets TASK_UNINTERRUPTIBLE and not TASK_INTERRUPTIBLE, which I think 
> will work okay in this instance, but am not actually sure.  I'm leaving 
> for two weeks vacation tomorrow, so I'm not in a position to test this out 
> at the moment.  Greg, can you comment on the correctness of this?

Yes, this should be safe at this point in time.  I'll apply the patch in
my next round of PCI patches.

thanks,

greg k-h

--===============89781983130300214==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89781983130300214==--
