From: Roger Luethi <rl@hellgate.ch>
Date: Tue, 16 Nov 2004 19:38:12 +0000
Subject: Re: [KJ] [patch 2/2] net/via-rhine: convert to new pio/mmio api
Message-Id: <20041116193812.GC16606@k3.hellgate.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52140466626146642=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041116190051.GC8698@nd47.coderock.org>
In-Reply-To: <20041116190051.GC8698@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============52140466626146642==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 16 Nov 2004 20:00:51 +0100, Domen Puncer wrote:
> Attempt to convert this driver to commom pio/mmio api.
> Compile and run testet for pio and mmio cases.
> 
> Feedback, please.

ACK. This patch is very welcome (assuming it works which I haven't
tested). You may want to send it to Jeff Garzik so he can add it to
the netdev queue.

Roger

--===============52140466626146642==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52140466626146642==--
