From: Dean Nelson <dcn@sgi.com>
Date: Mon, 11 Jul 2005 12:52:56 +0000
Subject: [KJ] Re: [PATCH 6/14] ia64/sn: use msleep_interruptible() instead
Message-Id: <20050711125256.GA26049@sgi.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============036930586597763604=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============036930586597763604==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 08, 2005 at 05:10:22PM -0700, Nishanth Aravamudan wrote:
> From: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> Description: Replace schedule_timeout() with msleep_interruptible() to
> guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Your changes to arch/ia64/sn/kernel/xpc_main.c looked good to me. Thanks.


--===============036930586597763604==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============036930586597763604==--
