From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 20 Apr 2004 19:19:48 +0000
Subject: Re: [Kernel-janitors] [patch] use schedule() instead of
Message-Id: <20040420191948.GD938@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79413333222948612=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040419165742.GD1393@sputnik.stro.at>
In-Reply-To: <20040419165742.GD1393@sputnik.stro.at>
To: kernel-janitors@vger.kernel.org

--===============79413333222948612==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


On Mon, 19 Apr 2004, Felipe W Damasio wrote:

> >yield() removes process from active array into expired array,
> >better just preempt with schedule().
> 
> 	What we wanted to do here is just yield the CPU for a bit (not to 
> 	give it up for a long time, like the 2.6 yield).

ok i'll rediff and test tomorrow morning.

> 
> >as belows timeout is set to 5 seconds, 
> 
> 	Eh?

well sis900.c sets 
	unsigned long timeout = jiffies + 5 * HZ;

there for i thought that this hole issue "while(poll_bit)"
wasn't that timing sensitive.
thanks for your propososal.

a++ maks


--===============79413333222948612==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79413333222948612==--
