From: "Steven N. Hirsch" <shirsch@adelphia.net>
Date: Fri, 09 Jul 2004 00:07:03 +0000
Subject: [Kernel-janitors] Re: sb1000.c::nicedelay() (msleep)
Message-Id: <Pine.LNX.4.58.0407082005410.5353@monarch.fast.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8130666102125188=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8130666102125188==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 8 Jul 2004, Nishanth Aravamudan wrote:

> So, this function (drivers/net/sb1000.c::nicedelay()) takes as parameter some
> value in usecs (which is also the name of the parameter). Then, it sleeps for
> 1 second (schedule_timeout(HZ)) regardless of the parameter. Is this desired?
> If so, I will replace the calls (all 3 of them) with msleep(). Or, should the
> passed in values (60000, 30000 and 200000) actually be being used and not
> ignored? Thanks.

Are these cards still being used?  I switched to 2-way cable almost (3) 
years ago and haven't looked back.  



--===============8130666102125188==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8130666102125188==--
