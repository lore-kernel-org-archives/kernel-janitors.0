From: Greg KH <greg@kroah.com>
Date: Thu, 26 Jan 2006 00:34:45 +0000
Subject: Re: [KJ] [Patch 8/9] BUG_ON() Conversion in md/raid6main.c
Message-Id: <20060126003445.GA22316@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5796813944856144=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138233643.7232.45.camel@alice>
In-Reply-To: <1138233643.7232.45.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============5796813944856144==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 26, 2006 at 01:00:43AM +0100, Eric Sesterhenn / snakebyte wrote:
> hi,
> 
> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner and can better optimized away

gcc optimizes them away if BUG() is not defined, so this is not a true
statement.

thanks,

greg k-h

--===============5796813944856144==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5796813944856144==--
