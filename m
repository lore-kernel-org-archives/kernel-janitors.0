From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 24 Oct 2004 14:11:21 +0000
Subject: Re: [KJ] [PATCH] cdrom/sonycd535: replace schedule_timeout() with
Message-Id: <20041024141121.GK23059@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30042660514306174=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022235941.GO18906@us.ibm.com>
In-Reply-To: <20041022235941.GO18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============30042660514306174==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 22 Oct 2004, Nishanth Aravamudan wrote:

> Any comments would be, as always, appreciated.
> 
> -Nish
> 
> Description: Use msleep_interruptible() instead of schedule_timeout() to
> guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
applied to kjt,
to get further testing and to be shure it gets upstream.

thanks

--
maks
kernel janitor          http://janitor.kernelnewbies.org/


--===============30042660514306174==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30042660514306174==--
