From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:11:23 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 17/17] media/zr36120:
Message-Id: <20040920221123.GY2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24937134853723153=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============24937134853723153==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 03:07:07PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use ssleep() instead of schedule_timeout()
> to guarantee the task delays as expected.

Sorry, clearly the patch uses msleep() not ssleep() [Subject line is
correct].

-Nish

--===============24937134853723153==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24937134853723153==--
