From: Domen Puncer <domen@coderock.org>
Date: Wed, 29 Sep 2004 16:10:06 +0000
Subject: [Kernel-janitors] Re: sbus/aurora: replace schedule_timeout() with
Message-Id: <20040929161006.GA3599@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61271326944120519=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61271326944120519==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/09/04 10:24 -0700, Nishanth Aravamudan wrote:
> -			current->state = TASK_INTERRUPTIBLE;
> -			schedule_timeout(port->close_delay);
> +			msleep_interruptible(port->close_delay);

I think you forgot jiffies_to_msecs here.


	Domen

--===============61271326944120519==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61271326944120519==--
