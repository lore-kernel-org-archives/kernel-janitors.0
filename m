From: "Ravinandan Arakali" <ravinandan.arakali@neterion.com>
Date: Wed, 16 Feb 2005 00:18:42 +0000
Subject: [KJ] RE: [PATCH] net/s2io: replace schedule_timeout() with msleep()
Message-Id: <002101c513bd$12b78190$4510100a@pc.s2io.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95583869731890836=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <001101c51085$7fa39950$4510100a@pc.s2io.com>
In-Reply-To: <001101c51085$7fa39950$4510100a@pc.s2io.com>
To: kernel-janitors@vger.kernel.org

--===============95583869731890836==
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff,
I have just now sent you the below mentioned patch(It has the
subject Multicast fix). Although the problem initially manifested
as "IPv6 ping not working", root cause boiled down to driver 
incorrectly programming multicast addresses into the NIC's Rx filter.

BTW, the patch has been generated on top of Nishanth's patch.

Thanks,
Ravi


-----Original Message-----
From: Jeff Garzik [mailto:jgarzik@pobox.com]
Sent: Friday, February 11, 2005 2:14 PM
To: Ravinandan Arakali
Cc: 'Nishanth Aravamudan'; akpm@osdl.org; linux-net@vger.kernel.org;
'Raghavendra Koushik'; kernel-janitors@lists.osdl.org;
leonid.grossman@neterion.com
Subject: Re: [PATCH] net/s2io: replace schedule_timeout() with msleep()


Ravinandan Arakali wrote:
> Jeff,
> I have another small patch to address "IPv6 ping problem". Do you
> want me to wait till the below patch from Nishanth is reviewed and
> merged by you or should I just generate the IPv6 patch on top of
> below one ?

His patch looks good, and I'll apply it.

Please generate your patches on top of Nishanth's patch.

Thanks,

	Jeff





--===============95583869731890836==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95583869731890836==--
