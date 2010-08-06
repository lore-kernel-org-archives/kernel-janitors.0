From: Namhyung Kim <namhyung@gmail.com>
Date: Fri, 06 Aug 2010 12:53:17 +0000
Subject: Re: [PATCH] percpu: remove address_space attribute if !SMP
Message-Id: <1281099197.1655.11.camel@leonhard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281098768-5724-1-git-send-email-namhyung@gmail.com>
	 <4C5C04D8.1080103@kernel.org>
In-Reply-To: <4C5C04D8.1080103@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2010-08-06 (=EA=B8=88), 14:49 +0200, Tejun Heo:
> On 08/06/2010 02:46 PM, Namhyung Kim wrote:
> > percpu data has no special meaning in case of !CONFIG_SMP.
> > This removes lots of sparse warnings.
> >=20
> > Signed-off-by: Namhyung Kim <namhyung@gmail.com>
>=20
> But they should still be accessed through the accessors and if they
> are accessed through accessors, there shouldn't be sparse warnings
> regarding them.  Maybe UP accessors are missing proper markups?  Do
> those warnings only happen on UP config?
>=20

They do nothing on UP.
quoting from include/asm-generic.h:

#else /* ! SMP */

#define per_cpu(var, cpu)			(*((void)(cpu), &(var)))
#define __get_cpu_var(var)			(var)
#define __raw_get_cpu_var(var)			(var)
#define this_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
#define __this_cpu_ptr(ptr) this_cpu_ptr(ptr)

#endif	/* SMP */


--=20
Regards,
Namhyung Kim


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
