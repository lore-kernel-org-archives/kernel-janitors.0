From: Felipe W Damasio <felipewd@terra.com.br>
Date: Mon, 19 Apr 2004 17:13:55 +0000
Subject: Re: [Kernel-janitors] [patch] use schedule() instead of
Message-Id: <408408D3.9080509@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18346077785983761=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040419165742.GD1393@sputnik.stro.at>
In-Reply-To: <20040419165742.GD1393@sputnik.stro.at>
To: kernel-janitors@vger.kernel.org

--===============18346077785983761==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

	Max,

maximilian attems wrote:
> yield() removes process from active array into expired array,
> better just preempt with schedule().

	What we wanted to do here is just yield the CPU for a bit (not to give 
it up for a long time, like the 2.6 yield).

> as belows timeout is set to 5 seconds, 

	Eh?

> schedule() may be better than to use a schedule_timeout(1).

	Perhaps:

set_current_state (TASK_UNINTERRUPTIBLE);
schedule_timeout (HZ/100);

	?

Felipe

--===============18346077785983761==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18346077785983761==--
