From: Greg KH <greg@kroah.com>
Date: Fri, 20 May 2005 05:09:22 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 error incomplete array element type
Message-Id: <20050520050922.GA10292@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50827604500794066=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <428D6C84.8070708@cs.pdx.edu>
In-Reply-To: <428D6C84.8070708@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============50827604500794066==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 19, 2005 at 09:50:12PM -0700, Jesse Millan wrote:
> This patch is in regards to fixing the gcc 4 warnings. It actually fixes
> a gcc 4 error by changing
> 
> struct i2c_msg msg[]
> 
> to
> 
> struct i2c_msg *msg
> 
> which is what gcc4 wants to see from now on.
> 
> F.Y.I I applied the kj patch, and this error has not been fixed as of
> yet. However, I found that this was changed in Andrew Morton mm4 patch.

This is already fixed in the 2.6.12-rc4 kernel, correct?

thanks,

greg k-h

--===============50827604500794066==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50827604500794066==--
