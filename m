From: Greg KH <greg@kroah.com>
Date: Thu, 16 Sep 2004 14:57:21 +0000
Subject: Re: [Kernel-janitors] [PATCH 4/5] atm/idt77252: replace
Message-Id: <20040916145721.GA343@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35557591935069155=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040915181826.GE4363@us.ibm.com>
In-Reply-To: <20040915181826.GE4363@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============35557591935069155==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 16, 2004 at 07:46:50AM -0700, Randy.Dunlap wrote:
> 
> HZ may vary between different architectures. was that the autors real
> intend ?
> 
> -		timeout = 5 * HZ;
> +		timeout = 5 * 1000;

msleep* is in milliseconds, not jiffies, so the change is correct.

thanks,

greg k-h

--===============35557591935069155==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35557591935069155==--
