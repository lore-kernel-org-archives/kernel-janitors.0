From: Greg KH <greg@kroah.com>
Date: Mon, 02 Aug 2004 23:12:44 +0000
Subject: Re: [Kernel-janitors] [PATCH] i2c-nforce2: replace schedule_timeout()
Message-Id: <20040802231244.GF15751@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89709280805026603=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89709280805026603==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2004 at 10:12:55PM +0000, Nishanth Aravamudan wrote:
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


--===============89709280805026603==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89709280805026603==--
