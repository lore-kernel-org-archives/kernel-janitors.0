From: Greg KH <greg@kroah.com>
Date: Mon, 02 Aug 2004 21:26:21 +0000
Subject: [Kernel-janitors] Re: [PATCH] usb/auerswald: replace
Message-Id: <20040802212621.GC14283@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60200468878134683=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407282023.23796.wolfgang@iksw-muees.de>
In-Reply-To: <200407282023.23796.wolfgang@iksw-muees.de>
To: kernel-janitors@vger.kernel.org

--===============60200468878134683==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 04:12:36PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to 
> guarantee the task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h

--===============60200468878134683==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60200468878134683==--
