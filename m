From: Greg KH <greg@kroah.com>
Date: Mon, 02 Aug 2004 22:42:25 +0000
Subject: [Kernel-janitors] Re: [PATCH] pci/cpci_hotplug_core: replace
Message-Id: <20040802224225.GE15303@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28451505693487644=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0407271755360.26002@rancor.yyz.somanetworks.com>
In-Reply-To: <Pine.LNX.4.58.0407271755360.26002@rancor.yyz.somanetworks.com>
To: kernel-janitors@vger.kernel.org

--===============28451505693487644==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 02:14:12PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch. 

Applied, thanks.

greg k-h

--===============28451505693487644==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28451505693487644==--
