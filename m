From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 24 Oct 2004 14:08:27 +0000
Subject: Re: [KJ] [PATCH] input/iforce-packets: insert set_current_state()
Message-Id: <20041024140827.GD23059@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53401145454764998=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022232838.GD18906@us.ibm.com>
In-Reply-To: <20041022232838.GD18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============53401145454764998==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 22 Oct 2004, Nishanth Aravamudan wrote:

> Any comments would be, as always, appreciated.
> 
> -Nish
> 
> Description: Inserts set_current_state() before schedule_timeout().
> Without the insertion, schedule_timeout() will return immediately.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

applied to kjt,
to allow further testing and to be shure it gets upstream.

thanks maks


--===============53401145454764998==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53401145454764998==--
