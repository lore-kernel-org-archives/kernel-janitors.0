From: "David S. Miller" <davem@davemloft.net>
Date: Wed, 09 Feb 2005 04:35:49 +0000
Subject: [KJ] Re: [PATCH 20/39] net/ip_vs_sync: replace schedule_timeout()
Message-Id: <20050208203549.4ede783b.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73646059032404754=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120235634.GI2600@us.ibm.com>
In-Reply-To: <20050120235634.GI2600@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: jmorris@redhat.com, netdev@oss.sgi.com, kaber@coreworks.de, yoshfuji@linux-ipv6.org, kuznet@ms2.inr.ac.ru, kernel-janitors@lists.osdl.org

--===============73646059032404754==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Jan 2005 15:56:34 -0800
Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> Please consider applying.
> 
> Description: Use ssleep() instead of schedule_timeout() to guarantee the task
> delays as expected. The first two replacements use TASK_INTERRUPTIBLE but do not
> check for signals, so ssleep() should be appropriate.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks Nishanth.

--===============73646059032404754==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73646059032404754==--
