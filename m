From: Jeff Garzik <jgarzik@pobox.com>
Date: Thu, 17 Feb 2005 23:29:09 +0000
Subject: [KJ] Re: [PATCH] net/s2io: replace schedule_timeout() with msleep()
Message-Id: <421528C5.3060001@pobox.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49646153396994785=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <001101c51085$7fa39950$4510100a@pc.s2io.com>
In-Reply-To: <001101c51085$7fa39950$4510100a@pc.s2io.com>
To: kernel-janitors@vger.kernel.org

--===============49646153396994785==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Ravinandan Arakali wrote:
> Jeff,
> I have just now sent you the below mentioned patch(It has the
> subject Multicast fix). Although the problem initially manifested
> as "IPv6 ping not working", root cause boiled down to driver 
> incorrectly programming multicast addresses into the NIC's Rx filter.

I received this message, but never received your path.  Can you resend?

	Jeff




--===============49646153396994785==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49646153396994785==--
