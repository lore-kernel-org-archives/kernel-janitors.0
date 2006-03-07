From: Bernd Petrovitsch <bernd@firmix.at>
Date: Tue, 07 Mar 2006 13:40:25 +0000
Subject: Re: [KJ][Patch] change for to while(1) in 3c515.c
Message-Id: <1141738825.28598.23.camel@tara.firmix.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34519623233917507=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141718301.8347.16.camel@localhost.localdomain>
In-Reply-To: <1141718301.8347.16.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============34519623233917507==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-03-07 at 18:58 +1100, Darren Jenkins\ wrote:
> G'day list,
> 
> from http://linuxicc.sourceforge.net/
> 
> ICC complains about: Pointless comparison of unsigned integer with zero.
> @ line 1028 of 3c515.c
> 
> 
> 1007                 unsigned long flags, i;
> 
> 
> 1028                 for (i = 20; i >= 0; i--)
> 1029                         if ((inw(ioaddr + EL3_STATUS) & CmdInProgress) == 0) 
> 1030                                 break;
> 
> This makes the 'for' loop effectively 'while (1)' as i >= 0 cant fail.
> This seems like a reasonable objective as the loop seems to be waiting for a command to finish.

Yes, but not endless. So s/>=/>/ should be more in spirit of the old
solution.

> As it is the current behaviour, and to make the code more readable, the patch below replaces the 'for' with a 'while(1)'
> and removes the 'unsigned long i', as it is no longer used.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


--===============34519623233917507==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34519623233917507==--
