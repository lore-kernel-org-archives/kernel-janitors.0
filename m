From: "David S. Miller" <davem@redhat.com>
Date: Tue, 28 Sep 2004 22:23:43 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 2/4] sbus/bbc_envctrl:
Message-Id: <20040928152343.35851be6.davem@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7376198820776676=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234647.GI1777@us.ibm.com>
In-Reply-To: <20040916234647.GI1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============7376198820776676==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Sep 2004 10:25:50 -0700
Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of
> schedule_timeout() to guarantee the task delays as expected. Change the
> units of POLL_INTERVAL to msecs to correspond to the msleep*() change.

Applied, thanks.

--===============7376198820776676==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7376198820776676==--
