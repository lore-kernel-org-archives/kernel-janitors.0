From: Matthew Martin <lihnucks@gmail.com>
Date: Thu, 16 Feb 2006 01:49:02 +0000
Subject: Re: [KJ] [PATCH] Fix warning in drivers/usb/media/ov511.c
Message-Id: <1140054543.7351.2.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22991908672534001=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139970072.25492.4.camel@localhost.localdomain>
In-Reply-To: <1139970072.25492.4.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============22991908672534001==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


> I find its usage more interesting.  Did the patch also address
> this part?  What does this do?
> 
> 	sensor_get_exposure(ov, &exp);
> 	return sprintf(buf, "%d\n", exp >> 8);
> 
> Does that always print 0?  (for exp >> 8)
> 

No, the patch did not address that.


--===============22991908672534001==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22991908672534001==--
