From: Felipe W Damasio <felipewd@terra.com.br>
Date: Wed, 28 Apr 2004 21:13:09 +0000
Subject: Re: [Kernel-janitors] [PATCH] Replaces yield() with schedule_timeout()
Message-Id: <40901E65.5030904@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71879197406144946=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <408AB344.6010000@acm.org>
In-Reply-To: <408AB344.6010000@acm.org>
To: kernel-janitors@vger.kernel.org

--===============71879197406144946==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

maximilian attems wrote:
> jeff garzik prefers schedule_timeout(1) in the case of the sis900,
> "that's IMO closer to the intention.."

	Sounds fair, since he's the one whom chooses which patches get in ;)

	Anyway, we still need set_current_state before calling schedule_timeout.

	Cheers,

Felipe

--===============71879197406144946==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71879197406144946==--
