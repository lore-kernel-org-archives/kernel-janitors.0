From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Tue, 27 Jul 2004 14:48:15 +0000
Subject: [Kernel-janitors] Re: [PATCH] message/i2o_core: replace
Message-Id: <1090939693.25874.4.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11626213265083241=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============11626213265083241==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Maw, 2004-07-27 at 00:22, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list.
> 
> Thanks,
> Nish
> 
> Applys-to: 2.6.7
> 
> Description: Uses msleep() instead of schedule_timeout() so the task
> is guaranteed to delay the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Looks good to me, please forward to Linus to apply.


--===============11626213265083241==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11626213265083241==--
