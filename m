From: maximilian attems <janitor@sternwelten.at>
Date: Thu, 02 Sep 2004 08:24:33 +0000
Subject: [Kernel-janitors] Re: [patch 8/8] prism54/islpci_dev: replace
Message-Id: <20040902082432.GA1876@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10856884023835889=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200409020850.38177.margitsw@t-online.de>
In-Reply-To: <200409020850.38177.margitsw@t-online.de>
To: Margit Schubert-While <margitsw@t-online.de>
Cc: netdev@oss.sgi.com, kj <kernel-janitors@osdl.org>

--===============10856884023835889==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 02 Sep 2004, Margit Schubert-While wrote:

> I agree with Jean and add the following :
> You are assuming HZ = 1000.
> In 2.4, HZ = 100 (And in 2.6, HZ is not necessarily = 1000).

shure, 
but this is an argument for msleep as it uses msecs as unit,
which don't depend on your arch. 
(well physics says different for arch/relativistic :)

> The prism54 code base is identical between 2.4/2.6 and is
> maintained as such in the project.
> Therefore, I look forward to your implementation of msleep()
> in 2.4  ;-)

2.4 is closed for such stuff, you'll know that better than me,
it shouldn't hinder 2.6 in it's progression.
one day you will need to branch.

--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============10856884023835889==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10856884023835889==--
