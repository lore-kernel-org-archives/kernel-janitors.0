From: Greg KH <greg@kroah.com>
Date: Tue, 21 Sep 2004 23:49:01 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 2/2] i2c/i2c-mpc: replace
Message-Id: <20040921234901.GB17372@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40688322136761146=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234647.GI1777@us.ibm.com>
In-Reply-To: <20040916234647.GI1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============40688322136761146==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 16, 2004 at 04:40:31PM -0700, Nishanth Aravamudan wrote:
> Previous patch won't compile. Any comments would (still) be appreciated.
> 
> Description: Properly orders set_current_state() and add_wait_queue().
> Uses msleep_interruptible() in place of schedule_timeout() to guarantee
> the task delays as expected. Uses set_current_state() instead of direct
> assignment of current->state.


Applied, thanks.

greg k-h

--===============40688322136761146==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40688322136761146==--
