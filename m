From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 22:07:43 +0000
Subject: Re: [KJ] [PATCH] convert arlan wireless driver to module_param
Message-Id: <20041109220743.GB10211@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29522587372220976=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109213215.GC9496@dice.seeling33.de>
In-Reply-To: <20041109213215.GC9496@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org

--===============29522587372220976==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 09, 2004 at 01:41:14PM -0800, Randy.Dunlap wrote:
> Did you at least make sure that (e.g.)
> 
> int debug;
> 
> is in the source file *before*
> 
> module_param(debug, bool, 0644);
> 
> This wasn't required for MODULE_PARM() -- i.e., it's different
> for module_param().

Yes, I did. I always put variable declarations first, and parameter
declarations shortly after.

stefan
-- 
Give me a fish and I will eat today.
Teach me to fish and I will eat forever.

--===============29522587372220976==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29522587372220976==--
