From: "David S. Miller" <davem@davemloft.net>
Date: Wed, 09 Feb 2005 00:52:09 +0000
Subject: [KJ] Re: [PATCH 19/39] net/dev: replace schedule_timeout() with
Message-Id: <20050208165209.0481fb9d.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13954488894382244=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120235352.GH2600@us.ibm.com>
In-Reply-To: <20050120235352.GH2600@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: netdev@oss.sgi.com, linux-net@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============13954488894382244==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Jan 2005 15:53:52 -0800
Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> Description: Use msleep() instead of schedule_timeout() to guarantee the task
> delays as expected. The current code uses TASK_INTERRUPTIBLE, but does not
> respond to signals, so msleep() should be ok.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks Nishanth.

--===============13954488894382244==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13954488894382244==--
