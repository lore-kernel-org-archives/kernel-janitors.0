From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 24 Oct 2004 14:10:14 +0000
Subject: Re: [KJ] [PATCH] video/pxafb: reorder add_wait_queue() and
Message-Id: <20041024141014.GF23059@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============098529084210174034=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022234542.GJ18906@us.ibm.com>
In-Reply-To: <20041022234542.GJ18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============098529084210174034==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 22 Oct 2004, Nishanth Aravamudan wrote:

> Any comments would be, as always, appreciated.
> 
> -Nish
> 
> Description: Reorder set_current_state() and add_wait_queue(). There is
> a chance that a signal could be missed in between the two functions
> currently.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

applied to kjt,
to get further testing and to be shure it gets upstream.

thanks 

--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============098529084210174034==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============098529084210174034==--
