From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 24 Oct 2004 14:07:05 +0000
Subject: Re: [KJ] [PATCH] net/ewrk3: replace schedule_timeout() with
Message-Id: <20041024140705.GC23059@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18376677140584441=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022232643.GC18906@us.ibm.com>
In-Reply-To: <20041022232643.GC18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============18376677140584441==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 22 Oct 2004, Nishanth Aravamudan wrote:

> Any comments would be, as always, appreciated.
> 
> -Nish
> 
> Description: Uses msleep() instead of schedule_timeout() to guarantee
> the task delays as expected.
> 
applied,
didn't check the 2.4 value of that schedule_timeout(),
but old drives may still expect HZ = 100.

thanks maks

--===============18376677140584441==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18376677140584441==--
