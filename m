From: Greg KH <greg@kroah.com>
Date: Mon, 02 Aug 2004 22:41:50 +0000
Subject: [Kernel-janitors] Re: [PATCH] hotplug/ibmphp_hpc: replace
Message-Id: <20040802224150.GB15303@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61261735524823313=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727214442.GS3471@us.ibm.com>
In-Reply-To: <20040727214442.GS3471@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============61261735524823313==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 02:47:22PM -0700, Nishanth Aravamudan wrote:
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

--===============61261735524823313==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61261735524823313==--
