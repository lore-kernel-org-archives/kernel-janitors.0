From: Greg KH <greg@kroah.com>
Date: Tue, 19 Oct 2004 22:28:01 +0000
Subject: [KJ] Re: [PATCH] i2c/i2c-ibm_iic: replace schedule_timeout() with
Message-Id: <20041019222800.GE9521@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77725093131139134=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041014183520.GG2214@us.ibm.com>
In-Reply-To: <20041014183520.GG2214@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============77725093131139134==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 14, 2004 at 11:35:20AM -0700, Nishanth Aravamudan wrote:
> Forgot the Signed-off-by: line, sorry.
> 
> 
> Any comments would (still) be appreciated.
> 
> Description: Use msleep_interruptible() instead of schedule_timeout() to
> guarantee the task delays as expected. Remove the unnecessary
> set_current_state() following the if, as schedule_timeout() [and thus,
> mlseep_interruptible()] is guaranteed to return in TASK_RUNNING.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h


--===============77725093131139134==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77725093131139134==--
