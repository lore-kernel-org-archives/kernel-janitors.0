From: Ben Collins <bcollins@debian.org>
Date: Fri, 23 Jul 2004 01:53:05 +0000
Subject: Re: [Kernel-janitors] [PATCH] ieee/sbp2: replace schedule_timeout()
Message-Id: <20040723015305.GD26547@phunnypharm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88634677395137818=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040722223527.GV2165@us.ibm.com>
In-Reply-To: <20040722223527.GV2165@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============88634677395137818==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2004 at 02:04:03AM +0100, Matthew Wilcox wrote:
> On Thu, Jul 22, 2004 at 07:26:53PM -0400, Ben Collins wrote:
> > Doesn't msleep() block? If so, that's not what we want at all. We want
> > other things to happen during that time (like maybe catch a bus reset).
> 
> No, msleep sleeps (as its name suggests).  The code that implements it is:

In that case, I've got a few places that could use msleep().

Thanks.

-- 
Debian     - http://www.debian.org/
Linux 1394 - http://www.linux1394.org/
Subversion - http://subversion.tigris.org/
WatchGuard - http://www.watchguard.com/

--===============88634677395137818==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88634677395137818==--
