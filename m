From: a.othieno@bluewin.ch (Arthur Othieno)
Date: Fri, 07 Oct 2005 22:19:25 +0000
Subject: Re: [KJ] rfc about an uncommented string
Message-Id: <20051007221925.GA11630@mars>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34281868581398811=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050809141147.GB4603@voyager>
In-Reply-To: <20050809141147.GB4603@voyager>
To: kernel-janitors@vger.kernel.org

--===============34281868581398811==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 09, 2005 at 07:51:21PM +0200, Carlo Perassi wrote:
> > this will break if CONFIG_SERIO_I8042 is set and i guess intentionaly.
> 
> I think so but I guess it is not the standard way to let the user know
> CONFIG_SERIO_I8042 is broken.
> 
> > who checked that in ?  perhaps the mips ppl know about it.
> 
> What do you suggest to do?
> Thank you.

Bounce it to <linux-mips@linux-mips.org>? The delta between the mainline
and linux-mips git trees is quite huge, and that particular piece of code
is still present in both..

	Arthur

--===============34281868581398811==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34281868581398811==--
