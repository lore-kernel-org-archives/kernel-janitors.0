From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Wed, 26 Jan 2005 18:04:12 +0000
Subject: Re: [KJ] [PATCH 19/34]: include/jiffies: add usecs_to_jiffies()
Message-Id: <29495f1d0501261004376c457e@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45684022986892225=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050126173632.GA2758@us.ibm.com>
In-Reply-To: <20050126173632.GA2758@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============45684022986892225==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Jan 2005 18:55:51 +0100, walter harms <wharms@bfs.de> wrote:
> 
> hi Nish,
> do we need jiffies_to_msecs() at all ?
> 
> milli is 10E-3   micro is 10E-6
> i would say:
> #define jiffies_to_msecs(VAL) jiffies_to_usecs(1000*VAL)

I am not sure that would work as expected. It would be better to:

#define jiffies_to_msecs(VAL) (jiffies_to_usecs(VAL) / 1000)
#define msecs_to_jiffies(VAL) (usecs_to_jiffies(VAL * 1000))
 
> I have no idea about the range of VAL but uint is ~ 1E9.
> is anyone using something like 1E6 ms = 1E3s to wait ?
> if not we kan simply drop jiffies_to_msecs() (and back).

I would rather see the macro get pushed in and then deal with
optimizing code :) One little tiny itty-bit step at a time, Walter ;)

-Nish

--===============45684022986892225==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45684022986892225==--
