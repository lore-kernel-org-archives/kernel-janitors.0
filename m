From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 24 Oct 2004 14:10:35 +0000
Subject: Re: [KJ] [PATCH] scsi/qla_os: replace schedule_timeout() with ssleep()
Message-Id: <20041024141035.GG23059@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32863737065815535=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022235238.GK18906@us.ibm.com>
In-Reply-To: <20041022235238.GK18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============32863737065815535==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 22 Oct 2004, Nishanth Aravamudan wrote:

> Any comments would be, as always, appreciated.
> 
> -Nish
> 
> Description: Use ssleep() instead of schedule_timeout() to guarantee the
> task delays as expected. Change the values of the constants being used
> appropriately. I left the arithmetic there as it was before, even though
> it could be easily simplified away.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

applied to kjt,
to get further testing and to be shure it gets upstream.

thanks

--
maks
kernel janitor          http://janitor.kernelnewbies.org/


--===============32863737065815535==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32863737065815535==--
