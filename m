From: "David S. Miller" <davem@redhat.com>
Date: Tue, 28 Sep 2004 22:24:36 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 3/4] sbus/bbc_i2c: replace
Message-Id: <20040928152436.5bb80256.davem@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0063636944558682629=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41493C3D.6090403@tungstengraphics.com>
In-Reply-To: <41493C3D.6090403@tungstengraphics.com>
To: kernel-janitors@vger.kernel.org

--===============0063636944558682629==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Sep 2004 10:26:56 -0700
Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of
> schedule_timeout() to guarantee the task delays as expected. Also use
> set_current_state() instead of direct assignment of current->state.

Also applied, thanks.

--===============0063636944558682629==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0063636944558682629==--
