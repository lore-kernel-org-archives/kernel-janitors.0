From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 24 Oct 2004 14:11:12 +0000
Subject: Re: [KJ] [PATCH] char/snsc: reorder set_current_state() and
Message-Id: <20041024141112.GJ23059@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67384157700933689=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022235744.GN18906@us.ibm.com>
In-Reply-To: <20041022235744.GN18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============67384157700933689==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 22 Oct 2004, Nishanth Aravamudan wrote:

> Any comments would be, as always, appreciated.
> 
> -Nish
> 
> Description: Reorder add_wait_queue() and set_current_state() as a
> signal could be lost in between the two functions.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
applied to kjt,
to get further testing and to be shure it gets upstream.

thanks

--
maks
kernel janitor          http://janitor.kernelnewbies.org/


--===============67384157700933689==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67384157700933689==--
