From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 20 Sep 2005 21:50:10 +0000
Subject: Re: [KJ] [PATCH] specialix: eliminate deprecated check_region() call
Message-Id: <20050920215010.GA22839@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77411406338904909=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <25465C7B-EEA6-4184-869C-A43AB6079D2F@gmail.com>
In-Reply-To: <25465C7B-EEA6-4184-869C-A43AB6079D2F@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============77411406338904909==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 20, 2005 at 02:10:11PM -0700, Jesse Millan wrote:
> >* request_region() requires release_region() on all exit paths.
> >* You've changed function that "checks" to function that  
> >"requests", so
> >  you have to release_region() on all exit paths after
> >  sx_check_io_range().
> >* After fixing previous (*), name "sx_check_io_range" is still
> >  misleading. Now it requests, not checks!
> >* Changing name to sx_request_io_range() doesn't work because the  
> >driver
> >  already have one. ;-) BTW, request_region() in it is unchecked  
> >probably
> >  due to "if check_region() said OK, request_region() can't fail".
> >
> >So, simple renaming is almost certainly wrong.
> >
> >
> 
> Thanks Alexey!
> 
> I'll brush myself off and try again :-)

Very good. Just don't forget to look _near_ the code you're patching.


--===============77411406338904909==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77411406338904909==--
