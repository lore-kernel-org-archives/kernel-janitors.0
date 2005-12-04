From: Roland Dreier <roland@digitalvampire.org>
Date: Sun, 04 Dec 2005 05:06:44 +0000
Subject: Re: [KJ] [PATCH 20/21] polling loops: change exit condition to
Message-Id: <87k6elfo2j.fsf@love-shack.home.digitalvampire.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17466930587012186=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <43923735.4060604@gmail.com>
In-Reply-To: <43923735.4060604@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============17466930587012186==
Content-Type: text/plain; charset=us-ascii

 > Why add a new variable in this second part of the patch? end_time is
 > only used once,so you could just do
 >   while (time_before(jiffies, jiffies + msecs_to_jiffies(100))) {

Umm, think about it... how could that loop ever exit?

The end_time has to be computed before the loop starts and then not
change again.

With that said I'm not sure that these patches are a good idea.  For
example, what if in the code below:

>         /* Wait max 1 Sec for data download and processor to start */
> -       for (index = 0; index < 10; index++) {
> +       end_time = jiffies + msecs_to_jiffies(1000);

this gets preempted for a while and never even enters the loop below:

> +       while (time_before(jiffies, end_time)) {
>                 msleep(100);

then the function will fail without even checking the hardware once.

 - R.

--===============17466930587012186==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17466930587012186==--
