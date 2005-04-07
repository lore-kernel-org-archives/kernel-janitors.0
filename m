From: Ingo Molnar <mingo@elte.hu>
Date: Thu, 07 Apr 2005 06:36:58 +0000
Subject: [KJ] Re: [PATCH] kernel/softlockup: fix usage of
Message-Id: <20050407063658.GA26297@elte.hu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50448242345063798=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50448242345063798==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> Description: Jiffies are incorrectly being passed into
> msleep_interruptible(), which expects milliseconds. Also, the state does
> not need to be set before calling msleep_interruptible(), as it will
> take care of it.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

thanks!

Acked-by: Ingo Molnar <mingo@elte.hu>

	Ingo

--===============50448242345063798==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50448242345063798==--
