From: Mark Fasheh <mark.fasheh@oracle.com>
Date: Fri, 27 Jan 2006 19:43:03 +0000
Subject: [KJ] Re: [Patch 7/12] BUG_ON() Conversion in fs/ocfs2/
Message-Id: <20060127194303.GH26470@ca-server1.us.oracle.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29093542331566269=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29093542331566269==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 27, 2006 at 10:32:52AM +0100, Eric Sesterhenn / snakebyte wrote:
> hi, 
> 
> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner, contains unlikely() and can better optimized away.
That looks good, thanks!
	--Mark

--
Mark Fasheh
Senior Software Developer, Oracle
mark.fasheh@oracle.com

--===============29093542331566269==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29093542331566269==--
