From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Wed, 28 Jul 2004 00:25:17 +0000
Subject: [Kernel-janitors] Re: [PATCH] serial/pmac_zilog: replace
Message-Id: <1090974316.18236.16.camel@gaston>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65047379672964145=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65047379672964145==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2004-07-27 at 19:01, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to 
> guarantee the task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Looks good to me

Ben.



--===============65047379672964145==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65047379672964145==--
