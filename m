From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 19 Aug 2005 23:46:45 +0000
Subject: Re: [KJ] [PATCH] mtd: remove compatmac.h
Message-Id: <20050819234645.GA5896@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28982019996908548=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050819205632.GA5211@mipter.zuzino.mipt.ru>
In-Reply-To: <20050819205632.GA5211@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============28982019996908548==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 19, 2005 at 11:15:17PM +0200, Adrian Bunk wrote:
> On Sat, Aug 20, 2005 at 12:56:32AM +0400, Alexey Dobriyan wrote:
> 
> > File is effectively empty.
> >...
> 
> That's expected.
> 
> The trick is that it's non-empty in 2.4

Take assorted snippets from version.h, compiler.h, wait.h, uaccess.h,
module.h, byteorder.h, types.h, spinlock.h, kernel.h, blkdev.h and
others, mix them, multiply by LINUX_VERSION_CODE [1] ifdeffery [2], add
some bugs(?) going to happen [3], mix once again and you'll get
compatmac.h from 2.4. :-\ Just like any other compat header this one is
mess.

> and provides some code for letting 2.6 code running on 2.4 .
> 
> As long as the MTD maintainer wants to share the code between 2.4 and 
> 2.6 your patch makes his life much harder.

As long as patches don't include pretty localized headers in context it
shouldn't.

	Alexey

[1] At least thanks for this:

	#if LINUX_VERSION_CODE < KERNEL_VERSION(2,0,0)
	# error "This kernel is too old: not supported by this file"
	#endif

[2] Correct spelling is "ifdeffery", right? English is not my native
    language, that's why I'm asking.

[3] #define time_after(t1,t2) (((long)t1-t2) > 0)


--===============28982019996908548==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28982019996908548==--
